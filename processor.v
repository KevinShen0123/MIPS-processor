/**
 * READ THIS DESCRIPTION!
 *
 * The processor takes in several inputs from a skeleton file.
 *
 * Inputs
 * clock: this is the clock for your processor at 50 MHz
 * reset: we should be able to assert a reset to start your pc from 0 (sync or
 * async is fine)
 *
 * Imem: input data from imem
 * Dmem: input data from dmem
 * Regfile: input data from regfile
 *
 * Outputs
 * Imem: output control signals to interface with imem
 * Dmem: output control signals and data to interface with dmem
 * Regfile: output control signals and data to interface with regfile
 *
 * Notes
 *
 * Ultimately, your processor will be tested by subsituting a master skeleton, imem, dmem, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file acts as a small wrapper around your processor for this purpose.
 *
 * You will need to figure out how to instantiate two memory elements, called
 * "syncram," in Quartus: one for imem and one for dmem. Each should take in a
 * 12-bit address and allow for storing a 32-bit value at each address. Each
 * should have a single clock.
 *
 * Each memory element should have a corresponding .mif file that initializes
 * the memory element to certain value on start up. These should be named
 * imem.mif and dmem.mif respectively.
 *
 * Importantly, these .mif files should be placed at the top level, i.e. there
 * should be an imem.mif and a dmem.mif at the same level as process.v. You
 * should figure out how to point your generated imem.v and dmem.v files at
 * these MIF files.
 *
 * imem
 * Inputs:  12-bit address, 1-bit clock enable, and a clock
 * Outputs: 32-bit instruction
 *
 * dmem
 * Inputs:  12-bit address, 1-bit clock, 32-bit data, 1-bit write enable
 * Outputs: 32-bit data at the given address
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for regfile
    ctrl_writeReg,                  // O: Register to write to in regfile
    ctrl_readRegA,                  // O: Register to read from port A of regfile
    ctrl_readRegB,                  // O: Register to read from port B of regfile
    data_writeReg,                  // O: Data to write to for regfile
    data_readRegA,                  // I: Data from port A of regfile
    data_readRegB,
	 data_reg_write	,aluinput, alu_opcode,sximmed,data_writeTwo,enableTwo,overflow, is_j, is_jal,
	 is_bex, is_setx, is_bne, is_blt,pc_in,pc_in1,pc_out,rd_less_than_rs

);


  output is_j, is_jal,is_bex, is_setx, is_bne, is_blt;//change later
  output [31:0]pc_in1;

	//wire is_j, is_jal,is_bex, is_setx, is_bne, is_blt;
	//wire[31:0]pc_in1;

    output [31:0] data_writeTwo;
    // Control signals
    input clock, reset;

    // Imem
    output [11:0] address_imem;
    input [31:0] q_imem;

    // Dmem
    output [11:0] address_dmem;
    output [31:0] data;
    output wren;
    input [31:0] q_dmem;

    // Regfile
    output ctrl_writeEnable;

    output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;



    output [31:0] data_writeReg;
    input [31:0] data_readRegA, data_readRegB;

    /* YOUR CODE STARTS HERE */


    //PC & PC + 4

     wire [31:0] pc_plusone, insn_out;
	  output [31:0] pc_in,pc_out;
	  wire dummy,dummy2;
	  wire[4:0] dummy1; 

    pc pc1(.pc_out(pc_out), .clock(clock), .reset(reset), .pc_in(pc_in));
    alu alu1(pc_out, 32'd1, 5'b00000, 1'b0, pc_plusone, dummy1, dummy2,dummy);   
     //address_imem Kevin's Change
	 assign address_imem=pc_out[11:0];

    //Choose type (R/I)

	 wire F1,F2,F3;
	 cmp c1(F1,q_imem[31:27],5'b00000);
	 cmp c2(F2,q_imem[31:27],5'b00101);
	 cmp c3(F3,q_imem[31:27],5'b01000);
	  // ctrl_writeEnable = 1 when r type, addi,lw

	  wire f1,f2,f3,f4,f5,f6,f7,f8,f9,f10;
	 cmp cmp1(f1,q_imem[31:27],5'b00101);
	  cmp cmp2(f2,q_imem[31:27],5'b00111);
	 cmp cmp3(f3,q_imem[31:27],5'b01000);
	 	cmp cmp7(is_jr,q_imem[31:27],5'b00100);
	 assign lw_yes=f3?1:0;
	 assign sw_yes=f2?1:0;
	 wire sw_jr;
	 or or2(sw_jr,sw_yes,is_jr);
	 //While is bne or blt
	 wire is_bne_blt;
	 or or3(is_bne_blt, is_bne, is_blt);
    assign ctrl_readRegB=F1?q_imem[16:12]:sw_jr?q_imem[26:22]:q_imem[21:17];
   // assign ctrl_writeReg = q_imem[26:22];
    assign ctrl_readRegA = is_bne_blt? q_imem[26:22]:is_bex?5'h1E:q_imem[21:17];
    
	
	 output[31:0] sximmed;
    //sign extend immediate
    sx sx1(sximmed,q_imem[16:0]);
    output[31:0] aluinput;

     assign aluinput=F1?data_readRegB:sximmed;
    //alu
    // Kevin's Change about R types instructions
	 wire isNotEqual, isLessThan;
	 wire [31:0] sign_extendT;
	 output overflow;//The parameter for alu
	 output [4:0] alu_opcode;//If it is R type, then we use q_imem[6:2], otherwise, set default to 00000;
	 assign alu_opcode=f1?5'b00000:f2?5'b00000:f3?5'b00000:q_imem[6:2];
	 output [31:0] data_reg_write;//set a temporary variable for the output for alu
	 alu my_alu(data_readRegA, aluinput, alu_opcode, q_imem[11:7],data_reg_write, isNotEqual, isLessThan, overflow);//call alu
	 wire alu_flag;
	 output enableTwo;
     assign alu_flag=F1?1:F2?1:0;//if it is R type or addi, use alu
	 and and1(enableTwo,alu_flag, overflow);// 
	 cmp cmp4(f4,q_imem[31:27],5'b00000);
	 cmp cmp5(f5,q_imem[6:2],5'b00000);
	 assign data_writeTwo=f4?f5?32'h0001:32'h0003:32'h0002;
	  wire[31:0] s1,s2;
	 //and we will assign data_writeReg to a new value for I-type later.
	 // sw and lw operation
	 assign address_dmem=data_reg_write[11:0];
	 //assign data=data_readRegB;
	 assign wren=sw_yes;
	 assign ctrl_writeReg = enableTwo?5'h1E:is_jal?5'h1F:is_setx?5'h1E:q_imem[26:22];
	 
         //regfile reg1(clock, enableTwo, reset, 5'h1E,
	//   q_imem[26:22], 5'h00, data_writeTwo,s1,s2);// If we need alu and overflow happens, we call regfile to change r30 register by definition
	
	assign data=data_readRegB;
	

	
	//define is_j
	cmp cmp6(is_j,q_imem[31:27],5'b00001);
	//define is_jal
	cmp cmp8(is_jal,q_imem[31:27],5'b00011);
	//define is_setx
	cmp cmp9(is_setx, q_imem[31:27], 5'b10101);
	//define is_bne
	cmp cmp10(is_bne, q_imem[31:27], 5'b00010);
	//define is_blt
	cmp cmp11(is_blt, q_imem[31:27], 5'b00110);
	//deifne is_bex
	cmp cmp12(is_bex, q_imem[31:27], 5'b10110);

	
	//rd rs compare
	wire [1:0] rd_rs_comp, r30_zero_comp;
	wire rd_not_equal_rs,  r30_not_zero, correct_bex, is_j_cbex;
	output rd_less_than_rs;
	comp32 rd_rs_comp32(rd_rs_comp, data_readRegA, data_readRegB);
	xor (rd_not_equal_rs, rd_rs_comp[0], rd_rs_comp[1]);
	alu alu_less_than(.data_operandA(data_readRegA), .data_operandB(data_readRegB), .ctrl_ALUopcode(5'b00001), .isLessThan(rd_less_than_rs));
	
	comp32 r30_0_comp32(r30_zero_comp, data_readRegA, 32'b0);
	xor (r30_not_zero, r30_zero_comp[0], r30_zero_comp[1]);
	
	and (correct_bex, is_bex, r30_not_zero);
	or (is_j_cbex, correct_bex, is_j);
	
	assign pc_in1[31:27] = is_j_cbex ?5'b00000 :is_jal? 5'b00000:is_jr?data_readRegB[31:27]:pc_plusone[31:27] ;
	assign pc_in1[26:0] = is_j_cbex ?q_imem[26:0]:is_jal ?q_imem[26:0]:is_jr?data_readRegB[26:0]:pc_plusone[26:0];
	
	wire [31:0] pc_in2;
	alu alu_pc_in2(.data_operandA(sximmed), .data_operandB(pc_plusone), .ctrl_ALUopcode(5'b00000),.data_result(pc_in2));
	
	
	assign pc_in = is_bne?(rd_not_equal_rs? pc_in2:pc_plusone):is_blt?(rd_less_than_rs?pc_in2:pc_plusone):is_setx?pc_plusone:pc_in1;
	or or1(ctrl_writeEnable,F1,F2,F3,is_setx,is_jal);
	assign data_writeReg=alu_flag?(overflow?data_writeTwo:data_reg_write):lw_yes?q_dmem:is_jal?pc_plusone:is_setx?sign_extendT:data_reg_write;
endmodule

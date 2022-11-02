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
    data_readRegB                   // I: Data from port B of regfile
);
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
     wire [31:0] pc_in, pc_out, insn_out;
    pc pc1(.pc_out(pc_out), .clock(clock), .reset(clock), .pc_in(pc_in));
    alu(pc_out, 32'd1, 5'b00000, 1'b0, pc_in, isNotEqual, isLessThan,overflow);   
     //address_imem Kevin's Change
	 assign address_imem=1?pc_out[11:0]:pc_out[11:0];

    //Choose type (R/I)
	 wire F1;
	 cmp c1(F1,q_imem[31:27],5'b00000);

    assign ctrl_readRegB=F1?q_imem[16:12]:q_imem[21:17];
    assign ctrl_writeReg = q_imem[26:22];
    assign ctrl_readRegA = q_imem[21:17];
    // regfile, need change ctrl_writeenable
    regfile reg1(clock, ctrl_writeEnable, reset, ctrl_writeReg,
	ctrl_readRegA, ctrl_readRegB, data_writeReg, data_readRegA,
	data_readRegB);
    wire sximmed;
    //sign extend immediate
    sx sx1(sximmed,q_imem[16:0]);
    wire aluinput;

     assign aluinput=F1?sximmed:data_readRegB;
    //alu
    // Kevin's Change about R types instructions
	 wire isNotEqual, isLessThan, overflow;//The parameter for alu
	 wire [4:0] alu_opcode;//If it is R type, then we use q_imem[6:2], otherwise, set default to 00000;
	 wire f1,f2,f3,f4,f5,f6,f7,f8,f9,f10;
	 cmp cmp1(f1,q_imem[31:27],5'b00101);
	 cmp cmp2(f2,q_imem[31:27],5'b00111);
	 cmp cmp3(f3,q_imem[31:27],5'b01000);
	 assign alu_opcode=f1?5'b00000:f2?5'b00000:f3?5'b00000:q_imem[6:2];
	 wire [31:0] data_reg_write;//set a temporary variable for the output for alu
	 alu my_alu(data_readRegA, aluinput, alu_opcode, q_imem[11:7],data_reg_write, isNotEqual, isLessThan, overflow);//call alu
	 wire alu_flag;
	 wire enableTwo;
     assign alu_flag=f2?0:f3?0:1;//judge whether we need alu in R type or not, if sw or lw, we do not need alu
	 and and1(enableTwo,alu_flag, overflow);// 
	 cmp cmp4(f4,q_imem[31:27],5'b00000);
	 cmp cmp5(f5,q_imem[6:2],5'b00000);
	 assign data_writeTwo=f4?f5?32'h0001:32'h0003:32'h0002;
	 regfile(clock, enableTwo, ctrl_reset, 32'h001E,
	ctrl_readRegA, ctrl_readRegB, data_writeTwo, data_readRegA,
	data_readRegB);// If we need alu and overflow happens, we call regfile to change r30 register by definition
	 //and we will assign data_writeReg to a new value for I-type later.
	 // sw and lw operation
	 assign lw_yes=f2?1:0;
	 assign sw_yes=f3?1:0;
	 assign address_dmem=1?data_reg_write[11:0]:data_reg_write[11:0];
	 assign data=1?aluinput:aluinput;
	 assign wren=1?sw_yes:sw_yes;
	 assign data_writeReg=alu_flag?data_reg_write:lw_yes?q_dmem:data_reg_write;

endmodule

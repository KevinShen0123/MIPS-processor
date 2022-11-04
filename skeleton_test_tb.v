// ---------- SAMPLE TEST BENCH ----------
`timescale 1 ns / 100 ps
module skeleton_test_tb();
    wire[31:0]aluinput;
    wire[4:0]	alu_opcode;
    reg clock, reset;
	wire [31:0]data_result;
    wire imem_clock, dmem_clock, processor_clock, regfile_clock;
    wire [11:0] address_imem;
    wire [31:0] q_imem;
    wire [11:0] address_dmem;
    wire [31:0] data;
    wire wren;
    wire [31:0] q_dmem;
    wire ctrl_writeEnable;
    wire [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    wire [31:0] data_writeReg;
    wire [31:0] data_readRegA, data_readRegB;

    skeleton_test myskeleton(clock, reset, imem_clock, dmem_clock, processor_clock, regfile_clock,
    address_imem,q_imem,address_dmem,data,wren,q_dmem,ctrl_writeEnable,ctrl_writeReg,ctrl_readRegA, ctrl_readRegB,
    data_writeReg,data_readRegA, data_readRegB,data_result,aluinput, alu_opcode

    );
    // setting the initial values of all the reg
    initial
    begin
        $display($time, " << Starting the Simulation >>");
        clock = 1'b0;    // at time 0
       

        reset = 1'b1;    // assert reset
        @(negedge clock);    // wait until next negative edge of clock
      // wait until next negative edge of clock

        reset = 1'b0;    // de-assert reset
       

 
    end
	 always 
	begin
    clock = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    clock = 1'b0;
    #20; // low for 20 * timescale = 20 ns
	  clock = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    clock = 1'b0;
    #20; // low for 20 * timescale = 20 ns
	  clock = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    clock = 1'b0;
    #20; // low for 20 * timescale = 20 ns
	  clock = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    clock = 1'b0;
    #20; // low for 20 * timescale = 20 ns
	  clock = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    clock = 1'b0;
    #20; // low for 20 * timescale = 20 ns
	  clock = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    clock = 1'b0;
    #20; // low for 20 * timescale = 20 ns
	  clock = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    clock = 1'b0;
    #20; // low for 20 * timescale = 20 ns
	  clock = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    clock = 1'b0;
    #20; // low for 20 * timescale = 20 ns
	  clock = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    clock = 1'b0;
    #20; // low for 20 * timescale = 20 ns
	  clock = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    clock = 1'b0;
    #20; // low for 20 * timescale = 20 ns
	  clock = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    clock = 1'b0;
    #20; // low for 20 * timescale = 20 ns
	  clock = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    clock = 1'b0;
    #20; // low for 20 * timescale = 20 ns
	  clock = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    clock = 1'b0;
    #20; // low for 20 * timescale = 20 ns
	  clock = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    clock = 1'b0;
    #20; // low for 20 * timescale = 20 ns
	 
	  clock = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    clock = 1'b0;
    #20; // low for 20 * timescale = 20 ns
	 

	 
	end



    

endmodule

module regfile(
	clock,
	ctrl_writeEnable,
	ctrl_reset,
	ctrl_writeReg,
	ctrl_readRegA,
	ctrl_readRegB,
	data_writeReg,
	data_readRegA,
	data_readRegB,

);

	input clock, ctrl_writeEnable, ctrl_reset;
	input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB; 
	input [31:0] data_writeReg;	
	output [31:0] data_readRegA, data_readRegB; 
	
	//wire[31:0] w0,w1,w2;
	wire [31:0] w0,w1,w2;
	wire[31:0] q [31:0];
	
	//this part if for write
	write_port write0(w0[31:0],ctrl_writeReg[4:0], ctrl_writeEnable);
	assign q[0] = 32'b0; 
	genvar i;
	generate for(i = 1; i < 32; i = i + 1) begin:register
		d_f df(q[i], data_writeReg[31:0], clock, w0[i], ctrl_reset);
	end
	endgenerate
	
	//read 
	five_to_thirtytwo_decoder d0(w1[31:0],ctrl_readRegA[4:0]);
	genvar j ;
	generate for (j = 0; j < 32; j = j + 1) begin: tri_state_a
		assign data_readRegA = w1[j]? q[j]:32'bz;
	end
	endgenerate 
	
	five_to_thirtytwo_decoder d1(w2[31:0],ctrl_readRegB[4:0]);
	genvar k ;
	generate for (k = 0; k < 32; k = k + 1) begin: tri_state_b
		assign data_readRegB = w2[k]? q[k]:32'bz;
	end
	endgenerate 

	
	
	
	
	

	
endmodule
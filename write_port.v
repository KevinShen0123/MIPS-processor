module write_port(out,ctrl_writeReg, ctrl_writeEnable);
	output [31:0] out;
	input [4:0]ctrl_writeReg;
	input ctrl_writeEnable;
	wire [31:0] w;
	five_to_thirtytwo_decoder d0(w[31:0],ctrl_writeReg[4:0]);
	genvar i;

	generate for (i = 0; i < 32; i = i + 1) begin: and_loop
		and and0(out[i], w[i],ctrl_writeEnable);
	end
	endgenerate

endmodule
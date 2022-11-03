module d_f(q, d, clk, en, clr);
	output [31:0] q;
	input [31:0] d;
	input clk, en, clr;
	genvar i;
	generate for (i = 0; i < 32; i = i + 1) begin: dffe_array
		dffe_ref df(q[i], d[i], clk,en,clr );
	end
	endgenerate 
	
	

endmodule
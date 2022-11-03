module pc(pc_out, clock, reset, pc_in);
	input clock, reset;
	input [31:0] pc_in;
	output [31:0] pc_out;
	
    //generate 32-bit pc
	genvar i;
	generate  
	for(i = 0; i < 32; i = i + 1) begin:pc
		dffe pc_dffe(pc_out[i], pc_in[i], clock, 1'b1, reset);
	end 
	endgenerate
endmodule
module five_to_thirtytwo_decoder(out,a);
	output [31:0] out;
	input [4:0]a;
	wire [3:0]w;
	
	two_to_four_decoder d0(w[3:0],a[4],a[3]);
	three_to_eight_decoder d1(out[7:0],a[2],a[1],a[0],w[0]);
	three_to_eight_decoder d2(out[15:8],a[2],a[1],a[0],w[1]);
	three_to_eight_decoder d3(out[23:16],a[2],a[1],a[0],w[2]);
	three_to_eight_decoder d4(out[31:24],a[2],a[1],a[0],w[3]);
endmodule
	
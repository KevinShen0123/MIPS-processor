module eight_bit_adder(a, b, C_in, C_out, sum);
	input [7:0] a;
	input [7:0] b;
	input C_in;
	output C_out;
	output [7:0] sum;
	wire wi;
	four_bit_adder adder1(a[3:0], b[3:0], C_in, w1, sum[3:0]);
	four_bit_adder adder2(a[7:4], b[7:4], w1, C_out, sum[7:4]);

endmodule
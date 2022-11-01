module four_bit_adder(a, b, C_in, C_out, sum);
	input [3:0] a;
	input [3:0] b;
	input C_in;
	output [3:0] sum;
	output C_out;
	wire wi, w2, w3;
	full_adder adder1(a[0], b[0], C_in, w1, sum[0]);
	full_adder adder2(a[1], b[1], w1, w2, sum[1]);
	full_adder adder3(a[2], b[2], w2, w3, sum[2]);
	full_adder adder4(a[3], b[3], w3, C_out, sum[3]);
endmodule
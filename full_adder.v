module full_adder(a, b, C_in, C_out, sum);
	output C_out;
	output sum;
	input C_in;
	input a;
	input b;
	wire w1, w2, w3, w4;
	xor(w1, a, b);
	and(w3, w1, C_in);
	and(w4, a,b);
	or(C_out, w3, w4);
	xor(sum, w1, C_in);
endmodule

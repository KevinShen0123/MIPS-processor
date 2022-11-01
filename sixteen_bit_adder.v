module sixteen_bit_adder(a, b, C_in, C_out, sum, overflow);
	input [15:0] a;
	input [15:0] b;
	input C_in;
	output C_out;
	output overflow;
	output [15:0] sum;
	wire [15:0] carry;
	full_adder adder1(a[0], b[0], C_in, carry[0], sum[0]);
	/*genvar i;
	generate 
   for(i=1;i<16;i=i+1)
		begin: generate_N_bit_Adder
   full_adder adder(a[i], b[i], carry[i - 1], carry[i], sum[i]);
		end
	assign C_out = carry[15];

	endgenerate
	*/
	full_adder adder2(a[1], b[1], carry[0], carry[1], sum[1]);
	full_adder adder3(a[2], b[2], carry[1], carry[2], sum[2]);
	full_adder adder4(a[3], b[3], carry[2], carry[3], sum[3]);
	full_adder adder5(a[4], b[4], carry[3], carry[4], sum[4]);
	full_adder adder6(a[5], b[5], carry[4], carry[5], sum[5]);
	full_adder adder7(a[6], b[6], carry[5], carry[6], sum[6]);
	full_adder adder8(a[7], b[7], carry[6], carry[7], sum[7]);
	full_adder adder9(a[8], b[8], carry[7], carry[8], sum[8]);
	full_adder adder10(a[9], b[9], carry[8], carry[9], sum[9]);
	full_adder adder11(a[10], b[10], carry[9], carry[10], sum[10]);
	full_adder adder12(a[11], b[11], carry[10], carry[11], sum[11]);
	full_adder adder13(a[12], b[12], carry[11], carry[12], sum[12]);
	full_adder adder14(a[13], b[13], carry[12], carry[13], sum[13]);
	full_adder adder15(a[14], b[14], carry[13], carry[14], sum[14]);
	full_adder adder16(a[15], b[15], carry[14], C_out, sum[15]);
	xor(overflow, carry[14], C_out);
	
	

endmodule
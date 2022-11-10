module shiftright(data, shiftamt, result);
	input [31:0] data;
	input [4:0] shiftamt;
	
	output [31:0] result;
	wire [31:0] w0;
	wire [31:0] w1;
	wire [31:0] w2;
	wire [31:0] w3;
	wire [31:0] w4;
	
	
	//first shift with 0
	mux mux0_0(data[31], data[31], shiftamt[0], w0[0]);

	//second shift with 0
	mux mux1_0(data[31], w0[0], shiftamt[1], w1[0]);
	mux mux1_1(data[31], w0[1], shiftamt[1], w1[1]);
	
	//third shift with 0
	
	

	
	genvar i;
	generate for (i = 0; i < 4; i = i + 1) begin: zero_for_third_loop
		mux mux2_0(data[31], w1[i], shiftamt[2], w2[i]);
	end
	
	for (i = 0; i < 8; i = i + 1) begin: zero_for_fourth_loop
		mux mux3_0(data[31], w2[i], shiftamt[3], w3[i]);
	end
	for (i = 0; i < 16; i = i + 1) begin: zero_for_fifth_loop
		mux mux4_0(data[31], w3[i], shiftamt[4], w4[i]);
	end
	endgenerate
	
	
	genvar j;
	//first shift
	generate for (j=0; j<31; j=j+1) begin: first_loop	
		mux mux0(data[31 - j], data[31 - (j + 1)], shiftamt[0], w0[j + 1]);
	
	end 

	//2nd shift
	for (j = 0; j <30 ; j = j + 1) begin: second_loop	
		mux mux1(w0[j], w0[j + 2], shiftamt[1], w1[j + 2]);
	
	end 
	
	// 3rd shift
	
	for (j = 0; j <28; j = j + 1 ) begin: third_loop
		mux mux2(w1[j], w1[j + 4], shiftamt[2], w2[j + 4]);
	end
	
	//4th shift
	
	for (j = 0; j <24; j = j + 1 ) begin: fourth_loop
		mux mux3(w2[j], w2[j + 8], shiftamt[3], w3[j + 8]);
	end
	
	
	for (j = 0; j <16; j = j + 1 ) begin: fifth_loop
		mux mux4(w3[j], w3[j + 16], shiftamt[4], w4[j + 16]);
	end
	
	for (j = 0; j < 32; j = j + 1) begin: asign
		assign result[j] = w4[31 - j];
	end
	
	
	endgenerate
	
	

	
endmodule

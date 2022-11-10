module csa(data_operandA, data_operandB, ctrl_ALUopcode, data_result, overflow, isNotEqual, isLessThan);

	input [31:0] data_operandA, data_operandB; input [4:0] ctrl_ALUopcode;
	output isNotEqual, isLessThan;
	output [31:0] data_result;
	output overflow;
	wire cout1,cout2,cout3;
	wire overflow1, overflow3;
	wire overflow2;
	wire w3;
	wire [31:0] w1;

	wire [15:0] w2;
	wire [15:0] nb1;
	wire [15:0] nb2;

	wire [15:0] sum1,sum2, sum3;


	wire [31:0] nb;


	not not3[31:0](nb, data_operandB[31:0]);

	mux mux1[31:0](nb[31:0], data_operandB[31:0], ctrl_ALUopcode[0], w1);

	sixteen_bit_adder adder3(w1[15:0], data_operandA[15:0], ctrl_ALUopcode[0] , cout3, data_result[15:0], overflow3);
	
	sixteen_bit_adder adder2(w1[31:16], data_operandA[31:16], 1'b0, cout2, sum2, overflow2);
	sixteen_bit_adder adder1(w1[31:16], data_operandA[31:16], 1'b1, cout1, sum1, overflow1);
	
	or or1(isNotEqual, data_result[0], data_result[1], data_result[2], data_result[3],
	   data_result[4], data_result[5], data_result[6], data_result[7], data_result[8],
	   data_result[9], data_result[10], data_result[11], data_result[12], data_result[13],
		data_result[14], data_result[15], data_result[16], data_result[17], data_result[18],
	   data_result[19], data_result[20], data_result[21], data_result[22], data_result[23],
		data_result[24], data_result[25], data_result[26], data_result[27], data_result[28],
	   data_result[29], data_result[30], data_result[31]);
		
	xor xor1(isLessThan, data_result[31], overflow);
	

	
	mux mux3[15:0](sum1, sum2, cout3, data_result[31:16]);
	
	mux mux4(overflow1, overflow2, cout3, overflow);

endmodule
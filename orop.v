module orop(data_operandA, data_operandB, dataout);
	input [31:0] data_operandA;
	input [31:0] data_operandB;
	output [31:0] dataout;
	or or1[31:0](dataout[31:0], data_operandA[31:0], data_operandB[31:0]);








endmodule
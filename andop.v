module andop(data_operandA, data_operandB, dataout);
	input [31:0] data_operandA;
	input [31:0] data_operandB;
	output [31:0] dataout;
	and and1[31:0](dataout[31:0], data_operandA[31:0], data_operandB[31:0]);








endmodule
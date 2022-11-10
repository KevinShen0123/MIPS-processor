module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);
	
	input [31:0] data_operandA, data_operandB; input [4:0] ctrl_ALUopcode, ctrl_shiftamt;
	output [31:0] data_result;
	output isNotEqual, isLessThan, overflow;

	wire [31:0] sl,sr,adsub,andd,orr, w0,w1,w2,w3;
	
	shiftleft left(data_operandA, ctrl_shiftamt, sl);
	shiftright right(data_operandA, ctrl_shiftamt, sr);
	csa csa(data_operandA, data_operandB, ctrl_ALUopcode, adsub, overflow, isNotEqual, isLessThan);
	andop andop(data_operandA, data_operandB, andd);
	orop orop(data_operandA, data_operandB, orr);
	
	
	mux mux0[31:0](sr[31:0], sl[31:0], ctrl_ALUopcode[0], w0[31:0]);
	mux mux1[31:0](orr[31:0], andd[31:0], ctrl_ALUopcode[0], w1[31:0]);
	mux mux2[31:0](adsub[31:0], w0[31:0], ctrl_ALUopcode[1], w2[31:0]);
	mux mux3[31:0](w1[31:0], adsub[31:0], ctrl_ALUopcode[1], w3[31:0]);
	mux mux4[31:0](w2[31:0], w3[31:0], ctrl_ALUopcode[2], data_result[31:0]);
	
	
endmodule
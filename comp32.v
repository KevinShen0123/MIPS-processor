module comp32(output_comp32, inputA, inputB);

 input[31:0] inputA, inputB;
 output [1:0] output_comp32;
 wire dummy;
 wire isNotEqual, isLessThan;
 
 
 alu alu_comp32(.data_operandA(inputA), .data_operandB(inputB), .ctrl_ALUopcode(5'b00001), .isNotEqual(isNotEqual), .isLessThan(isNotEqual));
 
 //equal:0, less than: 1, larger than: 2
 
 assign output_comp32 = isNotEqual? (isLessThan? 2'd1 : 2'd2) : 2'd0;
 
 endmodule
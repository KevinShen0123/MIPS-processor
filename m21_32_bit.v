module m21_32_bit(data_operandB, w1, ctrl, out);
   input [31:0] data_operandB, w1;
   input ctrl;
	
	output [31:0] out;
	
	wire[31:0] w1;
	
	
	
	//m21(w1[31:0], data_operandB[31:0], ctrl_ALUopcode[0], w2[31:0]);//cannot use this
		// Declare the loop variable
genvar j;
 
// generate for block
generate
  for (j = 0; j < 32; j = j + 1) begin: mux1
    // Code to execute
	 m21 mux_onei(data_operandB[j], w1[j], ctrl, out[j]);
  end
endgenerate

endmodule

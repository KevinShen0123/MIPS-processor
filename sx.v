module sx(data_result, immed);
input[16:0] immed;
output [31:0] data_result;
wire [31:0]data_resultA, data_resultB;

assign data_resultA = {15'h0000, immed[16:0]};
assign data_resultB = {15'h7fff, immed[16:0]};

assign data_result = immed[16]?data_resultB:data_resultA;


endmodule
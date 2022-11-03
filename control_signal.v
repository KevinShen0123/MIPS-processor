module control_signal(ALUinB, DMwe, Rwe,Rdst, Rwd,opcode);
    output ALUinB, DMwe,Rwe,Rdst,Rwd;

    input [4:0]opcode;
 
    wire [31:0]extendop;
    wire [31:0]extendaluop;
    wire in_addi,in_sw,in_lw;
    five_to_thirtytwo_decoder(extendop,opcode);
    five_to_thirtytwo_decoder(extendaluop,aluopcode);
    //assign instructions

    assign in_addi = extendop[5];

    assign in_sw = extendop[7];
    assign in_lw = extendop[8];
    //assign control unit
    or or1(ALUinB,in_addi,in_lw,in_sw);
    assign DMwe = in_sw;
    or or2(Rwe,extendop[0],in_addi,in_lw);
    assign Rdst=extendop[0];
    assign Rwd =in_lw;

    
    

endmodule
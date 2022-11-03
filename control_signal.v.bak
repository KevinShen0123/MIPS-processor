module control_signal(BR, JP, ALUinB, ALUop, DMwe, Rwe,Rdst, Rwd,opcode,aluopcode)
    output BR,JP,ALUinB, DMwe,Rwe,Rdst,Rwd;
    output [4:0]ALUop;
    input [4:0]opcode;
    input [4:0]aluopcode
    wire [31:0]extendop
    wire [31:0]extendaluop
    wire in_add,in_addi,in_sub,in_or,in_sll,in_sra,in_sw,in_lw;
    five_to_thirtytwo_decoder(extendop,opcode);
    five_to_thirtytwo_decoder(extendaluop,aluopcode);
    //assign instructions
    and and1(in_add,extendop[0],extendaluop[0]);
    assign in_addi = extendop[5];
    and and2(in_sub,extendop[0],extendaluop[1]);
    and and3(in_or,extendop[0],extendaluop[3]);
    and and4(in_sll,extendop[0],extendaluop[4]);
    and and5(in_sra,extendop[0],extendaluop[5]);
    assign in_sw = extendop[7];
    assign in_lw = extendop[8];
    //assign control unit
    or or1(ALUinB,in_addi,in_lw,in_sw);
    assign DMwe = in_sw;
    or or2(Rwe,in_add,in_addi,in_lw);
    assign Rdst=in_add
    assign Rwd =lw

    
    

endmodule
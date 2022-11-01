module two_to_four_decoder(out,a,b);
	input a,b;
	output [3:0]out;
	wire nota,notb;
	not not0(nota,a);
	not not1(notb,b);
	and and0(out[0],nota,notb);
	and and1(out[1],nota,b);
	and and2(out[2],a,notb);
	and and3(out[3],a,b);
	
	


endmodule
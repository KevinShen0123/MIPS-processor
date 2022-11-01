module three_to_eight_decoder(out,a,b,c,en);
	output [7:0] out;
	input en;
	input a,b,c;
	wire abar,bbar,cbar;
	not not0(abar,a);
	not not1(bbar,b);
	not not2(cbar,c);
	
	and and0(out[0],abar,bbar,cbar,en);
	and and1(out[1],abar,bbar,c,en);
	and and2(out[2],abar,b,cbar,en);	
	and and3(out[3],abar,b,c,en);
	and and4(out[4],a,bbar,cbar,en);
	and and5(out[5],a,bbar,c,en);	
	and and6(out[6],a,b,cbar,en);
	and and7(out[7],a,b,c,en);


	

endmodule
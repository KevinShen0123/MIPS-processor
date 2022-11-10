module mux(a, b, s, out);
	input a;	
	input b;
	input s;
	output out;
	wire sbar;
	wire w1, w2;
	and and1(w1, a, s);
	not not1(sbar,s);
	and and2(w2, b, sbar);
	or or1(out, w1, w2);
endmodule
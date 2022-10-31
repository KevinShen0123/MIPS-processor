module m21(M, N, S, Out);

//choose M when S = 0
//choose N when S = 1
input M, N, S;
output Out;
wire w1, w2, w3;


not(w1, S);
and(w2, M, w1);
and(w3, S, N);
or(Out, w2, w3);

endmodule

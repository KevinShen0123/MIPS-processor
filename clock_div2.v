module clock_div2 (clock_out, clock, reset);
     output reg clock_out;
     input clock;
     input reset;

     always @(posedge clock)
     begin
     if (reset)
          clock_out <= 1'b0;
     else
          clock_out <= ~clock_out;	
     end
endmodule
module D_ff_80b(in,out,clk,reset);
  
  input clk, reset;
  input [79:0]in;
  output reg[79:0]out;
  
  always@(posedge clk)
  begin
    if(~reset)
      out <= 80'b0;
    else
      out <= in;
  end
endmodule

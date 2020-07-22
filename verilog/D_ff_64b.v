module D_ff_64b(in,out,clk,reset);
  
  input clk, reset;
  input [63:0]in;
  output reg[63:0]out;
  
  always@(posedge clk)
  begin
    if(~reset)
      out <= 64'b0;
    else
      out <= in;
  end
endmodule

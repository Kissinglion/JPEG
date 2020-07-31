module D_ff_6b(in,out,clk,reset);
  
  input clk, reset;
  input [5:0]in;
  output reg[5:0]out;
  
  always@(posedge clk)
  begin
    if(~reset)
      out <= 6'b0;
    else
      out <= in;
  end
endmodule



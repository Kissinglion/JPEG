module D_ff_4b(in,out,clk,reset);
  
  input clk, reset;
  input [3:0]in;
  output reg[3:0]out;
  
  always@(posedge clk)
  begin
    if(~reset)
      out <= 4'b0;
    else
      out <= in;
  end
endmodule



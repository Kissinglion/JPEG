module RLE(in,out,clk,reset);
  
  input [7:0]in;
  input clk,reset;
  output wire[7:0]out;
  
  wire [2:0]count;
  wire [2:0]run;
  reg [1:0]zero;


  assign out = in ? in : 0;
  assign run = in ? 0  : count;
  assign count = in ? 0 : count ? 3'b010 : 3'b001;
  //state 1 : not zero
  //state 2 : zero first
  //state 3 : zero still
  //state 4 : 
  /*
  always @(*)
  begin
    if (in == 8'b0)
    begin
      count = 1'b1;
      zero = 1'b1;
    end
    else if ((in ==0) && (zero == 1'b1))
    begin
      count = count + 1'b1;
      zero = 1'b1;
    end
    else if ((in != 0) && (zero == 1'b1))
    begin
      run = count;
      count = 0;
      out = in;
      zero = 2'b01;
    end
    else
      run = 3'b0;
      out = in;
      zero = 2'b10;
  end
  */
endmodule
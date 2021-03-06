module test(in,out,a1,a2,clk,reset);
  
  input [9:0]in;
  input [2:0]a1,a2;
  input clk,reset;
  output reg[39:0]out;
  
  reg [1:0]i;
  reg [10:0]count;
  reg [10:0]address;
  wire [4:0] in1 [1:0];
  
  assign in1[0] = in[4:0];
  assign in1[1] = in[9:5];
  
  always @(posedge clk)
  begin
    if (~reset)
    begin
      count = 0;
      address= 0;
      i = 0;
    end
    else
      count = count + 1'b1;
  end
  
  always @(posedge clk)
  begin
    if (count > a2)
      begin
        address = address + 1'b1;
        i = i + 1;
      end
    else if (count > a1)
      address = address + 1'b1;
    else
      address = address;
  end
  
  always @(*)
  begin
    out[39-(address*5)-:5] = in1[i];
  end
  
endmodule
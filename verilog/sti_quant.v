module sti_quant;
  
  reg clk;
  reg reset;
  reg [63:0]in;
  wire [71:0]out;
  //wire [2:0]run;
  
  initial
  begin
  	clk <= 1;
  	reset <= 0;
  	#10
  	reset <= 1;
  	#10
  	in <= 64'b00000000_00001100_00011111_00000000_00000000_00000000_00000000_00000001;
  end
  
  always #5 clk <= ~clk;
  
  Quantization TEST(in,out,clk,reset); // define input & output ports of your top module by youself 
  


endmodule



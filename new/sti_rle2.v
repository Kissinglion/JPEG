module sti_rle2;

reg clk;
reg reset;
reg [63:0]in;
wire [95:0]out;


initial
begin
 	clk <= 1;
	reset <= 0;
	#20
	reset <= 1;
  #10
  in <= 64'h42_04_00_00_0D_00_00_00;
  #10
  in <= 64'h00_0C_00_03_01_02_00_00;
  #10
  in <= 64'hF2_00_00_00_00_70_07_00;
  #10
  in <= 64'h0B_FF_00_00_00_00_00_00;
  #10
  in <= 64'h01_FF_00_00_0D_00_00_00;
  #10
  in <= 64'h00_05_02_00_01_00_00_00;
  #10
  in <= 64'h00_00_00_00_00_00_00_07;
  #10
  in <= 64'h00_00_00_00_00_00_00_00;
  
end

always #5 clk <= ~clk;

RLE_top3 TEST(in,out,clk,reset); // define input & output ports of your top module by youself 



endmodule


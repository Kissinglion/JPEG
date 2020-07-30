module Decoding(in,out,clk,reset);
  
  input in;
  input clk,reset;
  output out;
  
  reg [9:0]count;
  wire [111:0]mem_out;
  
  
  //SRAM16384x112 MEM_IN(1'b0,mem_in,address,1'b0,clk, mem_out);
  
  assign run1 = mem_out[111:106];
  assign run2 = mem_out[97:92];
  assign run3 = mem_out[83:78];
  assign run4 = mem_out[69:64];
  assign run5 = mem_out[55:50];
  assign run6 = mem_out[41:36];
  assign run7 = mem_out[27:22];
  assign run8 = mem_out[13:8];
  
  assign level1 = mem_out[105:98];
  assign level2 = mem_out[91:84];
  assign level3 = mem_out[77:70];
  assign level4 = mem_out[63:56];
  assign level5 = mem_out[49:42];
  assign level6 = mem_out[35:28];
  assign level7 = mem_out[21:14];
  assign level8 = mem_out[7:0];
  
  
  always @(*)
  begin
    if(run1 == 6'b111111)
      terminate = 1'b1;
    else
      begin
        index1 = run1
        a[64-(index1*8)-:8] = level1;
      end
    if(run2 == 6'b111111)
      terminate = terminate + 1'b1;
    else
      begin
        index2 = index1 + run2;
        if(index2 >= 8)
          a = a;
        else
          a[64-(index2*8)-:8] = level2;
      end
  end
    
  
  
  always @(posedge clk)
  begin
    if(~reset)
      count = 0;
    else
      count = count + 1;
  end
  
  always @(*)
  begin
    
endmodule
  
  

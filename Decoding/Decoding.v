module Decoding(clk,reset);
  
  input clk,reset;

  wire [15:0]count1;
  wire [63:0]DIN1;
  reg [13:0]address;
  wire [111:0]mem_out;
  wire [5:0]run1,run2,run3,run4,run5,run6,run7,run8,out_next,in_next,previous,next1,next2;
  wire [7:0]level1,level2,level3,level4,level5,level6,level7,level8;
  wire sram_en;
  
  reg [9:0]count;
  reg [511:0]a;
  reg [5:0]index1,index2,index3,index4,index5,index6,index7,index8;
  
  
  SRAM16384x112 MEM_IN(1'b1,112'b0,address[13:1],address[0],1'b0,clk, mem_out);
  //SRAM32768x64 MEM_IN(1'b1,64'b0,count1[14:4],count1[3:0],1'b0,clk, DIN1 );
  
  always @(*)
  begin
    if(~reset)
      address = 0;
    else
      if(sram_en)
        address = address + 1'b1;
      else
        address = address;
  end
  
  /*
  assign run1 = mem_out[111:106];
  assign run2 = mem_out[97:92];
  assign run3 = mem_out[83:78];
  assign run4 = mem_out[69:64];
  assign run5 = mem_out[55:50];
  assign run6 = mem_out[41:36];
  assign run7 = mem_out[27:22];
  assign run8 = mem_out[13:8];
  */
  
  assign level1 = mem_out[105:98];
  assign level2 = mem_out[91:84];
  assign level3 = mem_out[77:70];
  assign level4 = mem_out[63:56];
  assign level5 = mem_out[49:42];
  assign level6 = mem_out[35:28];
  assign level7 = mem_out[21:14];
  assign level8 = mem_out[7:0];
  
  RLD     	 rd1(mem_out,in_next,out_next,previous,sram_en,run1,run2,run3,run4,run5,run6,run7,run8);
  
  D_ff_6b   df1(run8,next1,clk,reset);
  D_ff_6b   df2(out_next,next2,clk,reset);
  
  assign previous = (count[2:0] == 2) ? 6'b111111 : next1;
  assign in_next = (count ==2) ? 6'd0 : (count[2:0] ==2) ? next2 - 1'b1 : next2;
  
  always @(*)
  begin
    if(count==0)
      a = 0;
    else
      begin
      if(run1 == 6'b111111)
        index1 = 0;
      else
        begin
          index1 = run1;
          a[511-(index1*8)-:8] = level1;
        end
      if(run2 == 6'b111111)
        index2 = 0;
      else
        begin
          index2 = run2;
          a[511-(index2*8)-:8] = level2;
        end
      if(run3 == 6'b111111)
        index3 = 0;
      else
        begin
          index3 = run3;
          a[511-(index3*8)-:8] = level3;
        end
      if(run4 == 6'b111111)
        index4 = 0;
      else
        begin
          index4 = run4;
          a[511-(index4*8)-:8] = level4;
        end
      if(run5 == 6'b111111)
        index5 = 0;
      else
        begin
          index5 = run5;
          a[511-(index5*8)-:8] = level5;
        end
      if(run6 == 6'b111111)
        index6 = 0;
      else
        begin
          index6 = run6;
          a[511-(index6*8)-:8] = level6;
        end
      if(run7 == 6'b111111)
        index7 = 0;
      else
        begin
          index7 = run7;
          a[511-(index7*8)-:8] = level7;
        end
      if(run8 == 6'b111111)
        index8 = 0;
      else
        begin
          index8 = run8;
          a[511-(index7*8)-:8] = level8;
        end
      end
  end
    
  
  
  always @(posedge clk)
  begin
    if(~reset)
      count = 0;
    else
      count = count + 1;
  end
  

    
endmodule
  
  

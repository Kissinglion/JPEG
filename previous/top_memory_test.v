module top_memory_test (clk,reset);
  
  input clk,reset;

  
  wire [15:0]count1;
  wire [14:0]count2;
  wire [63:0]DCT_out11,tp_out1,tp_out2,DIN2;
  wire [63:0]tp_out3,tp_out4,DO,out;
  wire [63:0]DIN1,DCT_out1,DCT_out2;
  wire en1,en3;


  SRAM32768x80 MEM_OUT(1'b0,out,count2[14:4],count2[3:0],1'b0,clk, DO);
  SRAM32768x64 MEM_IN(1'b1,64'b0,count1[14:4],count1[3:0],1'b0,clk, DIN1 );
  
  DCT_first     d1(DIN1,DCT_out1);
  DCT_second    d2(DIN2,DCT_out2,count1[2:0]);
  
  TPmem1 TP1(DCT_out1, en1,clk,reset,tp_out1);
  TPmem1 TP2(DCT_out1,~en1,clk,reset,tp_out2);
  TPmem2 TP3(DCT_out2, en3,clk,reset,tp_out3);
  TPmem2 TP4(DCT_out2,~en3,clk,reset,tp_out4);
  
  counter  cnt1(count1,clk,reset);
  counter2 cnt2(count1,count2,clk,reset);
  
  TPcontrol tp1(count1[3:0],en1,en3,clk,reset);
  
  assign DIN2 = en1 ? tp_out2 : tp_out1;
  assign out =  en3 ? tp_out4 : tp_out3;
endmodule

module counter(count,clk,reset);
  
  input clk,reset;
  output reg [15:0]count;
  
  always @(posedge clk)
  begin
    if(~reset)
      count <= 16'b0;
    else
      if(count == 16'b1111111111111111)
        count <= count;
      else
        count <= count + 1'b1;
  end
endmodule

module counter2(count1,count2,clk,reset);
  
  input clk,reset;
  input [15:0]count1;
  output reg [14:0]count2;
  
  always @(posedge clk)
  begin
    if(~reset)
      count2 <= 15'b0;
    else
      begin
        if(count1 <= 16'h0012)//18
          count2 <= 15'b0;
        else
          begin
            if(count2 == 15'b111111111111111)
              count2 <= count2;
            else
              count2 <= count2 + 1'b1;
          end
      end
  end
endmodule
 
     
module TPcontrol(count,en1,en3,clk,reset);
  
input [3:0]count;
input clk,reset;
output reg en1,en3;
  
  always @(posedge clk)
  begin
    if(count == 4'b0000)
      en1 <= 1'b1;
    else
      begin
        if(count[2:0] == 3'b000)      
          en1 <= ~en1;
      end
  end

  always @(posedge clk)
    if(count==4'b1001)
      	en3<=1'b1;
    else if(count[2:0] == 3'b001)
        en3<=(~en3);
    
endmodule
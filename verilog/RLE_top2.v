module RLE_top2(in,out_temp,clk,reset);
  
  input [63:0]in;
  input clk,reset;
  
  output reg [95:0]out_temp;
  
  //output [95:0]out;
  wire [63:0]in_temp,out_temp1;
  wire [3:0]next1,count2,in_next,out_next;
  wire en1,en2,en3,en4,en5,en6,en7,en8;
  wire [3:0]run1,run2,run3,run4,run5,run6,run7,run8;
  wire [7:0]in1,in2,in3,in4,in5,in6,in7,in8;
  
  reg[11:0]out_temp2;
  reg [5:0]count1;
  reg [3:0]count,pre_count,pp;
  reg [3:0]cnt1,cnt2,cnt3,cnt4,cnt5,cnt6,cnt7,cnt8;
  
  reg[3:0]next;
  reg start;
  
  D_ff_64b  df1(in,in_temp,clk,reset);
  D_ff_4b   df2(out_next,next1,clk,reset);
  
  RLE2  r1(in_temp,in_next,out_next,count2,en1,en2,en3,en4,en5,en6,en7,en8,run1,run2,run3,run4,run5,run6,run7,run8);
  
  //SRAM512x16 MEM_OUT(1'b0,out_temp1,11'd0,count1,1'b0,clk, DO);
  
  assign in_next = (count1 == 0) ? 0 : next1;
  
  assign in1 = in_temp[63:56];
  assign in2 = in_temp[55:48];
  assign in3 = in_temp[47:40];
  assign in4 = in_temp[39:32];
  assign in5 = in_temp[31:24];
  assign in6 = in_temp[23:16];
  assign in7 = in_temp[15:8];
  assign in8 = in_temp[7:0];
  
  //assign out = count1[3] ? out_temp[95:0] : out_temp[191:96];
  
  
  always@(posedge clk)
  begin
    pp <= pre_count;
    next <= next1;
  end
  
  always @(posedge clk)
  begin
    if(~reset)
      count1 <= -1;
    else
      count1 <= count1 + 1;
  end
  
  

  
  always @(*)
  begin
    if(en1)
      begin
        if(count1 ==1)
          begin
            cnt1 = en1;
            out_temp[(cnt1-1)*12+:12] = {run1,in1};
            //out_temp2 = {run1,in1};
          end
        else
          begin
            cnt1 = en1 + pp;
            out_temp[(cnt1-1)*12+:12] = {run1,in1};
            out_temp2 = {run1,in1};
          end
      end
    else
      begin
        if(count1 ==1)
          begin
            cnt1 = 0;
          end
        else
          cnt1 = pp;
      end
    if(en2)
      begin
        cnt2 = cnt1 + en2;
        out_temp[(cnt2-1)*12+:12] = {run2,in2};
        out_temp2 = {run2,in2};
      end
    else
      cnt2 = cnt1;
    if(en3)
      begin
        cnt3 = cnt2 + en3;
        out_temp[(cnt3-1)*12+:12] = {run3,in3};
        out_temp2 = {run3,in3};
      end
    else
      cnt3 = cnt2;
    if(en4)
      begin
        cnt4 = cnt3 + en4;
        out_temp[(cnt4-1)*12+:12] = {run4,in4};
        out_temp2 = {run4,in4};
      end
    else
      cnt4 = cnt3;
    if(en5)
      begin
        cnt5 = cnt4 + en5;
        out_temp[(cnt5-1)*12+:12] = {run5,in5};
        out_temp2 = {run5,in5};
      end
    else
      cnt5= cnt4;
    if(en6)
      begin
        cnt6 = cnt5 + en6;
        out_temp[(cnt6-1)*12+:12] = {run6,in6};
        out_temp2 = {run6,in6};
      end
    else
      cnt6 = cnt5;
    if(en7)
      begin
        cnt7 = cnt6 + en7;
        out_temp[(cnt7-1)*12+:12] = {run7,in7};
        out_temp2 = {run7,in7};
      end
    else
      cnt7 = cnt6;
    if(en8)
      begin
        cnt8 = cnt7 + en8;
        pre_count = cnt8;
        out_temp[(cnt8-1)*12+:12] = {run8,in8};
        out_temp2 = {run8,in8};
      end
    else
      begin
        cnt8 = cnt7;
        pre_count = cnt8;
      end
  end
endmodule

module RLE_top(in,out,clk,reset);
  
  input [63:0]in;
  input clk,reset;
  
  output reg[111:0]out;
  
  reg[223:0]out_temp;
  reg en,e1,e2,e3,e4,e5,e6,e7,e8;
  reg [13:0]address;
  
  wire [111:0]DO;
  wire [63:0]in_temp;
  wire [5:0]next1,in_next,out_next;
  wire en1,en2,en3,en4,en5,en6,en7,en8;
  wire [5:0]run1,run2,run3,run4,run5,run6,run7,run8;
  wire [7:0]in1,in2,in3,in4,in5,in6,in7,in8;
  
  reg [3:0]count,count2;
  reg [3:0]count1,pre_count,pp;
  reg [3:0]cnt1,cnt2,cnt3,cnt4,cnt5,cnt6,cnt7,cnt8,cnt9;
  reg [5:0]next;

  
  D_ff_64b  df1(in,in_temp,clk,reset);
  D_ff_6b   df2(out_next,next1,clk,reset);
  
  RLE  r1(in_temp,in_next,out_next,en1,en2,en3,en4,en5,en6,en7,en8,run1,run2,run3,run4,run5,run6,run7,run8);
  
  SRAM16384x112 MEM_OUT(1'b0,out,(address-1'b1),1'b0,clk, DO);
  
  
  assign in_next = (count1[2:0] == 1) ? 6'b0 : next1;
  
  assign in1 = in_temp[63:56];
  assign in2 = in_temp[55:48];
  assign in3 = in_temp[47:40];
  assign in4 = in_temp[39:32];
  assign in5 = in_temp[31:24];
  assign in6 = in_temp[23:16];
  assign in7 = in_temp[15:8];
  assign in8 = in_temp[7:0];
  
  always @(*)
  begin
    if (~reset)
      address = 0;
    else
      begin
        if(out)
          address = address + 1'b1;
        else
          address = address;
      end
  end

  always @(*)
  begin
    if((count[3]))
      begin
        out = out_temp[223:112];
      end
    else
      out = out_temp[111:0];
  end

  always@(posedge clk)
  begin
    pp <= pre_count;
    next <= next1;
  end
  
  always @(posedge clk)
  begin
    if(~reset)
      begin
        count1 <= -1;
        count2 <= -1;
      end
    else
      begin
        	count1 <= count1 + 1;
        if(count2 != 2)
          count2 <= count2 + 1;
        else
          count2 <= count2;
      end
  end
  
  
  always @(*)
  begin
    if(en1)
      begin
        if(count2 ==1)
          begin
            cnt1 = 0;
            count = cnt1;
            out_temp[223-(count*14)-:14] = {run1,in1};
          end
        else
          begin
            cnt1 = pp+en1;
            count = cnt1;
            out_temp[223-(count*14)-:14] = {run1,in1};
          end
      end
    else
      begin
        if(count2 ==1)
          begin
            cnt1 = 0;
            count = 0;
          end
        else
          cnt1 = pp;
          count = pp;
      end
    if(en2)
      begin
        cnt2 = cnt1 + en2;
        count = cnt2;
        out_temp[223-(count*14)-:14] = {run2,in2};
        //out_temp2 = {run2,in2};
      end
    else
      cnt2 = cnt1;
    if(en3)
      begin
        cnt3 = cnt2 + en3;
        count = cnt3;
        out_temp[223-(count*14)-:14] = {run3,in3};
        //out_temp2 = {run3,in3};
      end
    else
      cnt3 = cnt2;
    if(en4)
      begin
        cnt4 = cnt3 + en4;
        count = cnt4;
        out_temp[223-(count*14)-:14] = {run4,in4};
        //out_temp2 = {run4,in4};
      end
    else
      cnt4 = cnt3;
    if(en5)
      begin
        cnt5 = cnt4 + en5;
        count = cnt5;
        out_temp[223-(count*14)-:14] = {run5,in5};
        //out_temp2 = {run5,in5};
      end
    else
      cnt5= cnt4;
    if(en6)
      begin
        cnt6 = cnt5 + en6;
        count = cnt6;
        out_temp[223-(count*14)-:14] = {run6,in6};
        //out_temp2 = {run6,in6};
      end
    else
      cnt6 = cnt5;
    if(en7)
      begin
        cnt7 = cnt6 + en7;
        count = cnt7;
        out_temp[223-(count*14)-:14] = {run7,in7};
        //out_temp2 = {run7,in7};
      end
    else
      cnt7 = cnt6;
    if(en8)
      begin
        cnt8 = cnt7 + en8;
        count = cnt8;
        //pre_count = cnt8;
        out_temp[223-(count*14)-:14] = {run8,in8};
        //out_temp2 = {run8,in8};
      end
    else
      begin
        cnt8 = cnt7;
        //pre_count = cnt8;
      end
    if(count1[2:0] ==7)
      begin
        cnt9 = cnt8+1'b1;
        count = cnt9;
        pre_count = cnt9;
        out_temp[223-(count*14)-:14] = {6'b111111,8'b01111111};
      end
    else
      begin
        cnt9 = cnt8;
        pre_count = cnt9;
      end
      
  end
endmodule



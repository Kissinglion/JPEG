module RLE22(in,next1,count1,out_temp1);
  
  input [63:0]in;
  input [3:0]next1;
  input [3:0]count1;
  input [191:0]out_temp1;
  
  wire en1,en2,en3,en4,en5,en6,en7,en8;

  
  wire [7:0]in1,in2,in3,in4,in5,in6,in7,in8;
  
  reg [3:0]count,pre_count,next;
  
  reg [3:0]step;
  
  reg [3:0]run1,run2,run3,run4,run5,run6,run7,run8,zero1,zero2,zero3,zero4,zero5,zero6,zero7,zero8;
  
  assign in1 = in[63:56];
  assign in2 = in[55:48];
  assign in3 = in[47:40];
  assign in4 = in[39:32];
  assign in5 = in[31:24];
  assign in6 = in[23:16];
  assign in7 = in[15:8];
  assign in8 = in[7:0];
  
  
  
  assign en1 = in1||8'b0;
  assign en2 = in2||8'b0;
  assign en3 = in3||8'b0;
  assign en4 = in4||8'b0;
  assign en5 = in5||8'b0;
  assign en6 = in6||8'b0;
  assign en7 = in7||8'b0;
  assign en8 = in8||8'b0;

  

  
  always @(*)
  begin
    if(~en1)
      zero1 = next1 + 1'b1;
    else
      begin
        run1 = 0;
        zero1 = 0;
      end
    if(~en2)
      zero2 = zero1 + 1'b1;
    else
      begin
        run2 = zero1;
        zero2 = 0;
      end
    if(~en3)
      zero3 = zero2 + 1'b1;
    else
      begin
        run3 = zero2;
        zero3 = 0;
      end
    if(~en4)
      zero4 = zero3 + 1'b1;
    else
      begin
        run4 = zero3;
        zero4 = 0;
      end
    if(~en5)
      zero5 = zero4 + 1'b1;
    else
      begin
        run5 = zero4;
        zero5 = 0;
      end
    if(~en6)
      zero6 = zero5 + 1'b1;
    else
      begin
        run6 = zero5;
        zero6 = 0;
      end
    if(~en7)
      zero7 = zero6 + 1'b1;
    else
      begin
        run7 = zero6;
        zero7 = 0;
      end
    if(~en8)
        	zero8 = zero7 + 1'b1;
    else
      begin
        run8 = zero7;
        zero8 = 0;
      end
  end
  

  
  always @(*)
  begin
    if(en1)
      begin
        count = count1 + en1;
        out_temp[(count-1)*12+:12] = {run1,in1};
      end
    else
      count = 0;
    if(en2)
      begin
        count = count+en2;
        out_temp[(count-1)*12+:12] = {run2,in2};
      end
    else
      count = count;
    if(en3)
      begin
        count = count+en3;
        out_temp[(count-1)*12+:12] = {run3,in3};
      end
    else
      count = count;
    if(en4)
      begin
        count = count+en4;
        out_temp[(count-1)*12+:12] = {run4,in4};
      end
    else
      count = count;
    if(en5)
      begin
        count = count+en5;
        out_temp[(count-1)*12+:12] = {run5,in5};
      end
    else
      count = count;
    if(en6)
      begin
        count = count+en6;
        out_temp[(count-1)*12+:12] = {run6,in6};
      end
    else
      count = count;
    if(en7)
      begin
        count = count+en7;
        out_temp[(count-1)*12+:12] = {run7,in7};
      end
    else
      count = count;
    if(en8)
      begin
        count = count+en8;
        out_temp[(count-1)*12+:12] = {run8,in8};
        pre_count = count;
      end
    else
      count = count;
      pre_count = count;
  end
      
      
    
  
  
  
  //assign out = {count,a[i]};
  
  //assign out_temp = out_temp<<i + out;
  
  
  //SRAM512x16 MEM_OUT(1'b0,out_temp[111:0],11'd0,count3[3:0]-4'b0010,1'b0,clk, DO);
endmodule


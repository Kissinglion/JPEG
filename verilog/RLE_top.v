module RLE_top(in,finish,clk,reset);
  
  input [79:0]in;
  input clk,reset;
  output reg[319:0] finish;
  

  wire [9:0]out_temp1,out_temp2,out_temp3,out_temp4,out_temp5,out_temp6,out_temp7,out_temp8;
  wire [5:0]run1,run2,run3,run4,run5,run6,run7,run8;
  wire [3:0]next1,next2,next3,next4,next5,next6,next7,next8;
  wire [3:0] n [7:1];
  wire [15:0]DO;
  wire [77:0]c;
  reg [79:0]b[7:0];
  
  
  //reg [319:0] finish;
  reg [15:0]out_temp;
  reg [3:0] r [7:1];
  reg [79:0] a [7:0];
  reg [8:0]j,index1,index2,index3,index4,index5,index6,index7,index8;
  reg [8:0] d [8:1];
  reg [79:0]in1,in2,in3,in4,in5,in6,in7,in8;
  reg [3:0]i;
  reg [2:0]count;
  reg [3:0]count1;
  reg [8:0]count2,count3,count4;
  
  RLE test1(in1,out_temp1,next1,run1,count,clk,reset),
      test2(in2,out_temp2,next2,run2,(count-3'b001),clk,reset),
      test3(in3,out_temp3,next3,run3,(count-3'b010),clk,reset),
      test4(in4,out_temp4,next4,run4,(count-3'b011),clk,reset),
      test5(in5,out_temp5,next5,run5,(count-3'b100),clk,reset),
      test6(in6,out_temp6,next6,run6,(count-3'b101),clk,reset),
      test7(in7,out_temp7,next7,run7,(count-3'b110),clk,reset),
      test8(in8,out_temp8,next8,run8,(count-3'b111),clk,reset);

  

  
  always @(out_temp1)
  begin
    a[0][79 - (index1*16)-:16] = {run1,out_temp1};
    index1 = index1 + 1'b1;
  end
  
  always @(out_temp2)
  begin
    a[1][79 - (index2*16)-:16] = {run2,out_temp2};
    index2 = index2 + 1'b1;
  end
  
  
  always @(out_temp3)
  begin
    a[2][79 - (index3*16)-:16] = {run3,out_temp3};
    index3 = index3 + 1'b1;
  end
  
  always @(out_temp4)
  begin
    a[3][79 - (index4*16)-:16] = {run4,out_temp4};
    index4 = index4 + 1'b1;
  end
  
  always @(out_temp5)
  begin
    a[4][79 - (index5*16)-:16] = {run5,out_temp5};
    index5 = index5 + 1'b1;
  end
  
  always @(out_temp6)
  begin
    a[5][79 - (index6*16)-:16] = {run6,out_temp6};
    index6 = index6 + 1'b1;
  end
  
  always @(out_temp7)
  begin
    a[6][79 - (index7*16)-:16] = {run7,out_temp7};
    index7 = index7 + 1'b1;
  end
  
  always @(out_temp8)
  begin
    a[7][79 - (index8*16)-:16] = {run8,out_temp8};
    index8 = index8 + 1'b1;
  end


  always @(next1)
  begin
    r[1] = next1;
  end
  always @(next2)
  begin
    r[2] = next2;
  end
  always @(next3)
  begin
    r[3] = next3;
  end
  always @(next4)
  begin
    r[4] = next4;
  end
  always @(next5)
  begin
    r[5] = next5;
  end
  always @(next6)
  begin
    r[6] = next6;
  end
  always @(next7)
  begin
    r[7] = next7;
  end


  always @(posedge clk)
  begin 
    if(count4 >= 1)
    begin  
    if (count4 == 1)
      finish <= -1;
    else  
      finish <= finish;
    if (j)
      begin
        if((count2 == 1) && (i > 1))
        begin
          a[i-1][79:74] <= a[i-1][79:74] + r[i-1];       
          //finish[319 - ((count3-1)*16)-:16] <= a[i-1][79 - ((count2-1)*16)-:16];
          out_temp <= b[i-1][79 - ((count2-1)*16)-:16];
        end
        else
          out_temp <= b[i-1][79 - ((count2-1)*16)-:16]; 
          //finish[319 - ((count3-1)*16)-:16] <= a[i-1][79 - ((count2-1)*16)-:16]; 
      end
    else
      begin
        r[i] <= r[i] + r[i-1];
      end
    end
 	end
 	
  //assign b[i-1] = ((count2 == 1)&&(i>1)) ? a[i-1] + r[i-1]<<74 : a[i-1];
  
  always @(count2 or i)
  begin
    if ((count2 == 1) && (i>1))
      begin
        b[i-1][79:74] = a[i-1][79:74] + r[i-1];
        b[i-1][73:0] = a[i-1][73:0];
      end
    else
      b[i-1] = a[i-1];
  end
  
  	
  SRAM512x16 MEM_OUT(1'b0,out_temp,11'd0,count3[3:0]-4'b0010,1'b0,clk, DO);
  
  always @(posedge clk)
  begin
    if (count1 > 14)
      begin
        d[8] <= index8;
        index8 <= 0;
      end
    else if (count1 > 13)
      begin
        d[7] <= index7;
        index7 <= 0;
      end    
    else if (count1 >12)
      begin
        d[6] <= index6;
        index6 <= 0;
      end
    else if (count1 > 11)
      begin
        d[5] <= index5;
        index5 <= 0;
      end
    else if (count1 >10)
      begin
        d[4] <= index4;
        index4 <= 0;
      end        
    else if (count1 >9)
      begin
        d[3] <= index3;
        index3 <= 0;
      end
    else if(count1 > 8)
      begin
        d[2] <= index2;
        index2 <= 0;
      end    
   else if (count1 > 4'd7)
      begin
        d[1] <= index1;
        index1 <= 0;
      end
  end
 
  always @(count2 or i)
  begin
    if(count1 == 8)
      j = index1;
    else 
      j = d[i];
  end

 always @(posedge clk)
 begin
   if(~reset)
     begin
        count2 <= 9'b000000000;
        count3 <= 9'b000000000;
        count4 <= 9'b000000000;
        i <= 1;
     end
   else
     begin
       if (count1 > 9'd7)
         begin
           if( count2 == j)
             begin
               i <= i + 1;
               count2 <= 1'b1;
               count3 <= count3 + 1'b1;
               count4 <= count4 + 1'b1;
             end
           else if(j == 0)
             begin
              i <= i + 1;
              count4 <= count4 + 1'b1;
             end
           else
             begin
              count2 <= count2 + 1'b1;
              count3 <= count3 + 1'b1;
              count4 <= count4 + 1'b1;
            end      
         end
     end
 end
 

  always @(posedge clk)
  begin
    if (~reset)
    begin
      in1 = in1;
      index1 <= 8'b0;
      index2 <= 8'b0;
      index3 <= 8'b0;
      index4 <= 8'b0;
      index5 <= 8'b0;
      index6 <= 8'b0;
      index7 <= 8'b0;
      index8 <= 8'b0;
    end
    else
    case(count)
      3'b111 : begin in1 = in; end
      3'b000 : begin in2 = in; end
      3'b001 : begin in3 = in; end
      3'b010 : begin in4 = in; end
      3'b011 : begin in5 = in; end
      3'b100 : begin in6 = in; end
      3'b101 : begin in7 = in; end
      3'b110 : begin in8 = in; end
    endcase
  end
      
  
  always @(posedge clk)
  begin
    if(~reset)
      begin
        count  <= 3'b111;
        count1 <= 4'b0000;
      end
    else
      begin
        count  <= count + 1'b1;
        count1 <= count1 + 1'b1;
      end
  end
endmodule

module DCT_second(in,out,count1);
  
  input [72-1:0]in;
  input wire [2:0] count1;
  output [80-1:0]out;
  
  wire signed [9-1:0] in_temp [7:0];
  wire signed [16:0] out_temp [7:0];
  wire signed [9:0] a1,a2,a3,a4,a5,a6,a7,a8;
  wire signed [11:0] b1,b2,b3,b4,b5,b6;
  wire signed [14:0] c1;

  assign in_temp[7] = in[8:0];
  assign in_temp[6] = in[17:9];
  assign in_temp[5] = in[26:18];
  assign in_temp[4] = in[35:27];
  assign in_temp[3] = in[44:36];
  assign in_temp[2] = in[53:45];
  assign in_temp[1] = in[62:54];
  assign in_temp[0] = in[71:63];
  

  parameter signed q11 = 7'h20;
  parameter signed q12 = 7'h0B;
  parameter signed q13 = 7'h0C; 
  parameter signed q14 = 7'h08; 
  parameter signed q15 = 7'h05; 
  parameter signed q16 = 7'h03; 
  parameter signed q17 = 7'h02; 
  parameter signed q18 = 7'h02;
  
  parameter signed q21 = 7'h0A;
  parameter signed q22 = 7'h0A;
  parameter signed q23 = 7'h09;
  parameter signed q24 = 7'h06;
  parameter signed q25 = 7'h04;
  parameter signed q26 = 7'h02;
  parameter signed q27 = 7'h02;
  parameter signed q28 = 7'h02;

  
  parameter signed q31 = 7'h09;
  parameter signed q32 = 7'h09;
  parameter signed q33 = 7'h08;
  parameter signed q34 = 7'h05;
  parameter signed q35 = 7'h03;
  parameter signed q36 = 7'h02;
  parameter signed q37 = 7'h01;
  parameter signed q38 = 7'h02;
    
  parameter signed q41 = 7'h09;
  parameter signed q42 = 7'h07;
  parameter signed q43 = 7'h05;
  parameter signed q44 = 7'h04;
  parameter signed q45 = 7'h02;
  parameter signed q46 = 7'h01;
  parameter signed q47 = 7'h01;
  parameter signed q48 = 7'h02;

  assign a1 = in_temp[0] + in_temp[7];
  assign a2 = in_temp[1] + in_temp[6];
  assign a3 = in_temp[2] + in_temp[5];
  assign a4 = in_temp[3] + in_temp[4];
  assign a5 = in_temp[0] - in_temp[7];
  assign a6 = in_temp[1] - in_temp[6];
  assign a7 = in_temp[2] - in_temp[5];
  assign a8 = in_temp[3] - in_temp[4];

  assign b1 = a1 + a4;
  assign b2 = a2 + a3;
  assign b3 = a1 - a4;
  assign b4 = a2 - a3;
  assign b5 = a6 + a7;
  assign b6 = a5 - a8;
  assign c1 = b1 + b2; 
  
  assign out_temp[0] = (count1 == 3'b000) ? ({c1,5'b0} + {c1,3'b0} + {c1,2'b0} + c1) *q11 : 
                       (count1 == 3'b001) ? ({c1,5'b0} + {c1,3'b0} + {c1,2'b0} + c1) *q12 :
                       (count1 == 3'b010) ? ({c1,5'b0} + {c1,3'b0} + {c1,2'b0} + c1) *q13 :
                       (count1 == 3'b011) ? ({c1,5'b0} + {c1,3'b0} + {c1,2'b0} + c1) *q14 :
                       (count1 == 3'b100) ? ({c1,5'b0} + {c1,3'b0} + {c1,2'b0} + c1) *q15 :
                       (count1 == 3'b101) ? ({c1,5'b0} + {c1,3'b0} + {c1,2'b0} + c1) *q16 :
                       (count1 == 3'b111) ? ({c1,5'b0} + {c1,3'b0} + {c1,2'b0} + c1) *q17 :
                       ({c1,5'b0} + {c1,3'b0} + {c1,2'b0} + c1) *q18 ;
                       
  assign out_temp[2] =  (count1 == 3'b000) ? ({-b3,3'b0} - {-b3,6'b0} + {b4,3'b0} + {b4,4'b0}) *q21 : 
                        (count1 == 3'b001) ? ({-b3,3'b0} - {-b3,6'b0} + {b4,3'b0} + {b4,4'b0}) *q22 : 
                        (count1 == 3'b010) ? ({-b3,3'b0} - {-b3,6'b0} + {b4,3'b0} + {b4,4'b0}) *q23 : 
                        (count1 == 3'b011) ? ({-b3,3'b0} - {-b3,6'b0} + {b4,3'b0} + {b4,4'b0}) *q24 : 
                        (count1 == 3'b100) ? ({-b3,3'b0} - {-b3,6'b0} + {b4,3'b0} + {b4,4'b0}) *q25 : 
                        (count1 == 3'b101) ? ({-b3,3'b0} - {-b3,6'b0} + {b4,3'b0} + {b4,4'b0}) *q26 : 
                        (count1 == 3'b110) ? ({-b3,3'b0} - {-b3,6'b0} + {b4,3'b0} + {b4,4'b0}) *q27 : 
                        ({-b3,3'b0} - {-b3,6'b0} + {b4,3'b0} + {b4,4'b0}) *q28 ;
  
  assign out_temp[1] =  (count1 == 3'b000) ? ({b5,5'b0} + {a5,6'b0}) *q31 : 
                        (count1 == 3'b001) ? ({b5,5'b0} + {a5,6'b0}) *q32 : 
                        (count1 == 3'b010) ? ({b5,5'b0} + {a5,6'b0}) *q33 : 
                        (count1 == 3'b011) ? ({b5,5'b0} + {a5,6'b0}) *q34 : 
                        (count1 == 3'b100) ? ({b5,5'b0} + {a5,6'b0}) *q35 : 
                        (count1 == 3'b101) ? ({b5,5'b0} + {a5,6'b0}) *q36 : 
                        (count1 == 3'b110) ? ({b5,5'b0} + {a5,6'b0}) *q37 : 
                        ({b5,5'b0} + {a5,6'b0}) *q38 ;

                        
  assign out_temp[3] =  (count1 == 3'b000) ? ({b6,5'b0} - {a7,6'b0}) *q41 : 
                        (count1 == 3'b001) ? ({b6,5'b0} - {a7,6'b0}) *q42 :  
                        (count1 == 3'b010) ? ({b6,5'b0} - {a7,6'b0}) *q43 :  
                        (count1 == 3'b011) ? ({b6,5'b0} - {a7,6'b0}) *q44 :  
                        (count1 == 3'b100) ? ({b6,5'b0} - {a7,6'b0}) *q45 :  
                        (count1 == 3'b101) ? ({b6,5'b0} - {a7,6'b0}) *q46 :  
                        (count1 == 3'b110) ? ({b6,5'b0} - {a7,6'b0}) *q47 :  
                        ({b6,5'b0} - {a7,6'b0}) *q48 ;  
  
  assign out_temp[4] =  20'b0;
  assign out_temp[5] =  20'b0;
  assign out_temp[6] =  20'b0;
  assign out_temp[7] =  20'b0;
  
  assign out = (count1==3'b010) ? {out_temp[0][16:7],out_temp[1][14:5],out_temp[2][14:5],out_temp[3][14:5],40'b0}:
                                  {out_temp[0][14:5],out_temp[1][14:5],out_temp[2][14:5],out_temp[3][14:5],40'b0};
endmodule

module IDCT_second(in,out);
  
  input [63:0]in;
  output wire [71:0]out;
  
  wire [7:0] in_temp [7:0];
  wire signed [17:0] out_temp [7:0];
  wire signed [9:0] a0,a1;

  assign in_temp[7] = in[7:0];
  assign in_temp[6] = in[15:8];
  assign in_temp[5] = in[23:16];
  assign in_temp[4] = in[31:24];
  assign in_temp[3] = in[39:32];
  assign in_temp[2] = in[47:40];
  assign in_temp[1] = in[55:48];
  assign in_temp[0] = in[63:56];
  
 
  assign a0 = in_temp[0] + in_temp[4];
  assign a1 = in_temp[0] - in_temp[4];
  
  wire signed [14:0]a05,a15;
  wire signed [12:0]a03,a13;
  wire signed [11:0]a02,a12;
  
  wire signed [15:0]a00,a11;
  
  assign a05 = {a0,5'b0};
  assign a03 = {a0,3'b0};
  assign a02 = {a0,2'b0};
  assign a15 = {a1,5'b0};
  assign a13 = {a1,3'b0};
  assign a12 = {a1,2'b0};
  
  assign a00 = a05 + a03 + a02; //+ a0;
  assign a11 = a15 + a13 + a12; //+ a1;
  
  wire signed [13:0]a26,a66;
  wire signed [11:0]a24,a64;
  wire signed [10:0]a23,a63;
  wire signed [8:0]a21,a61;
  
  assign a26 = {in_temp[2],6'b0};
  assign a24 = {in_temp[2],4'b0};
  assign a23 = {in_temp[2],3'b0};
  assign a21 = {in_temp[2],1'b0};
  
  assign a66 = {in_temp[6],6'b0};
  assign a64 = {in_temp[6],4'b0};
  assign a63 = {in_temp[6],3'b0};
  assign a61 = {in_temp[6],1'b0};
  
  wire signed [15:0]b1,b2,b3,b4;
  wire signed [16:0]temp0,temp1,temp2,temp3;
  
  assign b1 = a26 - a23 + a21; // + a2;
  assign b2 = a66 - a63 + a61; // + a6;
  assign b3 = a24 + a23;
  assign b4 = a64 + a63;
  
  assign temp0 = a00 + b1 + b4;
  assign temp1 = a11 + b3 - b2;
  assign temp2 = a11 - b3 + b2;
  assign temp3 = a00 - b1 - b4;
  
  wire signed [13:0]c16,c36,c56,c76;
  wire signed [12:0]c15,c35,c55,c75;
  wire signed [11:0]c14,c34,c54,c74;
  wire signed [10:0]c13,c33,c53,c73;
  wire signed [9:0]c12,c32,c52,c72;
  
  assign c16 = {in_temp[1],6'b0};
  assign c15 = {in_temp[1],5'b0};
  assign c14 = {in_temp[1],4'b0};
  assign c13 = {in_temp[1],3'b0};
  assign c12 = {in_temp[1],2'b0};
  
  assign c36 = {in_temp[3],6'b0};
  assign c35 = {in_temp[3],5'b0};
  assign c34 = {in_temp[3],4'b0};
  assign c33 = {in_temp[3],3'b0};
  assign c32 = {in_temp[3],2'b0};
  
  assign c56 = {in_temp[5],6'b0};
  assign c55 = {in_temp[5],5'b0};
  assign c54 = {in_temp[5],4'b0};
  assign c53 = {in_temp[5],3'b0};
  assign c52 = {in_temp[5],2'b0};
  
  assign c76 = {in_temp[7],6'b0};
  assign c75 = {in_temp[7],5'b0};
  assign c74 = {in_temp[7],4'b0};
  assign c73 = {in_temp[7],3'b0};
  assign c72 = {in_temp[7],2'b0};
  
  wire signed [17:0]temp4,temp5,temp6,temp7;

  assign temp4 = c16 + c35 + c34 + c32 + c55 + c52 + c73 + c72;
  assign temp5 = c15 + c14 + c12 - c33 - c32 - c56 - c75 - c72;
  assign temp6 = c15 + c12 - c36 + c53 + c52 + c75 + c73 + c72;
  assign temp7 = c13 + c12 - c35 - c32 + c55 + c54 + c52 - c76; 


  assign out_temp[0]= temp0 + temp4;
  assign out_temp[1]= temp1 + temp5;
  assign out_temp[2]= temp2 + temp6;
  assign out_temp[3]= temp3 + temp7;

  assign out_temp[4]= 20'd0;//temp3 - temp7;
  assign out_temp[5]= 20'd0;//temp2 - temp6;
  assign out_temp[6]= 20'd0;//temp1 - temp5;
  assign out_temp[7]= 20'd0;
  
  
  
  round1  rnd1(out_temp[0],out[71:63]),
          rnd2(out_temp[1],out[62:54]),
          rnd3(out_temp[2],out[53:45]),
          rnd4(out_temp[3],out[44:36]),
          rnd5(out_temp[4],out[35:27]),
          rnd6(out_temp[5],out[26:18]),
          rnd7(out_temp[6],out[17:9]),
          rnd8(out_temp[7],out[8:0]);
  


  //assign out={out_temp[0][17:9],out_temp[1][17:9],out_temp[2][17:9],out_temp[3][17:9],out_temp[4][17:9],out_temp[5][17:9],out_temp[6][17:9],9'b0}; 
endmodule
/*
module round1(out_temp,out);
  
  input [17:0]out_temp;
  output reg[8:0]out;
  
  always @(out_temp)
  begin
    if(out_temp[17])
      begin
        if(out_temp[8:0] > 9'b100000000)
          out  = out_temp[17:9] + 1'b1;
        else
          out = out_temp[17:9];
      end
    else
      begin
        if(out_temp[8])
          out = out_temp[17:9] + 1'b1;
        else
          out = out_temp[17:9];
      end
  end
endmodule
*/
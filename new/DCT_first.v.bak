module DCT_first(in,out);
  
  input [63:0]in;
  output wire [71:0]out;
  
  wire [7:0] in_temp [7:0];
  wire signed [17:0] out_temp [7:0];
  wire signed [9:0] a1,a2,a3,a4,a5,a6,a7,a8;
  wire signed [11:0] b1,b2,b3,b4,b5,b6,b7,a62,a72,a82;
  wire signed [12:0] b31,a63,a73,a83;
  wire signed [13:0] a54,a64,a84,b52,b62,b72;
  wire signed [14:0] c1,c2,b33,b43,a55;
  wire signed [15:0] b34,b44,a56,a66,a76;
  wire signed [16:0] c12,c22,b55,b65,b75;
  wire signed [17:0] c13,b36,b46,c23;
  wire signed [19:0] c15,c25;

  assign in_temp[7] = in[7:0];
  assign in_temp[6] = in[15:8];
  assign in_temp[5] = in[23:16];
  assign in_temp[4] = in[31:24];
  assign in_temp[3] = in[39:32];
  assign in_temp[2] = in[47:40];
  assign in_temp[1] = in[55:48];
  assign in_temp[0] = in[63:56];
  
 
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
  assign b7 = a5 + a8;
  assign c1 = b1 + b2; 
  assign c2 = b1 - b2;
  
  assign b31 = {b3,1'b0};
  assign b33 = {b3,3'b0};
  assign b34 = {b3,4'b0};
  assign b36 = {b3,6'b0};
  assign b44 = {b4,4'b0};
  assign b43 = {b4,3'b0};
  assign b46 = {b4,6'b0};
  assign b52 = {b5,2'b0};
  assign b55 = {b5,5'b0};
  assign b62 = {b6,2'b0};
  assign b65 = {b6,5'b0};
  
  assign b72 = {b7,2'b0};
  assign b75 = {b7,5'b0};
    
  assign a54 = {a5,4'b0};
  assign a56 = {a5,6'b0};
    
  assign a62 = {a6,2'b0};
  assign a63 = {a6,3'b0};
  assign a64 = {a6,4'b0};
  assign a66 = {a6,6'b0};
    
  assign a72 = {a7,2'b0};
  assign a73 = {a7,3'b0};
  assign a76 = {a7,6'b0};
  
  assign a82 = {a8,2'b0};
  assign a83 = {a8,3'b0};
  assign a84 = {a8,4'b0};
  
  
  assign c12 = {c1,2'b0};
  assign c13 = {c1,3'b0};
  assign c15 = {c1,5'b0};
  assign c22 = {c2,2'b0};
  assign c23 = {c2,3'b0};
  assign c25 = {c2,5'b0};


  assign out_temp[0]= c1 + c12 + c13 + c15; 
  assign out_temp[2]= b3 + b31 - b33 + b36 + b43 + b44;
  assign out_temp[4]= c2 + c22 + c23 + c25;
  assign out_temp[6]= -b4 -b43 - b46 + b33 + b34;

  assign out_temp[1]= b52 + b55 -a5 + a56 +a6 + a64 + a82 + a83;
  assign out_temp[3]= b62 + b65 +a7 - a76 +a5 + a54 - a62 - a63;
  assign out_temp[5]= b72 + b75 +a6 - a66 +a8 + a84 + a72 + a73;
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

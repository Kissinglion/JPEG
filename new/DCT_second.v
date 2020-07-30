module DCT_second(in,out,count1);
  
  input [72-1:0]in;
  input wire [2:0] count1;
  output [80-1:0]out;
  
  wire signed [9-1:0] in_temp [7:0];
  wire signed [16:0] out_temp [7:0];
  wire signed [9:0] a1,a2,a3,a4,a5,a6,a7,a8;
  wire signed [11:0] b1,b2,b3,b4,b5,b6;
  wire signed [14:0] c1;
	wire signed [9:0]out_temp2,out_temp3,out_temp4;

  assign in_temp[7] = in[8:0];
  assign in_temp[6] = in[17:9];
  assign in_temp[5] = in[26:18];
  assign in_temp[4] = in[35:27];
  assign in_temp[3] = in[44:36];
  assign in_temp[2] = in[53:45];
  assign in_temp[1] = in[62:54];
  assign in_temp[0] = in[71:63];
  

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
  
  assign out_temp[0] = ({c1,5'b0} + {c1,3'b0} + {c1,2'b0} + c1);
  assign out_temp[2] = {-b3,3'b0} - {-b3,6'b0} + {b4,3'b0} + {b4,4'b0}; 
  assign out_temp[1] =  {b5,5'b0} + {a5,6'b0};
  assign out_temp[3] =  {b6,5'b0} - {a7,6'b0};
  
  assign out_temp[4] =  20'b0;
  assign out_temp[5] =  20'b0;
  assign out_temp[6] =  20'b0;
  assign out_temp[7] =  20'b0;

  round2  rnd2(out_temp[1],out_temp2),
          rnd3(out_temp[2],out_temp3),
					rnd4(out_temp[3],out_temp4);
  
  assign out = (count1==3'b010) ? {out_temp[0][16:7],out_temp2,out_temp3,out_temp4,40'b0}:
                                  {out_temp[0][14:5],out_temp2,out_temp3,out_temp4,40'b0};
endmodule
module round2(out_temp,out);
  
  input [16:0]out_temp;
  output reg[9:0]out;
  
  always @(out_temp)
  begin
    if(out_temp[16])
      begin
        if(out_temp[4:0] > 5'b10000)
          out  = out_temp[14:5] + 1'b1;
        else
          out = out_temp[14:5];
      end
    else
      begin
        if(out_temp[4])
          out = out_temp[14:5] + 1'b1;
        else
          out = out_temp[14:5];
      end
  end
endmodule
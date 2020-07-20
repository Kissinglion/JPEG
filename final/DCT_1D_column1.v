
module DCT_1D_column1(in,out,count1);

  input [72-1:0] in;
  output reg [80-1:0] out;
  input wire [2:0] count1;
  
  wire signed [9-1:0] x0,x1,x2,x3,x4,x5,x6,x7;
  wire signed [19:0] yc0,yc1,yc2,yc3,yc4,yc5,yc6,yc7,c1,c2,c3,c4,c5;
  wire signed [9:0] z00,z0;
  wire signed [9:0] sc0,sc1,sc2,sc3;
  wire signed [9:0] ssc0,ssc1,ssc2,ssc3;
  
  
  assign x7=in[8:0];
  assign x6=in[17:9];
  assign x5=in[26:18];
  assign x4=in[35:27];
  assign x3=in[44:36];
  assign x2=in[53:45];
  assign x1=in[62:54];
  assign x0=in[71:63];
  
  assign sc0=x0+x7; 
  assign sc1=x1+x6;
  assign sc2=x2+x5; 
  assign sc3=x3+x4;
  assign ssc0=x0-x7; 
  assign ssc1=x1-x6;
  assign ssc2=x2-x5; 
  assign ssc3=x3-x4;
  
  assign c1 = sc0 + sc1 + sc2 + sc3;
  assign c2 = sc3 - sc0;
  assign c3 = sc1 - sc2;
  assign c4 = ssc1 + ssc2;
  assign c5 = ssc0 - ssc3;
  
  
  assign yc0 = c1 + {c1,2'b0} + {c1,3'b0} + {c1,5'b0};
  assign yc2 = {c2,3'b0} - {c2,6'b0} + {c3,3'b0} + {c3,4'b0};
  assign yc1 = {c4,5'b0} + {ssc0,6'b0};
  assign yc3 = {c5,5'b0} - {ssc2,6'b0};
  
  assign yc4=20'd0;
  assign yc6=20'd0;
  assign yc5=20'd0;
  assign yc7=20'd0;
  
  always@(*)
   begin
  	if(count1==3'b010)
  	 begin
  	out={z00,yc1[14:5],yc2[14:5],yc3[14:5],yc4[14:5],yc5[14:5],yc6[14:5],yc7[14:5]};
  	 end
  	else
  	 begin
  	out={z0,yc1[14:5],yc2[14:5],yc3[14:5],yc4[14:5],yc5[14:5],yc6[14:5],yc7[14:5]};
  	 end
   end
  
  assign z0={yc0[14:5]};
  assign z00={yc0[16:7]};
endmodule


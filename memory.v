module memory(in1,in2,in3,in4,in5,in6,in7,in8,w_en,out);
  
  input [63:0]in1,in2,in3,in4,in5,in6,in7,in8;
  //input enable;
	input w_en;
	output out;

  parameter BW = 8;
  reg [4-1:0]  counter ;
  wire [8*BW-1:0] array [8-1:0];
  wire [8-1:0] data_out;
  
  wire [8*BW-1:0] col [8-1:0];
  wire [3-1:0] index = counter[3-1:0] ;
  wire [8-1:0] w_data;
  //wire	      w_en;
  
  assign array[0] = w_en ? in1 : {{col[0][8*BW-1:7*BW]},{col[1][8*BW-1:7*BW]},{col[2][8*BW-1:7*BW]},{col[3][8*BW-1:7*BW]},{col[4][8*BW-1:7*BW]},{col[5][8*BW-1:7*BW]},{col[6][8*BW-1:7*BW]},{col[7][8*BW-1:7*BW]}};
  assign array[1] = w_en ? in2 : {{col[0][7*BW-1:6*BW]},{col[1][7*BW-1:6*BW]},{col[2][7*BW-1:6*BW]},{col[3][7*BW-1:6*BW]},{col[4][7*BW-1:6*BW]},{col[5][7*BW-1:6*BW]},{col[6][7*BW-1:6*BW]},{col[7][7*BW-1:6*BW]}};
  assign array[2] = w_en ? in3 : {{col[0][6*BW-1:5*BW]},{col[1][6*BW-1:5*BW]},{col[2][6*BW-1:5*BW]},{col[3][6*BW-1:5*BW]},{col[4][6*BW-1:5*BW]},{col[5][6*BW-1:5*BW]},{col[6][6*BW-1:5*BW]},{col[7][6*BW-1:5*BW]}};
  assign array[3] = w_en ? in4 : {{col[0][5*BW-1:4*BW]},{col[1][5*BW-1:4*BW]},{col[2][5*BW-1:4*BW]},{col[3][5*BW-1:4*BW]},{col[4][5*BW-1:4*BW]},{col[5][5*BW-1:4*BW]},{col[6][5*BW-1:4*BW]},{col[7][5*BW-1:4*BW]}};
  
  assign array[4] = w_en ? in5 : {{col[0][4*BW-1:3*BW]},{col[1][4*BW-1:3*BW]},{col[2][4*BW-1:3*BW]},{col[3][4*BW-1:3*BW]},{col[4][4*BW-1:3*BW]},{col[5][4*BW-1:3*BW]},{col[6][4*BW-1:3*BW]},{col[7][4*BW-1:3*BW]}};
  assign array[5] = w_en ? in6 : {{col[0][3*BW-1:2*BW]},{col[1][3*BW-1:2*BW]},{col[2][3*BW-1:2*BW]},{col[3][3*BW-1:2*BW]},{col[4][3*BW-1:2*BW]},{col[5][3*BW-1:2*BW]},{col[6][3*BW-1:2*BW]},{col[7][3*BW-1:2*BW]}};
  assign array[6] = w_en ? in7 : {{col[0][2*BW-1:1*BW]},{col[1][2*BW-1:1*BW]},{col[2][2*BW-1:1*BW]},{col[3][2*BW-1:1*BW]},{col[4][2*BW-1:1*BW]},{col[5][2*BW-1:1*BW]},{col[6][2*BW-1:1*BW]},{col[7][2*BW-1:1*BW]}};
  assign array[7] = w_en ? in8 : {{col[0][1*BW-1:0*BW]},{col[1][1*BW-1:0*BW]},{col[2][1*BW-1:0*BW]},{col[3][1*BW-1:0*BW]},{col[4][1*BW-1:0*BW]},{col[5][1*BW-1:0*BW]},{col[6][1*BW-1:0*BW]},{col[7][1*BW-1:0*BW]}};

  assign col[0] = w_en ? {{array[0][8*BW-1:7*BW]},{array[1][8*BW-1:7*BW]},{array[2][8*BW-1:7*BW]},{array[3][8*BW-1:7*BW]},{array[4][8*BW-1:7*BW]},{array[5][8*BW-1:7*BW]},{array[6][8*BW-1:7*BW]},{array[7][8*BW-1:7*BW]}} : in1;
  assign col[1] = w_en ? {{array[0][7*BW-1:6*BW]},{array[1][7*BW-1:6*BW]},{array[2][7*BW-1:6*BW]},{array[3][7*BW-1:6*BW]},{array[4][7*BW-1:6*BW]},{array[5][7*BW-1:6*BW]},{array[6][7*BW-1:6*BW]},{array[7][7*BW-1:6*BW]}} : in2;
  assign col[2] = w_en ? {{array[0][6*BW-1:5*BW]},{array[1][6*BW-1:5*BW]},{array[2][6*BW-1:5*BW]},{array[3][6*BW-1:5*BW]},{array[4][6*BW-1:5*BW]},{array[5][6*BW-1:5*BW]},{array[6][6*BW-1:5*BW]},{array[7][6*BW-1:5*BW]}} : in3;
  assign col[3] = w_en ? {{array[0][5*BW-1:4*BW]},{array[1][5*BW-1:4*BW]},{array[2][5*BW-1:4*BW]},{array[3][5*BW-1:4*BW]},{array[4][5*BW-1:4*BW]},{array[5][5*BW-1:4*BW]},{array[6][5*BW-1:4*BW]},{array[7][5*BW-1:4*BW]}} : in4;
  
  assign col[4] = w_en ? {{array[0][4*BW-1:3*BW]},{array[1][4*BW-1:3*BW]},{array[2][4*BW-1:3*BW]},{array[3][4*BW-1:3*BW]},{array[4][4*BW-1:3*BW]},{array[5][4*BW-1:3*BW]},{array[6][4*BW-1:3*BW]},{array[7][4*BW-1:3*BW]}} : in5;
  assign col[5] = w_en ? {{array[0][3*BW-1:2*BW]},{array[1][3*BW-1:2*BW]},{array[2][3*BW-1:2*BW]},{array[3][3*BW-1:2*BW]},{array[4][3*BW-1:2*BW]},{array[5][3*BW-1:2*BW]},{array[6][3*BW-1:2*BW]},{array[7][3*BW-1:2*BW]}} : in6;
  assign col[6] = w_en ? {{array[0][2*BW-1:1*BW]},{array[1][2*BW-1:1*BW]},{array[2][2*BW-1:1*BW]},{array[3][2*BW-1:1*BW]},{array[4][2*BW-1:1*BW]},{array[5][2*BW-1:1*BW]},{array[6][2*BW-1:1*BW]},{array[7][2*BW-1:1*BW]}} : in7;
  assign col[7] = w_en ? {{array[0][1*BW-1:0*BW]},{array[1][1*BW-1:0*BW]},{array[2][1*BW-1:0*BW]},{array[3][1*BW-1:0*BW]},{array[4][1*BW-1:0*BW]},{array[5][1*BW-1:0*BW]},{array[6][1*BW-1:0*BW]},{array[7][1*BW-1:0*BW]}} : in8;



  
  /*
  assign array[0] = w_en ? in1 : {{col[0][7:6]},{col[1][7:6]},{col[2][7:6]},{col[3][7:6]}};
  assign array[1] = w_en ? in2 : {{col[0][5:4]},{col[1][5:4]},{col[2][5:4]},{col[3][5:4]}};
  assign array[2] = w_en ? in3 : {{col[0][3:2]},{col[1][3:2]},{col[2][3:2]},{col[3][3:2]}};
  assign array[3] = w_en ? in4 : {{col[0][1:0]},{col[1][1:0]},{col[2][1:0]},{col[3][1:0]}};
  
  assign col[0] = w_en ? {{array[0][7:6]},{array[1][7:6]},{array[2][7:6]},{array[3][7:6]}} : in1;
  assign col[1] = w_en ? {{array[0][5:4]},{array[1][5:4]},{array[2][5:4]},{array[3][5:4]}} : in2;
  assign col[2] = w_en ? {{array[0][3:2]},{array[1][3:2]},{array[2][3:2]},{array[3][3:2]}} : in3;
  assign col[3] = w_en ? {{array[0][1:0]},{array[1][1:0]},{array[2][1:0]},{array[3][1:0]}} : in4;
*/
endmodule
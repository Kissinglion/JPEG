module Quantization(in,out,clk,reset);
  
  input [63:0]in;
  input clk,reset;

  output wire [71:0]out;
  
  wire [7:0] in_temp [7:0];
  reg [2:0] count;
  reg signed [8:0] out_temp [7:0];

  assign in_temp[7] = in[7:0];
  assign in_temp[6] = in[15:8];
  assign in_temp[5] = in[23:16];
  assign in_temp[4] = in[31:24];
  assign in_temp[3] = in[39:32];
  assign in_temp[2] = in[47:40];
  assign in_temp[1] = in[55:48];
  assign in_temp[0] = in[63:56];
  

  parameter q11 = 7'h20;
  parameter q12 = 7'h0B;
  parameter q13 = 7'h0C; 
  parameter q14 = 7'h08; 
  parameter q15 = 7'h05; 
  parameter q16 = 7'h03; 
  parameter q17 = 7'h02; 
  parameter q18 = 7'h02;
  
  parameter q21 = 7'h0A;
  parameter q22 = 7'h0A;
  parameter q23 = 7'h09;
  parameter q24 = 7'h06;
  parameter q25 = 7'h04;
  parameter q26 = 7'h02;
  parameter q27 = 7'h02;
  parameter q28 = 7'h02;

  
  parameter q31 = 7'h09;
  parameter q32 = 7'h09;
  parameter q33 = 7'h08;
  parameter q34 = 7'h05;
  parameter q35 = 7'h03;
  parameter q36 = 7'h02;
  parameter q37 = 7'h01;
  parameter q38 = 7'h02;
    
  parameter q41 = 7'h09;
  parameter q42 = 7'h07;
  parameter q43 = 7'h05;
  parameter q44 = 7'h04;
  parameter q45 = 7'h02;
  parameter q46 = 7'h01;
  parameter q47 = 7'h01;
  parameter q48 = 7'h02;
  
  parameter q51 = 7'h07;
  parameter q52 = 7'h05;
  parameter q53 = 7'h03;
  parameter q54 = 7'h02;
  parameter q55 = 7'h01;
  parameter q56 = 7'h01;
  parameter q57 = 7'h01;
  parameter q58 = 7'h01;
  
  parameter q61 = 7'h05;
  parameter q62 = 7'h03;
  parameter q63 = 7'h02;
  parameter q64 = 7'h02 ;
  parameter q65 = 7'h01 ;
  parameter q66 = 7'h01 ;
  parameter q67 = 7'h01 ;
  parameter q68 = 7'h01 ;
  

  parameter q71 = 7'h02;
  parameter q72 = 7'h02;
  parameter q73 = 7'h01;
  parameter q74 = 7'h01;
  parameter q75 = 7'h01;
  parameter q76 = 7'h01;
  parameter q77 = 7'h01;
  parameter q78 = 7'h01;
  

  parameter q81 = 7'h01;
  parameter q82 = 7'h01;
  parameter q83 = 7'h01;
  parameter q84 = 7'h01;
  parameter q85 = 7'h01;
  parameter q86 = 7'h01;
  parameter q87 = 7'h01;
  parameter q88 = 7'h01;
  
  assign out = {out_temp[0],out_temp[1],out_temp[2],out_temp[3],out_temp[4],out_temp[5],out_temp[6],out_temp[7]};
  
  always @(in_temp)
  case(count)
    3'b000: begin out_temp[0] = in_temp[0] * q11;out_temp[1] = in_temp[1] * q12;out_temp[2] = in_temp[2] * q13;out_temp[3] = in_temp[3] * q14;out_temp[4] = in_temp[4] * q15;out_temp[5] = in_temp[5] * q16;out_temp[6] = in_temp[6] * q17;out_temp[7] = in_temp[7] * q18; end
    3'b001: begin out_temp[0] = in_temp[0] * q21;out_temp[1] = in_temp[1] * q22;out_temp[2] = in_temp[2] * q23;out_temp[3] = in_temp[3] * q24;out_temp[4] = in_temp[4] * q25;out_temp[5] = in_temp[5] * q26;out_temp[6] = in_temp[6] * q27;out_temp[7] = in_temp[7] * q28; end
    3'b010: begin out_temp[0] = in_temp[0] * q31;out_temp[1] = in_temp[1] * q32;out_temp[2] = in_temp[2] * q33;out_temp[3] = in_temp[3] * q34;out_temp[4] = in_temp[4] * q35;out_temp[5] = in_temp[5] * q36;out_temp[6] = in_temp[6] * q37;out_temp[7] = in_temp[7] * q38; end
    3'b011: begin out_temp[0] = in_temp[0] * q41;out_temp[1] = in_temp[1] * q42;out_temp[2] = in_temp[2] * q43;out_temp[3] = in_temp[3] * q44;out_temp[4] = in_temp[4] * q45;out_temp[5] = in_temp[5] * q46;out_temp[6] = in_temp[6] * q47;out_temp[7] = in_temp[7] * q48; end
    3'b100: begin out_temp[0] = in_temp[0] * q51;out_temp[1] = in_temp[1] * q52;out_temp[2] = in_temp[2] * q53;out_temp[3] = in_temp[3] * q54;out_temp[4] = in_temp[4] * q55;out_temp[5] = in_temp[5] * q56;out_temp[6] = in_temp[6] * q57;out_temp[7] = in_temp[7] * q58; end
    3'b101: begin out_temp[0] = in_temp[0] * q61;out_temp[1] = in_temp[1] * q62;out_temp[2] = in_temp[2] * q63;out_temp[3] = in_temp[3] * q64;out_temp[4] = in_temp[4] * q65;out_temp[5] = in_temp[5] * q66;out_temp[6] = in_temp[6] * q67;out_temp[7] = in_temp[7] * q68; end
    3'b110: begin out_temp[0] = in_temp[0] * q71;out_temp[1] = in_temp[1] * q72;out_temp[2] = in_temp[2] * q73;out_temp[3] = in_temp[3] * q74;out_temp[4] = in_temp[4] * q75;out_temp[5] = in_temp[5] * q76;out_temp[6] = in_temp[6] * q77;out_temp[7] = in_temp[7] * q78; end
    3'b111: begin out_temp[0] = in_temp[0] * q81;out_temp[1] = in_temp[1] * q82;out_temp[2] = in_temp[2] * q83;out_temp[3] = in_temp[3] * q84;out_temp[4] = in_temp[4] * q85;out_temp[5] = in_temp[5] * q86;out_temp[6] = in_temp[6] * q87;out_temp[7] = in_temp[7] * q88; end
  endcase
  
  always@(posedge clk) 
  begin
    if (reset)
      count = 3'b000;
    else
      count = count + 1'b1;
  end
endmodule


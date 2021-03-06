module Quantization_re(in,out,count,clk,reset);
  
  input [79:0]in;
  input clk,reset;
  input [2:0]count;
  output wire [63:0]out;
  
  wire signed [9:0] in_temp [7:0];
  reg signed [17:0] out_temp [7:0];

  assign in_temp[7] = in[9:0];
  assign in_temp[6] = in[19:10];
  assign in_temp[5] = in[29:20];
  assign in_temp[4] = in[39:30];
  assign in_temp[3] = in[49:40];
  assign in_temp[2] = in[59:50];
  assign in_temp[1] = in[69:60];
  assign in_temp[0] = in[79:70];
  

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
  
  parameter signed q51 = 7'h07;
  parameter signed q52 = 7'h05;
  parameter signed q53 = 7'h03;
  parameter signed q54 = 7'h02;
  parameter signed q55 = 7'h01;
  parameter signed q56 = 7'h01;
  parameter signed q57 = 7'h01;
  parameter signed q58 = 7'h01;
  
  parameter signed q61 = 7'h05;
  parameter signed q62 = 7'h03;
  parameter signed q63 = 7'h02;
  parameter signed q64 = 7'h02 ;
  parameter signed q65 = 7'h01 ;
  parameter signed q66 = 7'h01 ;
  parameter signed q67 = 7'h01 ;
  parameter signed q68 = 7'h01 ;
  

  parameter signed q71 = 7'h02;
  parameter signed q72 = 7'h02;
  parameter signed q73 = 7'h01;
  parameter signed q74 = 7'h01;
  parameter signed q75 = 7'h01;
  parameter signed q76 = 7'h01;
  parameter signed q77 = 7'h01;
  parameter signed q78 = 7'h01;
  

  parameter signed q81 = 7'h01;
  parameter signed q82 = 7'h01;
  parameter signed q83 = 7'h01;
  parameter signed q84 = 7'h01;
  parameter signed q85 = 7'h01;
  parameter signed q86 = 7'h01;
  parameter signed q87 = 7'h01;
  parameter signed q88 = 7'h01;
  
  
  round rnd1(out_temp[0],out[63:56]),
        rnd2(out_temp[1],out[55:48]),
        rnd3(out_temp[2],out[47:40]),
        rnd4(out_temp[3],out[39:32]),
        rnd5(out_temp[4],out[31:24]),
        rnd6(out_temp[5],out[23:16]),
        rnd7(out_temp[6],out[15:8]),
        rnd8(out_temp[7],out[7:0]);
  
  
  always @(in_temp or count)
  case(count)
    3'b000: begin out_temp[0] = in_temp[0] * q11;out_temp[1] = in_temp[1] * q21;out_temp[2] = in_temp[2] * q31;out_temp[3] = in_temp[3] * q41;out_temp[4] = in_temp[4] * q51;out_temp[5] = in_temp[5] * q61;out_temp[6] = in_temp[6] * q71;out_temp[7] = in_temp[7] * q81; end
    3'b001: begin out_temp[0] = in_temp[0] * q12;out_temp[1] = in_temp[1] * q22;out_temp[2] = in_temp[2] * q32;out_temp[3] = in_temp[3] * q42;out_temp[4] = in_temp[4] * q52;out_temp[5] = in_temp[5] * q62;out_temp[6] = in_temp[6] * q72;out_temp[7] = in_temp[7] * q82; end
    3'b010: begin out_temp[0] = in_temp[0] * q13;out_temp[1] = in_temp[1] * q23;out_temp[2] = in_temp[2] * q33;out_temp[3] = in_temp[3] * q43;out_temp[4] = in_temp[4] * q53;out_temp[5] = in_temp[5] * q63;out_temp[6] = in_temp[6] * q73;out_temp[7] = in_temp[7] * q83; end
    3'b011: begin out_temp[0] = in_temp[0] * q14;out_temp[1] = in_temp[1] * q24;out_temp[2] = in_temp[2] * q34;out_temp[3] = in_temp[3] * q44;out_temp[4] = in_temp[4] * q54;out_temp[5] = in_temp[5] * q64;out_temp[6] = in_temp[6] * q74;out_temp[7] = in_temp[7] * q84; end
    3'b100: begin out_temp[0] = in_temp[0] * q15;out_temp[1] = in_temp[1] * q25;out_temp[2] = in_temp[2] * q35;out_temp[3] = in_temp[3] * q45;out_temp[4] = in_temp[4] * q55;out_temp[5] = in_temp[5] * q65;out_temp[6] = in_temp[6] * q75;out_temp[7] = in_temp[7] * q85; end
    3'b101: begin out_temp[0] = in_temp[0] * q16;out_temp[1] = in_temp[1] * q26;out_temp[2] = in_temp[2] * q36;out_temp[3] = in_temp[3] * q46;out_temp[4] = in_temp[4] * q56;out_temp[5] = in_temp[5] * q66;out_temp[6] = in_temp[6] * q76;out_temp[7] = in_temp[7] * q86; end
    3'b110: begin out_temp[0] = in_temp[0] * q17;out_temp[1] = in_temp[1] * q27;out_temp[2] = in_temp[2] * q37;out_temp[3] = in_temp[3] * q47;out_temp[4] = in_temp[4] * q57;out_temp[5] = in_temp[5] * q67;out_temp[6] = in_temp[6] * q77;out_temp[7] = in_temp[7] * q87; end
    3'b111: begin out_temp[0] = in_temp[0] * q18;out_temp[1] = in_temp[1] * q28;out_temp[2] = in_temp[2] * q38;out_temp[3] = in_temp[3] * q48;out_temp[4] = in_temp[4] * q58;out_temp[5] = in_temp[5] * q68;out_temp[6] = in_temp[6] * q78;out_temp[7] = in_temp[7] * q88; end
  endcase
  
  
endmodule

module round(out_temp,out);
  
  input [17:0]out_temp;
  output reg[7:0]out;
  
  always @(out_temp)
  begin
    if(out_temp[17])
      begin
        if(out_temp[6:0] > 7'b1000000)
          out  = out_temp[14:7] + 1'b1;
        else
          out = out_temp[14:7];
      end
    else
      begin
        if(out_temp[6])
          out = out_temp[14:7] + 1'b1;
        else
          out = out_temp[14:7];
      end
  end
endmodule


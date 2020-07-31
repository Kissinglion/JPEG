module RLD(in,in_next,out_next,previous,sram_en,run1,run2,run3,run4,run5,run6,run7,run8);
  
  input [111:0]in;
  input [5:0]in_next;
  input [5:0]previous;
  output sram_en;
  output wire [5:0]out_next;
  output reg [5:0]run1,run2,run3,run4,run5,run6,run7,run8;

  
  //output wire en1,en2,en3,en4,en5,en6,en7,en8;
  wire [7:0]in1,in2,in3,in4,in5,in6,in7,in8;

  
  reg [5:0]terminate1,terminate2,terminate3,terminate4,terminate5,terminate6,terminate7,terminate8;
  

  assign in1 = in[111:106];
  assign in2 = in[97:92];
  assign in3 = in[83:78];
  assign in4 = in[69:64];
  assign in5 = in[55:50];
  assign in6 = in[41:36];
  assign in7 = in[27:22];
  assign in8 = in[13:8];
  
  
  /*
  assign en1 = in1||8'b0;
  assign en2 = in2||8'b0;
  assign en3 = in3||8'b0;
  assign en4 = in4||8'b0;
  assign en5 = in5||8'b0;
  assign en6 = in6||8'b0;
  assign en7 = in7||8'b0;
  assign en8 = in8||8'b0;
  */
  
  
  assign out_next = terminate8;
  assign sram_en = (out_next == 0) ? 1'b1: 1'b0;
  
  always @(*)
  begin
    if(in1 == 6'b111111)
      terminate1 = in_next + 1'b1;
    else
      begin
        run1 = previous + in1 + 1'b1;
        terminate1 = in_next;
      end
    if(in2 == 6'b111111)
      terminate2 = terminate1 + 1'b1;
    else
      begin
        run2 = run1 + in2 + 1'b1;
        terminate2 = terminate1;
      end
    if(in3 == 6'b111111)
      terminate3 = terminate2 + 1'b1;
    else
      begin
        run3 = run2 + in3 + 1'b1;
        terminate3 = terminate2;
      end
    if(in4 == 6'b111111)
      terminate4 = terminate3 + 1'b1;
    else
      begin
        run4 = run3 + in4 + 1'b1;
        terminate4 = terminate3;
      end
    if(in5 == 6'b111111)
      terminate5 = terminate4 + 1'b1;
    else
      begin
        run5 = run4 + in5 + 1'b1;
        terminate5 = terminate4;
      end
    if(in6 == 6'b111111)
      terminate6 = terminate5 + 1'b1;
    else
      begin
        run6 = run5 + in6 + 1'b1;
        terminate6 = terminate5;
      end
    if(in7 == 6'b111111)
      terminate7 = terminate6 + 1'b1;
    else
      begin
        run7 = run6 + in7 + 1'b1;
        terminate7 = terminate6;
      end
    if(in8 == 6'b111111)
        	terminate8 = terminate7 + 1'b1;
    else
      begin
        run8 = run7 + in8 + 1'b1;
        terminate8 = terminate7;
      end
  end

endmodule
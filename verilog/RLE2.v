module RLE2(in,in_next,out_next,en1,en2,en3,en4,en5,en6,en7,en8,run1,run2,run3,run4,run5,run6,run7,run8);
  
  input [63:0]in;
  input [5:0]in_next;
  output wire [5:0]out_next;
  output reg [5:0]run1,run2,run3,run4,run5,run6,run7,run8;

  
  output wire en1,en2,en3,en4,en5,en6,en7,en8;
  wire [7:0]in1,in2,in3,in4,in5,in6,in7,in8;

  
  reg [5:0]zero1,zero2,zero3,zero4,zero5,zero6,zero7,zero8;
  
  assign in1 = in[63:56];
  assign in2 = in[55:48];
  assign in3 = in[47:40];
  assign in4 = in[39:32];
  assign in5 = in[31:24];
  assign in6 = in[23:16];
  assign in7 = in[15:8];
  assign in8 = in[7:0];
  
  
  
  assign en1 = in1||8'b0;
  assign en2 = in2||8'b0;
  assign en3 = in3||8'b0;
  assign en4 = in4||8'b0;
  assign en5 = in5||8'b0;
  assign en6 = in6||8'b0;
  assign en7 = in7||8'b0;
  assign en8 = in8||8'b0;

  
  assign out_next = zero8;
  
  always @(*)
  begin
    if(~en1)
      zero1 = in_next + 1'b1;
    else
      begin
        run1 = in_next;
        zero1 = 0;
      end
    if(~en2)
      zero2 = zero1 + 1'b1;
    else
      begin
        run2 = zero1;
        zero2 = 0;
      end
    if(~en3)
      zero3 = zero2 + 1'b1;
    else
      begin
        run3 = zero2;
        zero3 = 0;
      end
    if(~en4)
      zero4 = zero3 + 1'b1;
    else
      begin
        run4 = zero3;
        zero4 = 0;
      end
    if(~en5)
      zero5 = zero4 + 1'b1;
    else
      begin
        run5 = zero4;
        zero5 = 0;
      end
    if(~en6)
      zero6 = zero5 + 1'b1;
    else
      begin
        run6 = zero5;
        zero6 = 0;
      end
    if(~en7)
      zero7 = zero6 + 1'b1;
    else
      begin
        run7 = zero6;
        zero7 = 0;
      end
    if(~en8)
        	zero8 = zero7 + 1'b1;
    else
      begin
        run8 = zero7;
        zero8 = 0;
      end
  end

endmodule
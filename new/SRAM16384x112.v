`define STIMULUS
// RAM Model
//  CSN : Chip Select Neg
//  WEN : Write Enable Neg
//  WEN=0, CSN=0: 00 WRITE
//  WEN=1, CSN=0: 10 READ 
//  WEN=1, CSN=1: 11 STOP 

module SRAM16384x112
    #(	parameter ADDRESSSIZE = 14,
	     parameter ADDRESSBITSIZE = 16384,		    
       parameter WORDSIZE = 112)
(
 input NWRT,
 input [WORDSIZE-1:0] DIN,
 input [14-1:0] RA,
 //input CA,
 input NCE,
 input CK,
 output [WORDSIZE-1:0] DO 
 );

wire   [WORDSIZE-1:0] wDO;

spsram_hd_16384x112 SRAM_16384x112
(
.CK	(CK		),
.CSN	(NCE		),
.WEN	(NWRT		),
.OEN	(1'b0		),
.A	(RA	),
.DI	(DIN    	),
.DOUT	(wDO		));

assign DO = wDO ; 

endmodule

`ifdef STIMULUS


module spsram_hd_16384x112
    #(	parameter ADDRESSSIZE = 14,
	parameter ADDRESSBITSIZE = 16384,		    
        parameter WORDSIZE = 112)
(
 input                      CK,
 input                      CSN,
 input                      WEN,
 input                      OEN,
 input [ADDRESSSIZE-1:0]    A,
 input [WORDSIZE-1:0]       DI,
 output [WORDSIZE-1:0]      DOUT
 );

 wire [WORDSIZE-1:0] wDOUT ;

SRAM2 SRAM16384x112_2 ( CK, DI, A, WEN, CSN, wDOUT );

assign DOUT = wDOUT ; 

endmodule

module SRAM2
    #(	parameter ADDRESSSIZE = 14,
	     parameter ADDRESSBITSIZE = 16384,		    
       parameter WORDSIZE = 112)
(

 input iClk,
// input iReset,
 input [WORDSIZE-1:0] D,
 input [ADDRESSSIZE-1:0] A,
 input WEN, CSN, 
 output reg [WORDSIZE-1:0] Q
 );

	reg [WORDSIZE-1:0] Mem [0:ADDRESSBITSIZE-1];
	reg [WORDSIZE-1:0] Mem_in ;

	always @(*) begin
	Mem_in = Mem[A] ;
	end

	always @(posedge iClk )    begin

		if (!CSN && !WEN)  
		Mem[A] <= D;
		else if (!CSN && WEN)
		Q <= Mem_in;
		else
		Q <= Q;
	end

endmodule

`else

`endif



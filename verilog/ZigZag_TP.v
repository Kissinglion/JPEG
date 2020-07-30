module ZigZag_TP
#( parameter BW = 8 )

(  input [8*BW-1:0]  i_data,
   input	   i_enable,
   input 	   i_clk,
   input	   i_Reset,
   output reg [8*BW-1:0] o_data
);

  reg [4-1:0]  counter ;
  reg [8*BW-1:0] array [8-1:0];
  reg [8*BW-1:0] data_out;
  
  wire [8*BW-1:0] col [8-1:0];
  wire [3-1:0] index = counter[3-1:0] ;
  wire [8*BW-1:0] w_data;
  
  always@(posedge i_clk) 
  begin
      if(~i_Reset) 
      begin
        counter <= 4'b1111;
        o_data <= {BW{8'b0}}; 
      end
      else    
      begin
        o_data <= w_data ;
        if(i_enable) 
          counter <= counter + 4'b1;
        else 
        begin
        if(counter[3]==1'b1)
          counter <= counter + 4'b1;
   	    else    
     	    counter <= counter ;
   	    end
      end
  end
  
  always@(posedge i_clk) 
  begin
      if(~i_Reset) 
      begin
        array[7] <= {BW{8'b0}};
        array[6] <= {BW{8'b0}};
        array[5] <= {BW{8'b0}};
        array[4] <= {BW{8'b0}};
        array[3] <= {BW{8'b0}};
        array[2] <= {BW{8'b0}};
        array[1] <= {BW{8'b0}};
        array[0] <= {BW{8'b0}};
      end
      else    
      begin
        if(i_enable)
        begin
          array[index] <= i_data ;
        end
      end
  end
  
	assign col[0] = {{array[0][8*BW-1:7*BW]},{array[1][8*BW-1:7*BW]},{array[0][7*BW-1:6*BW]},{array[0][6*BW-1:5*BW]},{array[1][7*BW-1:6*BW]},{array[2][8*BW-1:7*BW]},{array[3][8*BW-1:7*BW]},{array[2][7*BW-1:6*BW]}} ; 
  assign col[1] = {{array[1][6*BW-1:5*BW]},{array[0][5*BW-1:4*BW]},8'b0,{array[1][5*BW-1:4*BW]},{array[2][6*BW-1:5*BW]},{array[3][7*BW-1:6*BW]},{array[4][8*BW-1:7*BW]},{array[5][8*BW-1:7*BW]}} ; 
  assign col[2] = {{array[4][7*BW-1:6*BW]},{array[3][6*BW-1:5*BW]},{array[2][5*BW-1:4*BW]},40'b0} ; 
  assign col[3] = {{array[3][5*BW-1:4*BW]},{array[4][6*BW-1:5*BW]},{array[5][7*BW-1:6*BW]},{array[6][8*BW-1:7*BW]},{array[7][8*BW-1:7*BW]},{array[6][7*BW-1:6*BW]},{array[5][6*BW-1:5*BW]},{array[4][5*BW-1:4*BW]}} ; 
  assign col[4] = 64'b0;
  assign col[5] = {{array[5][5*BW-1:4*BW]},{array[6][6*BW-1:5*BW]},{array[7][7*BW-1:6*BW]},{array[7][6*BW-1:5*BW]},{array[6][5*BW-1:4*BW]},24'b0} ; 
  assign col[6] = 64'b0; 
  assign col[7] = 64'b0;
	/*
  assign col[0] = {{array[0][8*BW-1:7*BW]},{array[1][8*BW-1:7*BW]},{array[0][7*BW-1:6*BW]},{array[0][6*BW-1:5*BW]},{array[1][7*BW-1:6*BW]},{array[2][8*BW-1:7*BW]},{array[3][8*BW-1:7*BW]},{array[2][7*BW-1:6*BW]}} ; 
  assign col[1] = {{array[1][6*BW-1:5*BW]},{array[0][5*BW-1:4*BW]},{array[0][4*BW-1:3*BW]},{array[1][5*BW-1:4*BW]},{array[2][6*BW-1:5*BW]},{array[3][7*BW-1:6*BW]},{array[4][8*BW-1:7*BW]},{array[5][8*BW-1:7*BW]}} ; 
  assign col[2] = {{array[4][7*BW-1:6*BW]},{array[3][6*BW-1:5*BW]},{array[2][5*BW-1:4*BW]},{array[1][4*BW-1:3*BW]},{array[0][3*BW-1:2*BW]},{array[0][2*BW-1:1*BW]},{array[1][3*BW-1:2*BW]},{array[2][4*BW-1:3*BW]}} ; 
  assign col[3] = {{array[3][5*BW-1:4*BW]},{array[4][6*BW-1:5*BW]},{array[5][7*BW-1:6*BW]},{array[6][8*BW-1:7*BW]},{array[7][8*BW-1:7*BW]},{array[6][7*BW-1:6*BW]},{array[5][6*BW-1:5*BW]},{array[4][5*BW-1:4*BW]}} ; 
  assign col[4] = {{array[3][4*BW-1:3*BW]},{array[2][3*BW-1:2*BW]},{array[1][2*BW-1:1*BW]},{array[0][1*BW-1:0*BW]},{array[1][1*BW-1:0*BW]},{array[2][2*BW-1:1*BW]},{array[3][3*BW-1:2*BW]},{array[4][4*BW-1:3*BW]}} ; 
  assign col[5] = {{array[5][5*BW-1:4*BW]},{array[6][6*BW-1:5*BW]},{array[7][7*BW-1:6*BW]},{array[7][6*BW-1:5*BW]},{array[6][5*BW-1:4*BW]},{array[5][4*BW-1:3*BW]},{array[4][3*BW-1:2*BW]},{array[3][2*BW-1:1*BW]}} ; 
  assign col[6] = {{array[2][1*BW-1:0*BW]},{array[3][1*BW-1:0*BW]},{array[4][2*BW-1:1*BW]},{array[5][3*BW-1:2*BW]},{array[6][4*BW-1:3*BW]},{array[7][5*BW-1:4*BW]},{array[7][4*BW-1:3*BW]},{array[6][3*BW-1:2*BW]}} ; 
  assign col[7] = {{array[5][2*BW-1:1*BW]},{array[4][1*BW-1:0*BW]},{array[5][1*BW-1:0*BW]},{array[6][2*BW-1:0*BW]},{array[7][3*BW-1:2*BW]},{array[7][2*BW-1:1*BW]},{array[6][1*BW-1:0*BW]},{array[7][1*BW-1:0*BW]}} ;
  */
  always@(*) 
  begin
    if(counter[3]==1'b1)
    begin
      data_out = col[index] ;
    end
    else
    begin
      data_out = {BW{8'b0}}; 
    end
  end
  
  assign w_data = data_out ; 

endmodule







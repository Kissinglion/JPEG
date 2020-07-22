module sti_version;


reg clk;
reg reset;

initial
begin
	clk <= 1;
	reset <= 0;
	#10
	reset <= 1;
end

always #5 clk <= ~clk;

top_memory_test TEST(clk,reset); // define input & output ports of your top module by youself 

initial	$readmemh("image_in_8.txt", TEST.MEM_IN.SRAM_syn.SRAM32768x64.Mem); //input image, check the path of memory rocation (module instance)

integer f;
integer i;
initial
begin
	f = $fopen("DCT_image_8.txt","w"); //output image, this is the output file that finished 2D-DCT operations.

	#328100;

	for (i = 0; i<32768; i=i+1)
	begin
		$display("DATA %b", TEST.MEM_OUT.SRAM_syn.SRAM32768x64.Mem[i]); //check the path of memory rocation (module instance)
		$fwrite(f,"%b\n",   TEST.MEM_OUT.SRAM_syn.SRAM32768x64.Mem[i]); //check the path of memory rocation (module instance)
	end
   
	#100
	$fclose(f);  
	//$finish;
end


endmodule



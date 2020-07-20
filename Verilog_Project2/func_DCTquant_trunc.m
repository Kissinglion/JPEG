  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%   Result of 2D - DCT Quantization Function  %%%%%%%%%%%%%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function  Block_quant = func_DCTquant_trunc(Block)

for i = 1:8
   for j = 1:8
       if (i==1) && (j==1)
           Block_quant(i,j) = floor(Block(i,j)/4);
       else
           Block_quant(i,j) = floor(Block(i,j));
       end
   end
end

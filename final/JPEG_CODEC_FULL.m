% clear all
% close all
% clc

process = 0;
kkk=0;

Q=[16  11  10  16    24    40     51    61;
   12  12  14  19    26    58     60    55;
   14  13  16  24    40    57     69    56;
   14  17  22  29    51    87     80    62;
   18  22  37  56    68    109    103   77;
   24  35  55  64    81    104    113   92;
   49  64  78  87    103   121    120   101;
   72  92  95  98    112   100    103   99];

Q_pre=[4   11  10  16    24    40     51    61;
       12  12  14  19    26    58     60    55;
       14  13  16  24    40    57     69    56;
       14  17  22  29    51    87     80    62;
       18  22  37  56    68    109    103   77;
       24  35  55  64    81    104    113   92;
       49  64  78  87    103   121    120   101;
       72  92  95  98    112   100    103   99];

A = strings(900,13);
A(1,1) = 'C_quantization_bit';
A(1,2) = 'Result_1D_DCT_quantization_bit';
A(1,3) = 'T1';
A(1,4) = 'T2';
A(1,5) = 'PSNR :';
A(1,6) = 'image_1';
A(1,7) = 'image_2';
A(1,8) = 'image_3';
A(1,9) = 'image_4';
A(1,10) = 'image_5';
A(1,11) = 'image_6';
A(1,12) = 'image_7';
A(1,13) = 'image_8';

filename = 'testdata1.xlsx';
exl = 1;

for c_quant = 8:8
    for result_quant = 9:9
        for t1_matrix = 7:7
            for t2_matrix = 4:4
                 exl = exl + 1;
                 for image_number = 3:3 %%%%%%%%%% "Change this number" to test many different images.

                    %---------------------------- Get the Image data Input ----------------------------------
                     % Load input image (512x512 pixel), Each pixel has 8bit data (0~255)
                     input_image_512x512 = double( imread( sprintf( 'image_in_%d.tif',image_number ),'tiff' ) );
                    %-----------------------------------------------------------------------------------------

                    [m,n] = size(input_image_512x512);

                    m = floor(m/8)*8;
                    n = floor(n/8)*8;
                    
                    for i = 1:8
                        for j = 1:8
                            Q_temp(i,j) = 1/Q_pre(i,j);
                        end
                    end

                    Q_p = quantization(7,Q_temp);

        %% ---------------------Quatization bit setup-----------------------------
        %% 
                        C_quantization_bit =  c_quant;

                        T = func_DCT_Coefficient_quant(C_quantization_bit);
                        Result_1D_DCT_quantization_bit = result_quant;

                        num_int = 11;

                        T1 = zeros(8,8);

                        for i=1:t1_matrix
                            for j=1:8
                                T1(i,j) = T(i,j);
                            end
                        end


                        T2 = zeros(8,8);

                        for i=1:t2_matrix
                            for j=1:8
                                T2(i,j) = T(i,j);
                            end
                        end


        %% --------------------------- DCT OPERATION -----------------------------------------------------------------------
        %% 
                        Image_tran = zeros(m,n);
                        for i=1:m/8
                            for j=1:n/8
                                Block_temp = input_image_512x512((8*i-7):8*i,(8*j-7):8*j);

                                Block_DCT_1D_temp = T1*Block_temp';

                                Block_DCT_1D_quant((8*i-7):8*i,(8*j-7):8*j) = func_DCTquant(Block_DCT_1D_temp, Result_1D_DCT_quantization_bit, num_int);   % result of 1D DCT for debugging

                                Block_DCT_2D_temp = T2*Block_DCT_1D_quant((8*i-7):8*i,(8*j-7):8*j)';

                                Block_DCT_2D_quant((8*i-7):8*i,(8*j-7):8*j) = func_DCTquant_trunc(Block_DCT_2D_temp); % result of 2D DCT for debugging

                                Block_DCT_final((8*i-7):8*i,(8*j-7):8*j) = Block_DCT_2D_quant((8*i-7):8*i,(8*j-7):8*j);

                                Block_DCT = Block_DCT_2D_quant((8*i-7):8*i,(8*j-7):8*j);


                                Block_r = round(Q_p.*Block_DCT);

                                Image_tran((8*i-7):8*i,(8*j-7):8*j) = Block_r;

                            end
                        end
        %% --------------------------- ENTROPY ENCODING ----------------------------------
                        run_level_pairs = ENTROPY_ENCODING(Image_tran);
        %% ---------------------- Run Level Decoding -----------------------------------
        %% 

                        Image_tran = double(ENTROPY_DECODING(run_level_pairs));


        %%                 
                        Image_restore = zeros(256,256);

                        for i=1:m/8
                            for j=1:n/8
                                Block_temp = Image_tran((8*i-7):8*i,(8*j-7):8*j);
                                Block_rq = Q.*Block_temp;
                                Block_IDCT = T2'*Block_rq*T1;
                                Image_restore((8*i-7):8*i,(8*j-7):8*j) = Block_IDCT;
                            end
                        end   

                        for i=1:m
                            for j=1:n
                                if Image_restore(i,j) > 255
                                   Image_restore(i,j) = 255;
                                end

                                if Image_restore(i,j) < 0
                                   Image_restore(i,j) = 0;
                                end

                            end
                        end   
        %% -------------------------Calculate the PSNR--------------------------------
        %%
                    MSE = 0;
                    PSNR = zeros(1,image_number);
                    for row = 1:m
                      for col = 1:n
                        MSE = MSE + (input_image_512x512(row, col) - Image_restore(row, col)) ^ 2;
                      end
                    end

                    MSE = MSE / (m * n);
                    PSNR(1,image_number) = 10 * log10 ((255^2) / MSE)
                    %---------------------------------------------------------------------------
        %             fprintf(aa, 'image_number = %d PSNR = %d\n', image_number,PSNR(1,image_number));
%                     A(exl,image_number+5) = PSNR(1,image_number);
%                     process = process + 1;
%                     processing = process/36;
                 end
             end
        end
    end
end
% sheet = 1;
% xlswrite(filename,A,sheet)
fclose('all');
kkk = kkk+1;
 
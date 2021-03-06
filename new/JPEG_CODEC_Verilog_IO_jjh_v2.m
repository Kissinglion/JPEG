clear all
close all
clc
%% -------------------------- Initialization -----------------------------
ZigZag_Order = uint8([  1  9  2  3  10 17 25 18
                        11 4  5  12 19 26 33 41
                        34 27 20 13 6  7  14 21 
                        28 35 42 49 57 50 43 36 
                        29 22 15 8  16 23 30 37
                        44 51 58 59 52 45 38 31 
                        24 32 39 46 53 60 61 54 
                        47 40 48 55 62 63 56 64 ]);
ZigZag_Order = ZigZag_Order';
                          
Q_pre=[ 4   11  10  16    24    40     51    61
        12  12  14  19    26    58     60    55
        14  13  16  24    40    57     69    56
        14  17  22  29    51    87     80    62
        18  22  37  56    68    109    103   77
        24  35  55  64    81    104    113   92
        49  64  78  87    103   121    120   101
        72  92  95  98    112   100    103   99];

Q   =[  16  11  10  16    24    40     51    61
        12  12  14  19    26    58     60    55
        14  13  16  24    40    57     69    56
        14  17  22  29    51    87     80    62
        18  22  37  56    68    109    103   77
        24  35  55  64    81    104    113   92
        49  64  78  87    103   121    120   101
        72  92  95  98    112   100    103   99];
      
  max_nonzero = 0;
  max_run = 0;
%% INPUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%      Get the Image data Input     %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for index = 3:3
    input_image_512x512 = double( imread(sprintf('image_in_%d.tif',index),'tiff' ));

    % Load DCT output text file from verilog (512x512 pixel)
    % Each pixel has 16bit integer data
    
    RLE = textread(sprintf('DCT_image_rle_%d.txt',index),'%14c');
    RLE_2 = char(zeros(79472,14));
    for i=1:39736
        RLE_2(2*i-1,1)= 0;
        RLE_2(2*i-1,2)= 0;
        RLE_2(2*i-1,3)= 0;
        RLE_2(2*i-1,4)= 0;
        RLE_2(2*i-1,5)= 0;
        RLE_2(2*i-1,6)= 0;
        RLE_2(2*i-1,7)= 0;
        RLE_2(2*i-1,8)= 0;
        RLE_2(2*i-1,9)= 0;
        RLE_2(2*i-1,10)= 0;
        RLE_2(2*i-1,11:16) = RLE(i,1:6);  
        RLE_2(2*i,1)= RLE(i,7);
        RLE_2(2*i,2)= RLE(i,7);
        RLE_2(2*i,3)= RLE(i,7);
        RLE_2(2*i,4)= RLE(i,7);
        RLE_2(2*i,5)= RLE(i,7);
        RLE_2(2*i,6)= RLE(i,7);
        RLE_2(2*i,7)= RLE(i,7);
        RLE_2(2*i,8)= RLE(i,7);
        RLE_2(2*i,9:16) = RLE(i,7:14);
    end
    RLE_verilog = typecast(uint16(bin2dec(char(RLE_2))),'int16');
    RLE_v = RLE_verilog(1:79472,:);
    
    
    M = textread(sprintf('DCT_image_%d.txt',index),'%8c');
    M_2 = char(zeros(262144,16));
    for i=1:262144
        M_2(i,1)= M(i,1);
        M_2(i,2)= M(i,1);
        M_2(i,3)= M(i,1);
        M_2(i,4)= M(i,1);
        M_2(i,5)= M(i,1);
        M_2(i,6)= M(i,1);
        M_2(i,7)= M(i,1);
        M_2(i,8)= M(i,1);
        M_2(i,9:16) = M(i,1:8);
    end
    
%     input_verilog = zeros(512,512);

    for i = 1:79472
        if RLE_v(i,1) < 0
            input_verilog(i,1) = 256 + RLE_v(i,1);
        else
            input_verilog(i,1) = RLE_v(i,1);
        end
    end
    RLE_v = input_verilog;
    image_number = 3;
    input_vector = fopen(sprintf( 'image_decoding_%d.txt',image_number), 'w');
    
    for i = 1:9967
        fprintf(input_vector, '%02X', RLE_v(i,1));
        fprintf(input_vector, '%02X', RLE_v(i+1,1));
        fprintf(input_vector, '%02X', RLE_v(i+2,1));
        fprintf(input_vector, '%02X', RLE_v(i+3,1));
        fprintf(input_vector, '%02X', RLE_v(i+4,1));
        fprintf(input_vector, '%02X', RLE_v(i+5,1));
        fprintf(input_vector, '%02X', RLE_v(i+6,1));
        fprintf(input_vector, '%02X\n', RLE_v(i+7,1));
    end
        

    DCT_image_80b = typecast(uint16(bin2dec(char(M_2))),'int16');

    x=1;
    for k= 1:64
        for i= 1:64
            for j = 1 : 8
                DCT_image( 8*(k-1)+j , 8*(i-1)+1 ) = double(DCT_image_80b(x,1));
                DCT_image( 8*(k-1)+j , 8*(i-1)+2 ) = double(DCT_image_80b(x+1,1));
                DCT_image( 8*(k-1)+j , 8*(i-1)+3 ) = double(DCT_image_80b(x+2,1));
                DCT_image( 8*(k-1)+j , 8*(i-1)+4 ) = double(DCT_image_80b(x+3,1));
                DCT_image( 8*(k-1)+j , 8*(i-1)+5 ) = double(DCT_image_80b(x+4,1));
                DCT_image( 8*(k-1)+j , 8*(i-1)+6 ) = double(DCT_image_80b(x+5,1));
                DCT_image( 8*(k-1)+j , 8*(i-1)+7 ) = double(DCT_image_80b(x+6,1));
                DCT_image( 8*(k-1)+j , 8*(i-1)+8 ) = double(DCT_image_80b(x+7,1));
                x = x+8;
            end
        end
    end


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%    Cut the image for process Convenience   %%%%%
    %%%%%            and get the image data          %%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    [m,n] = size(DCT_image);
    m = floor(m/8)*8;
    n = floor(n/8)*8;

 %% ---------------------Quatization bit setup-----------------------------
    % The number of bits for DCT Coefficient Quantization
    % You can "adjust this number" to improve the qualities of images.
    C_quantization_bit =  8;                          
    T = func_DCT_Coefficient_quant(C_quantization_bit);
    
    T1 = zeros(8,8);
    T2 = zeros(8,8);
    T1(1:7,:) = T(1:7,:);
    T2(1:4,:) = T(1:4,:);
    
    a=im2col(Q_pre, [8 8],'distinct');
    b=a(ZigZag_Order,:); 
    c = col2im(b,   [8 8],   [8 8],   'distinct');
        
%     Q_temp = zeros(8,8);  
%     for i = 1:8
%         for j = 1:8
%             Q_temp(i,j) = 1/c(i,j);
%         end
%     end
%     
%     Q_pre = quantization(7,Q_temp);
%     Q_pre = Q_temp;
    Q = quantization(7,Q);
%     Q = Quant(8,Q);

    input_vec = fopen('Q.txt','w');

    for i = 1:8
        for j = 1:8
            fprintf(input_vec,'%02X \n',Q(i,j));
        end
    end
    fclose(input_vec);


      
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%    2-D DCT Matrix Multiplication     %%%%%%%%%%%%%% 
    %%%%%%%%  Multiplication with Quantization Matrix   %%%%%%%%%%
    %%%%%%%%%%%%%%%%       ROUND  OFF        %%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Image_tran = zeros(m,n);
    for i=1:m/8
        for j=1:n/8
            Block_DCT = (DCT_image((8*i-7):8*i,(8*j-7):8*j));
%             Block_r = round(Q_pre.*Block_DCT);
            Block_r = Block_DCT;
            Image_tran((8*i-7):8*i,(8*j-7):8*j) = Block_r;
        end
    end
%% --------------------------- ENTROPY ENCODING --------------------

        
        % Break 8x8 block into columns
        Single_column_quantized_image=im2col(Image_tran', [8 8],'distinct');
        ZigZaged_Single_Column_Image=Single_column_quantized_image;
        
%% --------------------------- zigzag ----------------------------------
        % using the MatLab Matrix indexing power (specially the ':' operator) rather than any function
%         ZigZaged_Single_Column_Image=Single_column_quantized_image(ZigZag_Order,:);    
        %---------------------------------------------------------------------


        %---------------------- Run Level Coding -----------------------------
        % construct Run Level Pair from ZigZaged_Single_Column_Image
        run_level_pairs=int16([]);

        for block_index=1:4096    %block by block - total 256 blocks (8x8) in the 128x128 image
            single_block_image_vector_64(1:64)=0;
            for Temp_Vector_Index=1:64
                single_block_image_vector_64(Temp_Vector_Index) = ZigZaged_Single_Column_Image(Temp_Vector_Index, block_index);  %select 1 block sequentially from the ZigZaged_Single_Column_Image
            end
            
%             for i = 1:64
%                 if single_block_image_vector_64(i) == 1
%                     single_block_image_vector_64(i) = 0;
%                 elseif single_block_image_vector_64(i) == -1
%                     single_block_image_vector_64(i) = 0;
%                 end
%             end
                
            non_zero_value_index_array = find(single_block_image_vector_64~=0); % index array of next non-zero entry in a block

            if isempty(find(single_block_image_vector_64~=0)) == 1
                non_zero_value_index_array(1) = 0;
            end


            number_of_non_zero_entries = length(non_zero_value_index_array);  % # of non-zero entries in a block
            max_nonzero = max(number_of_non_zero_entries,max_nonzero);
        % Case 1: if first ac coefficient has no leading zeros then encode first coefficient
            if non_zero_value_index_array(1)==0
                run_level_pairs=cat(1,run_level_pairs);

            elseif non_zero_value_index_array(1)==1  
               run=0;   % no leading zero
                run_level_pairs=cat(1,run_level_pairs, run, single_block_image_vector_64(non_zero_value_index_array(1)));
            end

        % Case 2: loop through each non-zero entry    
            for i=2:number_of_non_zero_entries 
                % check # of leading zeros (run)
                run=non_zero_value_index_array(i)-non_zero_value_index_array(i-1)-1;
                max_run = max(max_run,run);

                run_level_pairs=cat(1, run_level_pairs, run, single_block_image_vector_64(non_zero_value_index_array(i)));
                if run == 55
                    iii = run_level_pairs;
                end
            end

        % Case 3: "End of Block" mark insertion
            run_level_pairs=cat(1, run_level_pairs, 255, 255);
        end

        %---------------------------------------------------------------------


        Compressed_image_size = size(run_level_pairs);
        Compression_Ratio = (1-(Compressed_image_size(1,1)/262144))*100



%%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%  After the Transformation  %%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%   Assume lossless entropy coding   %%%%%%%%%%%%%%
    %%%%%%%%   Assume lossless communication channel   %%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
%%  %%%%%%%%%%%%%%%%%%% Decoding %%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%     For the image restoration    %%%%%%%%%%%%%%%%
    %%%%      Multiplication with Quantization Matrix         %%%%
    %%%%%%%%%%%%    2-D IDCT Matrix Multiplication   %%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



    %--------%--------%--------%--------%--------%--------%--------%--------%--%
    %--------- START of Entropy Decoding, Dequantization, 2D IDCT -------------%
    %--------%--------%--------%--------%--------%--------%--------%--------%--%





%%  ---------------------- Run Level Decoding ---------------------
        % construct  ZigZaged_Single_Column_Image from Run Level Pair 

%         error = [];
%         for i = 1:79472
%             if run_level_pairs(i,1) ~= RLE_v(i,1)
%                 if (RLE_v(i,1) ~= 63) & (RLE_v(i,1) ~= 127)
%                     error = cat(1,error,i);
%                 end
%             end
%         end
%         run_level_pairs = RLE_v;

        c=[];
        for i=1:2:size(run_level_pairs) % loop through run_level_pairs
            % Case 1 & Cae 2 
            % concatenate zeros according to 'run' value
            if run_level_pairs(i)<63 % only end of block should have 255 value
                zero_count=0;
                zero_count=run_level_pairs(i);
                for l=1:zero_count    % concatenation of zeros accouring to zero_count
                    c=cat(1,c,0);   % single zero concatenation
                end
                c=cat(1,c,run_level_pairs(i+1)); % concatenate single'level' i.e., a non zero value

            % Case 3: End of Block decoding
            else
                number_of_trailing_zeros= 64-mod(size(c),64);
                for l= 1:number_of_trailing_zeros    % concatenate as much zeros as needed to fill a block
                    c=cat(1,c,0); 
                end
            end
        end
%% -----  prepare the ZigZaged_Single_Column_Image vector ---------
        ZigZaged_Single_Column_Image = zeros(64,4096);
        for i=1:4096
            for j=1:64
                ZigZaged_Single_Column_Image(j,i)=c(64*(i-1)+j);
            end
        end
%% ------------------ reverse zigzag ------------------------------
        reverse_zigzag_order_8x8 = zeros(8,8);
        for k = 1:(size(ZigZag_Order,1) *size(ZigZag_Order,2)) 
            reverse_zigzag_order_8x8(k) = find(ZigZag_Order== k); 
        end
        Single_column_quantized_image = ZigZaged_Single_Column_Image(reverse_zigzag_order_8x8',:);

%% --------- image matrix construction from image column ----------
        Image_tran1 = col2im(Single_column_quantized_image,   [8 8],   [m n],   'distinct');
        Image_tran1 = Image_tran1';


        %  Allocate the array for Image restore
        Image_restore = zeros(256,256);

        for i=1:m/8
            for j=1:n/8
                Block_temp = Image_tran1((8*i-7):8*i,(8*j-7):8*j);
                Block_rq = Q.*Block_temp;
                Block_IDCT = T2'*Block_rq*T1;
                Image_restore((8*i-7):8*i,(8*j-7):8*j) = Block_IDCT;
            end
        end   
%         for i=1:m
%             for j=1:n
%                 if Image_restore(i,j) > 127
%                    Image_restore(i,j) = 127;
%                 end
%                 if Image_restore(i,j) < -128
%                    Image_restore(i,j) = -128;
%                 end
%             end
%         end   
        
%         for i = 1:512
%             for j = 1:512
%                 Image_restore(i,j) = Image_restore(i,j) + 128;
%             end
%         end


%% -------------------Generate the output Image--------------------------
    output_file_name = sprintf('image_out_1.tif');
    imwrite(uint8(Image_restore),output_file_name,'tif');
    
%% -------------------------Calculate the PSNR--------------------------------
    MSE = 0;

    for row = 1:m
      for col = 1:n
        MSE = MSE + (input_image_512x512(row, col) - Image_restore(row, col)) ^ 2;
      end
    end

    MSE = MSE / (m * n);
    PSNR = 10 * log10 ((255^2) / MSE)
    %---------------------------------------------------------------------------
     subplot(2,4,index);
     imshow(Image_restore./255);
     title ( sprintf('Restored image #%d \n PSNR : %d',index,PSNR) )
end
function out = ENTROPY_ENCODING2(in)

        Image_tran = in;
        single_block_image_vector_64 = zeros(0);
        ZigZag_Order = uint8([
                                1  9  2  3  10 17 25 18
                                11 4  5  12 19 26 33 41
                                34 27 20 13 6  7  14 21
                                28 35 42 49 57 50 43 36 
                                29 22 15 8  16 23 30 37
                                44 51 58 59 52 45 38 31 
                                24 32 39 46 53 60 61 54 
                                47 40 48 55 62 63 56 64
                              ]);


        % Break 8x8 block into columns
%         Single_column_quantized_image=im2col(Image_tran, [8 8],'distinct');

        %--------------------------- zigzag ----------------------------------
        % using the MatLab Matrix indexing power (specially the ':' operator) rather than any function
%         ZigZaged_Single_Column_Image=Single_column_quantized_image(ZigZag_Order,:);    
        %---------------------------------------------------------------------
        ZigZaged_Single_Column_Image = in;

        %---------------------- Run Level Coding -----------------------------
        % construct Run Level Pair from ZigZaged_Single_Column_Image
        run_level_pairs=int16([]);

        for block_index=1:1   %block by block - total 256 blocks (8x8) in the 128x128 image
%             single_block_image_vector_64(1:64)=0;
            for Temp_Vector_Index=1:64
                single_block_image_vector_64(Temp_Vector_Index) = ZigZaged_Single_Column_Image(Temp_Vector_Index, block_index);  %select 1 block sequentially from the ZigZaged_Single_Column_Image
            end
            non_zero_value_index_array = find(single_block_image_vector_64~=0); % index array of next non-zero entry in a block
            number_of_non_zero_entries = length(non_zero_value_index_array);  % # of non-zero entries in a block

        % Case 1: if first ac coefficient has no leading zeros then encode first coefficient
            if non_zero_value_index_array(1)==1  
               run=0;   % no leading zero
                run_level_pairs=cat(1,run_level_pairs, run, single_block_image_vector_64(non_zero_value_index_array(1)));
            end

        % Case 2: loop through each non-zero entry    
            for i=2:number_of_non_zero_entries 
                % check # of leading zeros (run)
                run=non_zero_value_index_array(i)-non_zero_value_index_array(i-1)-1;
                run_level_pairs=cat(1, run_level_pairs, run, single_block_image_vector_64(non_zero_value_index_array(i)));
            end

        % Case 3: "End of Block" mark insertion
            run_level_pairs=cat(1, run_level_pairs, 255, 255);
         end
        %---------------------------------------------------------------------
        out = run_level_pairs;

    %     Compressed_image_size = size(run_level_pairs);
    %     Compression_Ratio = 20480/Compressed_image_size(1,1);

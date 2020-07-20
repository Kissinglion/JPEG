function Image_tran = ENTROPY_DECODING(in)

    run_level_pairs = in;
    
    m = 512;
    n = 512;
    Image_tran = zeros(m,n);
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
    ZigZag_Order = ZigZag_Order';
    c=[];
    for i=1:2:size(run_level_pairs), % loop through run_level_pairs
        % Case 1 & Cae 2 
        % concatenate zeros according to 'run' value
        if run_level_pairs(i)<255 % only end of block should have 255 value
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
    %---------------------------------------------------------------------


    %-----  prepare the ZigZaged_Single_Column_Image vector --------------

    for i=1:4096
        for j=1:64
            ZigZaged_Single_Column_Image(j,i)=c(64*(i-1)+j);
        end
    end


    % Finding the reverse zigzag order (8x8 matrix)
    reverse_zigzag_order_8x8 = zeros(8,8);
    for k = 1:(size(ZigZag_Order,1) *size(ZigZag_Order,2)) 
        reverse_zigzag_order_8x8(k) = find(ZigZag_Order== k); 
    end;

    %---------------------------------------------------------------------


    %--------------------------- reverse zigzag --------------------------
    %reverse zigzag procedure using the matrix indexing capability of MatLab (specially the ':' operator)
    Single_column_quantized_image = ZigZaged_Single_Column_Image(reverse_zigzag_order_8x8,:);
    %---------------------------------------------------------------------


    %image matrix construction from image column
    Image_tran = col2im(Single_column_quantized_image,   [8 8],   [m n],   'distinct');

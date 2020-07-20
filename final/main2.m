
input = temp;
% input = im2col(Image_tran, [8 8],'distinct')
% input = im2col(input, [64,4096], 'distinct')
% a  = ENTROPY_ENCODING(Image_tran);
% 
% for i=1:m/8
%     for j=1:n/8
%         Block_temp = input((8*i-7):8*i,(8*j-7):8*j);
%         temp = im2col(Block_temp, [8 8],'distinct');
%     end
% end

out = ZigZag(temp);

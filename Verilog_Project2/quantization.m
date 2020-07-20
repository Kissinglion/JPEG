function output= quantization(quantization_bit,in_fc_quant)
% function output= quantization(in_fc_quant)


%% round_bit으로 반올림하는 함수
%% 
% % in_fc_quant = FCinput;
% in_fc_quant = bias1;
% round_bit = 9;

[r,c,d] = size(in_fc_quant);
maximum = 0;
maximum_minus = 0;
origin_bit = 0;
origin_bit1 = 0;


%% maximum 구하기 (기존에 몇 bit인지 구하기)
%%
for k = 1:d
    for i = 1:r
        for j = 1:c
            maximum = max(maximum,in_fc_quant(i,j,k));
        end
    end
end

for i = 1:20
    if (maximum < power(2,i) && maximum > power(2,i-1))
        origin_bit = i;
    end
end

for k = 1:d
    for i = 1:r
        for j = 1:c
            maximum_minus = max(maximum_minus,-in_fc_quant(i,j,k));
        end
    end
end

for i = 1:20
    if (maximum_minus <= power(2,i) && maximum_minus > power(2,i-1))
        origin_bit1 = i+1;
    end
end
origin_bit = max(origin_bit,origin_bit1);
round_bit = quantization_bit - origin_bit;
%% round_bit 크기만큼 2의 제곱해서 곱해주기
%%
for k = 1:d
    for i = 1:r
        for j = 1:c
            input_vector(i,j,k) = in_fc_quant(i,j,k)*power(2, round_bit);
        end
    end
end
%% 반올림해주기 -> round_bit밑으로 다 버리기
%%
for k = 1:d
    for i = 1:r
        for j = 1:c
            inputt(i,j,k) = floor(input_vector(i,j,k));
        end
    end
end
%% 반올림해준 수 다시 나누기 -> 소수로 만들기
%% 
for k = 1:d
    for i = 1:r
        for j = 1:c
            output(i,j,k) = inputt(i,j,k)/power(2,round_bit);
        end
    end
end

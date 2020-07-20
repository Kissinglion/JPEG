function output= quantization_bias4(quantization_bit,input)
%% 음수는 2의 보수 취해주고 text로 저장해주기(3차원)
%% 

[r,c,d] = size(input);

maximum = 0;
maximum_minus = 0;
origin_bit = 0;
origin_bit1 = 0;

input_vector = zeros(r,c,d);
inputt = zeros(r,c,d);
%% round_bit 크기만큼 2의 제곱해서 곱해주기
%% 
for k = 1:d
    for i = 1:r
        for j = 1:c
            input_vector(i,j,k) = input(i,j,k)*power(2, quantization_bit);
        end
    end
end
%% maximum 구하기
%% 
for k = 1:d
    for i = 1:r
        for j = 1:c
            maximum = max(maximum,input_vector(i,j,k));
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
            maximum_minus = max(maximum_minus,-input_vector(i,j,k));
        end
    end
end

for i = 1:20
    if (maximum_minus <= power(2,i) && maximum_minus > power(2,i-1))
        origin_bit1 = i+1;
    end
end
origin_bit = max(origin_bit,origin_bit1);
%% 2의보수취해주기
%% 
for k = 1:d
    for i = 1:r
        for j = 1:c
            inputt(i,j,k) = floor(input_vector(i,j,k));
            if inputt(i,j,k) < 0
                inputt(i,j,k) = power(2,quantization_bit) + inputt(i,j,k);
            end
        end
    end
end
%% 저장하기
%%
input_vec = fopen('bias4_10bit.txt','w');

for k = 1:d
    for i = 1:r
        for j = 1:c
            fprintf(input_vec, '%03X \n', inputt(i,j,k));
        end
    end
end
output = input;

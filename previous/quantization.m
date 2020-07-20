function output= quantization(quantization_bit,in_fc_quant)
% function output= quantization(in_fc_quant)


%% round_bit���� �ݿø��ϴ� �Լ�
%% 
% % in_fc_quant = FCinput;
% in_fc_quant = bias1;
% round_bit = 9;

[r,c,d] = size(in_fc_quant);
maximum = 0;
maximum_minus = 0;
origin_bit = 0;
origin_bit1 = 0;


%% maximum ���ϱ� (������ �� bit���� ���ϱ�)
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
%% round_bit ũ�⸸ŭ 2�� �����ؼ� �����ֱ�
%%
for k = 1:d
    for i = 1:r
        for j = 1:c
            input_vector(i,j,k) = in_fc_quant(i,j,k)*power(2, round_bit);
        end
    end
end
%% �ݿø����ֱ� -> round_bit������ �� ������
%%
for k = 1:d
    for i = 1:r
        for j = 1:c
            inputt(i,j,k) = floor(input_vector(i,j,k));
        end
    end
end
%% �ݿø����� �� �ٽ� ������ -> �Ҽ��� �����
%% 
for k = 1:d
    for i = 1:r
        for j = 1:c
            output(i,j,k) = inputt(i,j,k)/power(2,round_bit);
        end
    end
end

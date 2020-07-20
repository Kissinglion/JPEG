%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%   DCT Coefficient Quantization Function  %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function  T_quant = func_DCT_Coefficient_quant(num_bin)
%% num_bin : The DCT Quantization bit allocation 
%% Each DCT coefficients
a = 0.5*cos(pi/16);
b = 0.5*cos(2*pi/16);
c = 0.5*cos(3*pi/16);
d = 0.5*cos(4*pi/16);
e = 0.5*cos(5*pi/16);
f = 0.5*cos(6*pi/16);
g = 0.5*cos(7*pi/16);

%coefficient matrix
  T=[ d  d  d  d  d  d  d  d;
      a  c  e  g -g -e -c -a;
      b  f -f -b -b -f  f  b;
      c -g -a -e  e  a  g -c;
      d -d -d  d  d -d -d  d;
      e -a  g  c -c -g  a -e;
      f -b  b -f -f  b -b  f;
      g -e  c -a  a -c  e -g];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Change from Decimal to Binary number %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      
for i = 1:8
   for j = 1:8
       T_bi(i,j,:) = func_Dec2Bin_mag(T(i,j), num_bin);
   end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Again Change from Binary to Decimal number %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      
for i = 1:8
   for j = 1:8
       num_int = 0;
       T_quant(i,j) = func_Bin2Dec_mag(T_bi(i,j,:), num_int, num_bin);
   end
end

% aa = [a,b,c,d,e,f,g];
% bb = quantization(num_bin-1,aa);
% bb = quantization_bias4(num_bin-1,bb);
% a = bb(1);
% b = bb(2);
% c = bb(3);
% d = bb(4);
% e = bb(5);
% f = bb(6);
% g = bb(7);
% 
%   T_quant1=[ d  d  d  d  d  d  d  d;
%             a  c  e  g -g -e -c -a;
%             b  f -f -b -b -f  f  b;
%             c -g -a -e  e  a  g -c;
%             d -d -d  d  d -d -d  d;
%             e -a  g  c -c -g  a -e;
%             f -b  b -f -f  b -b  f;
%             g -e  c -a  a -c  e -g];

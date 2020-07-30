% function out = IDCT(in)

% input = round(rand(1,8)*100);
input = [2,4,8,16,32,64,32,32];
%% Each DCT coefficients
a = 0.5*cos(pi/16);
b = 0.5*cos(2*pi/16);
c = 0.5*cos(3*pi/16);
d = 0.5*cos(4*pi/16);
e = 0.5*cos(5*pi/16);
f = 0.5*cos(6*pi/16);
g = 0.5*cos(7*pi/16);

c1 = a;
c2 = b;
c3 = c;
c4 = d;
c5 = e;
c6 = f;
c7 = g;
%coefficient matrix
  T=[ d  d  d  d  d  d  d  d;
      a  c  e  g -g -e -c -a;
      b  f -f -b -b -f  f  b;
      c -g -a -e  e  a  g -c;
      d -d -d  d  d -d -d  d;
      e -a  g  c -c -g  a -e;
      f -b  b -f -f  b -b  f;
      g -e  c -a  a -c  e -g];
%% DCT
% in = T*input';
in = input;
%% 
  
out = zeros(1,8);

x0 = in(1,1);
x1 = in(1,2);
x2 = in(1,3);
x3 = in(1,4);
x4 = in(1,5);
x5 = in(1,6);
x6 = in(1,7);
x7 = in(1,8);

a0 = (x0 + x4) * c4;
a1 = (x0 - x4) * c4;



b1 = c2*x2;
b2 = c2*x6;
b3 = c6*x2;
b4 = c6*x6;

%% 
  
%   u0 = c4*(a0) + b1 + b4;
%   u1 = c4*(a1) + b3 - b2;
%   u2 = c4*(a1) - b3 + b2;
%   u3 = c4*(a0) - b1 - b4;

  u0 = a0 + b1 + b4;
  u1 = a1 + b3 - b2;
  u2 = a1 - b3 + b2;
  u3 = a0 - b1 - b4;
  
  v0 = c1*x1 + c3*x3 + c5*x5 + c7*x7;
  v1 = c3*x1 + c7*(-x3) + c1*(-x5) + c5*(-x7);
  v2 = c5*x1 + c1*(-x3) + c7*x5 + c3*x7;
  v3 = c7*x1 + c5*(-x3) + c3*x5 + c1*(-x7);
  
  out1 = T'*in';
  out(1,1) = (u0+v0);
  out(1,2) = (u1+v1);
  out(1,3) = (u2+v2);
  out(1,4) = (u3+v3);
  out(1,5) = (u3-v3);
  out(1,6) = (u2-v2);
  out(1,7) = (u1-v1);
  out(1,8) = (u0-v0);
  
 
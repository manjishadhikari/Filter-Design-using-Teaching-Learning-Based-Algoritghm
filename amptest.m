function [Amp]= Ampfunc(h)
clc;
clear all;
close all;
h=[ 0.1054   -0.0001   -0.3185    0.5016   -0.3185   -0.0001    0.1054
]
M=(size(h,2)+1)/2;
%syms w
w=0;
for i=1:21
g=0;
for n=1:M-1
    g=g+(h(n)*cos(w*(n-M)));
end
w=w+(0.1*(pi/2));
amp(i)=h(M)+(2*g);
end
w=0:(0.1*(pi/2)):(pi);
logamp=20*log(abs(amp));
plot(w,logamp)
end

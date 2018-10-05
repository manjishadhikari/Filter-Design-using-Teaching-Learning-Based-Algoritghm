
%Low Pass Filter Design Error Function

function [E]=HighPassErrorFuncmod(h)
syms w
% parameters
w_c =1;
N=size(h,2);
M=(N+1)/2;

E=double(vpa(int((AmplitudeResponse(M,h)).^2,0,w_c)+int((AmplitudeResponse(M,h)-1).^2,w_c,pi)));
end

function [ A ] = AmplitudeResponse( M,h )

syms w
g=0;
for n=1:M-1
    g=g+h(n)*cos(w*(n-M));
end
A=h(M)+2*g;
end


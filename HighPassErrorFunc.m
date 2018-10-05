
%Low Pass Filter Design Error Function

function [E]=HighPassErrorFunc(h)
syms w
% parameters
w_c =pi/2;
N=size(h,2);
M=(N+1)/2;

E=double(vpa(int((AmplitudeResponse(M,h)).^2,0,w_c)+int((AmplitudeResponse(M,h)-1).^2,w_c,pi)));
end

function [ A ] = AmplitudeResponse( M,h )

syms w
A=h(M);
for n=1:M-1
    A=A+2.*h(n)*cos(w*(n-M));
end
end


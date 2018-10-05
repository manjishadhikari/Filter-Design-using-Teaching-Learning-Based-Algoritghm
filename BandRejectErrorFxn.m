function [E]=BandRejectErrorFxn(h)
syms w
% parameters
w_c1 =pi/4;
w_c2=3*pi/4;
N=size(h,2);

M=(N+1)/2;
E=double(vpa(int((AmplitudeResponse(M,h)-1).^2,0,w_c1)+int((AmplitudeResponse(M,h)).^2,w_c1,w_c2)+int((AmplitudeResponse(M,h)-1).^2,w_c2,pi)));
end

function [ A ] = AmplitudeResponse( M,h )

syms w
A=h(M);
for n=1:M-1
     A=A+2.*h(n)*cos(w*(n-M));
end
end


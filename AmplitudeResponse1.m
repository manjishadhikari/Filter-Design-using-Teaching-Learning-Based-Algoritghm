function [ A ] = AmplitudeResponse1( N,h )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
syms w
A=h(N/2)/2;
for n=0:N/2-1
    A=A+h(N/2-n)*cos(w*n);
end
A=2*A;
end


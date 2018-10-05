
h=[ 0.1056    0.0006   -0.3185    0.4976   -0.3185    0.0006    0.1056];
M=(size(h,2)+1)/2;
w=0;
for i=1:100

    A=h(M);
        for n=1:M-1
        A=A+2.*h(n)*cos(w*(n-M));
        end
     A(i)=A;
     w=w+0.01;
end
w=0:0.01:1;
logamp=20*log(abs(A(i)));
subplot(2,1,1)
plot(w,logamp)
grid;
subplot(2,1,2)
plot(w,abs(A(i)));
grid;


function []= Ampfunc(h)

M=(size(h,2)+1)/2;

w=0;
for i=1:2001
g=0;
for n=1:M-1
    g=g+(h(n)*cos(w*(n-M)));
end
w=w+(0.001*(pi/2));
amp(i)=h(M)+(2*g);
end
w=0:(0.001*(pi/2)):(pi);
logamp=20*log(abs(amp));
plot(w/pi,logamp)
grid;
xlabel('Normalised Frequency');
ylabel('Magnitude Response (dB)');
title(' Low Pass Filter ');
end
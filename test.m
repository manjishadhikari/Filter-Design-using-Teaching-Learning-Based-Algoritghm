%Teacher phase
ul=0.9;
ll=0.05;
pn=10;
dv=3;  
x=(ul-ll).*rand(pn,dv)+ll;
 

for j=1:pn
    f(j,1)=0;
for i=1:dv
 value(j,i)= x(j,i).^2;
f(j,1)=f(j,1)+value(j,i);
end
end
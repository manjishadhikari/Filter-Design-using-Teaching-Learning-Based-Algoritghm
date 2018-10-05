clc;
clear all;
close all;
%Teacher phase
ul=30;
ll=-30;
pn=10;
dv=2;
gn=20;
for it=1:gn
    if it==1   
x=(ul-ll).*rand(pn,dv)+ll;
    else
x=x4;
    end
for j=1:pn
g=0;  
for i=1:(dv-1)
value=100*((((x(j,i)).^2)-(x(j,i+1)).^2))+((1-x(j,i)).^2);
g=value+g;
end
f(j,1)=g;
end
m=mean(x);
a=min(f);
for i=1:pn
    if f(i,1)==a
        Xteacher=x(i,:);
    end
end
        
   
for i=1:pn
    r=rand(1);
    Tf=round(1+rand(1));
    D=r.*(Xteacher-(Tf.*m));
    x1(i,:)=x(i,:)+D;
end
for i=1:pn
    for j=1:dv
        if x1(i,j)>ul
            x1(i,j)=ul;
        end
        if x1(i,j)<ll
            x1(i,j)=ll;
        end
    end
end 

for j=1:pn
g=0;  
for i=1:(dv-1)
value=100*((((x1(j,i)).^2)-(x1(j,i+1)).^2))+((1-x1(j,i)).^2);
g=value+g;
end
f1(j,1)=g;
end   
for i=1:pn
       if f1(i,:)<f(i,:)
           x2(i,:)=x1(i,:);
     elseif f1(i,:)>f(i,:)
           x2(i,:)=x(i,:);
       end
   end
   

 for j=1:pn
g=0;  
for i=1:(dv-1)
value=100*((((x2(j,i)).^2)-(x2(j,i+1)).^2))+((1-x2(j,i)).^2);
g=value+g;
end
f2(j,1)=g;
end  
%learners phase

for i=1:pn
    j=floor(rand()*pn)+1;
    while j==i
        j=floor(rand()*pn)+1;
    end
     k=floor(rand()*pn)+1;
    while k==i||k==j
        k=floor(rand()*pn)+1;
    end
    if f2(k)<f2(j)
        x3(i,:)=x2(i,:)+rand*(x2(k,:)-x2(j,:));
    end
    if f2(k)>f2(j)
        x3(i,:)=x2(i,:)+rand*(x2(j,:)-x2(k,:));
    end
end     
 
% for j=1:pn

for j=1:pn
g=0;  
for i=1:(dv-1)
value=100*((((x3(j,i)).^2)-(x3(j,i+1)).^2))+((1-x3(j,i)).^2);
g=value+g;
end
f3(j,1)=g;
end   
for i=1:pn
       if f3(i,:)<f2(i,:)
           x4(i,:)=x3(i,:);
     elseif f3(i,:)>f2(i,:)
           x4(i,:)=x2(i,:);
       end
   end   
for i=1:pn
    for j=1:dv
        if x4(i,j)>ul
            x4(i,j)=ul;
        elseif x4(i,j)<ll
            x4(i,j)=ll;
        end
    end
end

for j=1:pn
g=0;  
for i=1:(dv-1)
value=100*((((x4(j,i)).^2)-(x4(j,i+1)).^2))+((1-x4(j,i)).^2);
g=value+g;
end
f4(j,1)=g;
end
mfv(it,1)=min(f4);
end
it=1:gn;
    plot(it,mfv) 
x4

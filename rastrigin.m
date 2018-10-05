clc;
clear all;
close all;
%Teacher phase
ul=5.12;
ll=-5.12;
pn=20;
dv=2;
gn=50;
for it=1:gn
    if it==1   
x=(ul-ll).*rand(pn,dv)+ll;
    else
x=x4;
    end
% for j=1:pn
%     f(j,1)=0;
% for i=1:dv
%  value(j,i)= x(j,i).^2;
% f(j,1)=f(j,1)+value(j,i);
% end
% end
fdash=0;k1=1;
    while(k1<=pn)
    for j=1:dv
    gdash=(((x(k1,j))^2)-(10*cos(2*pi*x(k1,j)))+10);
    fdash=fdash+gdash;
    f(k1,1)=fdash;      
    end
    k1=k1+1;
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
   

fdash=0;k1=1;
    while(k1<=pn)
    for j=1:dv
    gdash=(((x1(k1,j))^2)-(10*cos(2*pi*x1(k1,j)))+10);
    fdash=fdash+gdash;
    f1(k1,1)=fdash;      
    end
    k1=k1+1;
   end
   for i=1:pn
       if f1(i,:)<f(i,:)
           x2(i,:)=x1(i,:);
     elseif f1(i,:)>f(i,:)
           x2(i,:)=x(i,:);
       end
   end

fdash=0;k1=1;
    while(k1<=pn)
    for j=1:dv
    gdash=(((x2(k1,j))^2)-(10*cos(2*pi*x2(k1,j)))+10);
    fdash=fdash+gdash;
    f2(k1,1)=fdash;      
    end
    k1=k1+1;
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
 
fdash=0;k1=1;
    while(k1<=pn)
    for j=1:dv
    gdash=(((x3(k1,j))^2)-(10*cos(2*pi*x3(k1,j)))+10);
    fdash=fdash+gdash;
    f3(k1,1)=fdash;      
    end
    k1=k1+1;
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

fdash=0;k1=1;
    while(k1<=pn)
    for j=1:dv
    gdash=(((x4(k1,j))^2)-(10*cos(2*pi*x4(k1,j)))+10);
    fdash=fdash+gdash;
    f4(k1,1)=fdash;      
    end
    k1=k1+1;
   end

mfv(it,1)=min(f4);
end
it=1:gn;
    plot(it,mfv);
    grid;
x4

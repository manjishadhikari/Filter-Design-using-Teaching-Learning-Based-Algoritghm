clc;
clear all;
close all;

%Teacher phase
ul=100;
ll=-100;
pn=10;
dv=3;
gn=20;
for it=1:gn
    if it==1   
x=(ul-ll).*rand(pn,dv)+ll;
    else
x=x4;
    end
for i=1:pn
f(i,1)=((x(i,1)-x(i,2)).^2)+((x(i,1)+x(i,2)-10)/3).^2;
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
  for i=1:pn
f1(i,1)=((x1(i,1)-x1(i,2)).^2)+((x1(i,1)+x1(i,2)-10)/3).^2;
end
   for i=1:pn
       if f1(i,:)<f(i,:)
           x2(i,:)=x1(i,:);
     elseif f1(i,:)>f(i,:)
           x2(i,:)=x(i,:);
       end
   end
   
for i=1:pn
f2(i,1)=((x2(i,1)-x2(i,2)).^2)+((x2(i,1)+x2(i,2)-10)/3).^2;
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
 
for i=1:pn
f3(i,1)=((x3(i,1)-x3(i,2)).^2)+((x3(i,1)+x3(i,2)-10)/3).^2;
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
for i=1:pn
f4(i,1)=((x4(i,1)-x4(i,2)).^2)+((x4(i,1)+x4(i,2)-10)/3).^2;
end
mfv(it,1)=min(f4);
end
it=1:gn;
    plot(it,mfv)
x4

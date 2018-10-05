
%Teacher phase
ul=0.00009;
ll=0.0000005;
pn=10;
dv=3;
gn=20;
for it=1:gn
    if it==1   
x=(ul-ll).*rand(pn,dv)+ll;
    else
x=x4;
    end
f=x(:,1)+x(:,2)+x(:,3);
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
   f1=x1(:,1)+x1(:,2)+x1(:,3);
   for i=1:pn
       if f1(i,:)<f(i,:)
           x2(i,:)=x1(i,:);
     elseif f1(i,:)>f(i,:)
           x2(i,:)=x(i,:);
       end
   end
   
f2=x2(:,1)+x2(:,2)+x2(:,3);
   
%learners phase
i=randi(10);
j=randi(10);
if(i==j)
     j=randi(10);
end

for i=1:pn
    ri=rand(1);  
    if f2(i,:)<f2(j,:)
          x3(i,:)=x2(i,:)+(ri.*(x2(i,:)-x2(j,:)));
    else
        x3(i,:)=x2(i,:)+(ri.*(x2(j,:)-x2(i,:)));
    end
end
     
 
       f3=x3(:,1)+x3(:,2)+x3(:,3);
   for i=1:pn
       if f3(i,:)<f2(i,:)
           x4(i,:)=x3(i,:);
     elseif f2(i,:)>f2(i,:)
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
f4=x4(:,1)+x4(:,2)+x4(:,3);
mfv(it,1)=min(f4);
end
it=1:gn;
    plot(it,mfv)
x4

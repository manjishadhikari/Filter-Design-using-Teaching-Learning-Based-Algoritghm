clc;
clear all;
%Teacher phase
uLimit=1;
lLimit=-1;
population=20;
designVar=4;
generations=10;

hLearned=zeros(population,designVar);
h=(uLimit-lLimit).*rand(population,designVar)+lLimit;
err=zeros(population,1);
err2=zeros(population,1);
err3=zeros(population,1);
minErrs=zeros(generations,1);
for gn=1:generations
%% Teacher Phase
for i = 1:population
    err(i)=ErrorFunc(h(i,:));
end
[min_err,i]=min(err);
h_teacher=h(i,:);

hTaught=h+rand(20,1)*(h_teacher-(round(1+rand(1))*mean(h)));
hTaught(h>uLimit)=uLimit;
hTaught(h<lLimit)=lLimit;

for i = 1:population
    err2(i)=ErrorFunc(hTaught(i,:));
end
h2=h;
h2(err>err2)=hTaught(err>err2);
for i = 1:population
    err2(i)=ErrorFunc(h2(i,:));
end

%% Learner Phase

for i =1:population
   hval=h2(i,:);
   hval2=h2(floor(rand()*population)+1,:);
   if ErrorFunc(hval)>ErrorFunc(hval2)
       hLearned(i,:)=hval2+rand(1)*(hval-hval2);
   else
       hLearned(i,:)=hval+rand(1)*(hval2-hval);
   end
end
for i = 1:population
    err3(i)=ErrorFunc(hLearned(i,:));
end
hLearned(err3>err2)=h2(err3>err2);
hLearned(h>uLimit)=uLimit;
hLearned(h<lLimit)=lLimit;
for i = 1:population
    err3(i)=ErrorFunc(hLearned(i,:));
end
h=hLearned;
sprintf('iteration %d completed' ,gn)
minErrs(gn)=min(err3);
end

plot(1:generations,minErrs);

clc;
clear all;
%Teacher phase
uLimit=1;
lLimit=-1;
population=30;
designVar=7; % Should be odd
generations=50;

hLearned=zeros(population,designVar);
h=(uLimit-lLimit).*rand(population,designVar)+lLimit;
for i = 1:(designVar-1)/2
    h(:,designVar-i+1)=h(:,i);
end
err=zeros(population,1);
errTaught=zeros(population,1);
errLearned=zeros(population,1);
minErrs=zeros(generations,1);
for gn=1:generations
%% Teacher Phase
for i = 1:population
    err(i)=Bandpasserrorfunc(h(i,:));
end
[min_err,i]=min(err);
h_teacher=h(i,:);

hTaught=h+rand(population,1)*(h_teacher-(round(1+rand(1))*mean(h)));
hTaught(hTaught>uLimit)=uLimit;
hTaught(hTaught<lLimit)=lLimit;

for i = 1:population
    errTaught(i)=Bandpasserrorfunc(hTaught(i,:));
end

hTaught(errTaught>err,:)=h(errTaught>err,:);

for i = 1:population
    errTaught(i)=Bandpasserrorfunc(hTaught(i,:));
end


%% Learner Phase

for i =1:population
   hval=hTaught(i,:);
   hval2=hTaught(floor(rand()*population)+1,:);
   if Bandpasserrorfunc(hval)>Bandpasserrorfunc(hval2)
       hLearned(i,:)=hval2+rand(1)*(hval-hval2);
   else
       hLearned(i,:)=hval+rand(1)*(hval2-hval);
   end
end

for i = 1:population
    errLearned(i)=Bandpasserrorfunc(hLearned(i,:));
end

hLearned(errLearned>errTaught,:)=hTaught(errLearned>errTaught,:);
hLearned(hLearned>uLimit)=uLimit;
hLearned(hLearned<lLimit)=lLimit;
for i = 1:population
    errLearned(i)=Bandpasserrorfunc(hLearned(i,:));
end
h=hLearned;
sprintf('iteration %d completed' ,gn)
minErrs(gn)=min(errLearned);
end
subplot(2,1,1);
plot(1:generations,minErrs);
xlabel('No. of Iterations'); ylabel('Error Value'); grid;
title(' Band Reject Filter Design Using TLBO Optimization ');

%Final Filter Coefficients
for i = 1:population
    err(i)=Bandpasserrorfunc(h(i,:));
end
[min_err,i]=min(err);
h_final=h(i,:)
Ampfunc(h_final)
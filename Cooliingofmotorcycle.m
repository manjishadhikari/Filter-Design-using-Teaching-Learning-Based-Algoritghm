%Hot Portion

u=11.11; 
l=6.27*(10^(-2));
v=20.02*(10^(-6));
Re=u*l/v;
Pr=0.694; %For Plate temp=70 degrees
k=0.02966;
Nux=0.332*Re^(0.5)*Pr^(0.333);
h=Nux*k/l;
A=8.1*8.1*10^(-4); %Area of Plate
platetemp=70;
for ambtemp=35:45
    Q=h*A*(platetemp-ambtemp);
end

platetemp=26;
Pr=0.707;
v=1.568*10^(-5);%For Plate temp=70 degrees
Re=u*l/v;
k=0.0264;
Nux=0.332*Re^(0.5)*Pr^(0.333);
h=Nux*k/l;
for ambtemp=35:45
   Q=h*A*(ambtemp-platetemp);
    Tf=platetemp+Q/(h*A)
    plot(ambtemp,Tf,'Red')
end

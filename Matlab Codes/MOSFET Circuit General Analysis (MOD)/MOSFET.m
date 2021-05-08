function MOSFET(Kn,Vt,A,DX,B,C,DY,D,Vgs_start,dVgs,Vgs_end,Vds_point,ID_point)

format shortG;

Vds=0:0.01:12;
Vgs=Vgs_start:dVgs:Vgs_end;
m=length(Vds);
n=length(Vgs);

cur = zeros(n,m);

for i=1 : n
    for j=1 : m
        if Vgs(i) < Vt
           cur(i,j)=0;
        elseif Vds(j) >= (Vgs(i)-Vt)
           cur(i,j)=Kn*(Vgs(i)-Vt)^2;
        elseif Vds(j) < (Vgs(i) - Vt)
           cur(i,j)= Kn*(2*(Vgs(i)-Vt)*Vds(j)-Vds(j)^2);
        end
     end
end

axes('XTick',A:DX:B,'YTick',C:DY:D,'NextPlot','add');  
for jjj=1 : n
plot(Vds,cur(jjj,:),'K')
hold on
end
hold on
plot(Vds,Kn*Vds.^2)
hold on
plot(Vds_point,ID_point,'ro','MarkerFaceColor','r','linewidth',2)
axis([A B C D])  %%% after "plot" command
xlabel('Vds  (V)')
ylabel('Drain Current  I_D (A)')
title('I-V Characteristics of a MOSFET')
end

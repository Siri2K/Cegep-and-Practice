%% Program Clean
clc; clear; close all; format shortG

%% Input Values
disp('<strong>Input all MOSFET values </strong>');

disp('<strong>Note:</strong>use provided circuit to determine which component each value applies to')
image = imread('Mosfet-Circuit-General.png');
imshow(image);
fprintf('\n');

Vdd = input('Vdd (in V) = ');
Vt = input('VT (in V) = ');
Kn=input('Kn = '); 
fprintf('\n');

disp('<strong>Note:</strong> if there is no resistor at the designated position, simply write <strong>0</strong>')
disp('<strong>Note:</strong>use provided circuit to determine which resistor value apply to which resistor')
fprintf('\n');

Rg1=input('RG1(in ohms) =  ');
Rg2=input('RG2(in ohms) =  ');
Rd=input('RD(in ohms) =  ');
Rs=input('RS(in ohms) =  ');

Rt=Rd+Rs;
if Rg1==0 ||Rg2 ==0
    Vg = input('VG (in V) = ');
    fprintf('\n');
else
    Vg=Vdd*Rg2/(Rg1+Rg2);
    fprintf('\n');
end

disp('<strong>Answ:</strong>');

%% Calculated Values
a1=Kn*(Rs^2);
a2=-(1.0+2.0*(Vg-Vt)*Rs*Kn);
a3=Kn*(Vg-Vt)^2;
p1=[a1,a2,a3];
r_sat=roots(p1);    % r_sat(1),  r_sat(2)
if a1 == 0
   r_sat(2)=r_sat(1);
end     
     
b1=2.0*Rs*Rt-Rt^2;
b2=2.0*Vdd*Rt-2.0*(Vg-Vt)*Rt-2.0*Rs*Vdd-1.0/Kn;
b3=2.0*(Vg-Vt)*Vdd-Vdd^2;
p2=[b1,b2,b3];
r_tri=roots(p2);   %r_tri(1), r_tri(2) 
if b1 == 0
   r_tri(2)=r_tri(1);
end

%% MOSFET region calculations
if Vg < Vt  %  at this point the MOSFET is in 'cut off" region
     Id=0.0;
     Vds=Vdd-Id*Rt;
     Vgs=Vg-Id*Rs;
     % print out result
     
     disp('cut-off region');
     fprintf('Vgs is %15.8f Volts\n',Vgs)
     fprintf('Drain current I_D is %15.8f Amperes %15.8f mA\n',Id ,Id*1000)
     fprintf('Drain-source voltage Vds is %15.8f Volts\n', Vds)
     
elseif Vg >= Vt+r_sat(1)*Rs && Vg <= Vt+Vdd-r_sat(1)*Rd 
    % Id is calculated assuming device is in saturation
    Id=r_sat(1);
    Vgs=Vg-Id*Rs;
    Vds=Vdd-Id*Rt;
    % print out results
    
    disp('saturation region');
    fprintf('Vgs is %15.8f Volts\n',Vgs)
    fprintf('Drain current I_D is %15.8f Amperes %15.8f mA\n',Id ,Id*1000)
    fprintf('Drain-source voltage Vds is %15.8f Volts\n', Vds)
    
elseif Vg >= Vt+r_sat(2)*Rs && Vg <= Vt+Vdd-r_sat(2)*Rd   
   % Id is calculated assuming device is in saturation
    Id=r_sat(2);
    Vgs=Vg-Id*Rs;
    Vds=Vdd-Id*Rt;
    
    % print out results
    disp('saturation region');
    fprintf('Vgs is %15.8f Volts\n',Vgs)
    fprintf('Drain current I_D is %15.8f Amperes %15.8f mA\n',Id,Id*1000)
    fprintf('Drain-source voltage Vds is %15.8f Volts\n', Vds)
    
elseif Vg > Vt+Vdd-r_tri(1)*Rd   
     % Id is calculated assuming device is in triode
    Id=r_tri(1);
    Vgs=Vg-Id*Rs;
    Vds=Vdd-Id*Rt;
    
    % print out results
    disp('triode region');
    fprintf('Vgs is %15.8f Volts\n',Vgs)
    fprintf('Drain current I_D is %15.8f Amperes %15.8f mA\n',Id,Id*1000)
    fprintf('Drain-source voltage Vds is %15.8f Volts\n', Vds)
    
elseif Vg > Vt+Vdd-r_tri(2)*Rd   
    % Id is calculated assuming device is in triode
    Id=r_tri(2);
    Vgs=Vg-Id*Rs;
    Vds=Vdd-Id*Rt;
    
    % print out results
    disp('triode region');
    fprintf('Vgs is %15.8f Volts\n',Vgs)
    fprintf('Drain current I_D is %15.8f Amperes %15.8f mA\n',Id,Id*1000)
    fprintf('Drain-source voltage Vds is %15.8f Volts\n', Vds)
    
else  
     disp('wrong region');
end
%% MOSFET Graphing
A=0;
DX=1;
B=Vdd+2;

C=0;
DY=1e-3;
D=0.05;
Vgs_start=2;
dVgs=1;
Vgs_end=8;

% MOSFET(Kn,Vt,A,DX,B,C,DY,D,Vgs_start,dVgs,Vgs_end,Vds,Id)

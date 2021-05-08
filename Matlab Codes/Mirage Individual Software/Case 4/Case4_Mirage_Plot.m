%% Clean program 
clc; clear all; close all; format shortG;

%% Global variable
global n0 n2 nH H

%% Values used in all cases
disp('<strong>Setup Air refraction based on location</strong>');
fprintf('\n');

n0_vacuum = 1.000; % Index of air in a vaccum 

disp('Please enter <strong>Vacuum</strong> or <strong>Road</strong> ');
disp('<strong>Vacuum</strong> = Index is at 1.000 and environmental factor are ignored ');
disp('<strong>Road</strong> = Index is varied, because it accounts for air temperature ');
fprintf('\n');
loc= input('<strong>Location </strong>= ','s');

if strcmp(loc,'Vacuum')
    n0 = n0_vacuum;
    fprintf('\n');
elseif strcmp(loc,'Road')
    A = (6.1*10^-8);
    Tc = input('<strong>Air Temperature (in Celsius)</strong>=  ');
    fprintf('\n');
    Tk = Tc+273;
    
    n0 = n0_vacuum*(1+A*(Tk-293));
else
    disp('Error: Not a registered Location with air')
end

%% Case Setup 
disp('<strong>input variables for (n^2)(y) = n0^2+n2*y^2 : </strong>');
n2=0.00064;
H=110;

fprintf('n0 =%5.4f\n',n0);
fprintf('n2 =%5.4f\n',n2);
fprintf('H =%5.4f\n',H);

nH = sqrt(n0^2 + n2*(H^2)); %% Formula based on x
%% Change of y
fprintf('\n')
N= input('Number of light rays = '); %% Number Array
fprintf('\n');

disp('<strong>Angle value of theta</strong>')
theta_start=20;
theta_end= 60; 
fprintf('starting angle below horizontal (in degrees):=%5.4f\n',theta_start);
fprintf('ending angle below horizontal (in degrees): =%5.4f\n',theta_end);

for i=1:N
   theta_array(i)=theta_start+(theta_end-theta_start)/(N-1)*(i-1);
end

for i=1:N
   theta_array(i)=pi*theta_array(i)/180;
end

for j=1:N
    thetaH=theta_array(j);
    
    x = 0 : 10 : 300;
   [y]= Case4_Mirage_Ray(x,thetaH);
   
    figure (1)
    plot(x,y,'LineWidth', 1.5)
    xlim([0 max(x)]);
    title('Mirage height based on distance');
    xlabel('x');
    ylabel('y');
    hold on
end

Y = 0:0.01:H;
nY=sqrt(n0^2 + n2*(Y.^2)); %% Case drawing based on y

figure (2)
plot(Y,nY,'color','black','LineWidth', 1.5)
xlim([0 H]);
title('Index of Mirage based on height');
xlabel('y');
ylabel('n(y)');
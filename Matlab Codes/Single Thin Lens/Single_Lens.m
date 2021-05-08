%% Helps clean program when running
clc; clear; close all; format shortG;

%% Initial information and variables
t0 = 100;            %Distance of object from origin
Nx = 20;                %Numer of columns in arrays (resolution of results

dO=input('Object distance = '); %Object distance value assigned
f =input('Focal length = ');    %Focal length value assigned

%% Calculations for system
if abs(dO/f(1))>20
alpha = deg2rad(input('Angle of height = '));
if dO>0
    do =1000;
elseif dO<0
    do = -1000;
end

di = f;      %Calculation for image distance
h(1)=abs(tan(alpha)*do*1/6); %Object height value assigned

else
do = dO;
h(1)=input('Object height = '); %Object height value assigned
di = f/(1-(f/do));      %Calculation for image distance
end

D_ini = t0-do;                    %Distance of lens from origin
m = -(f*di)/(f*do);       %Calculation for lens magnification
h(2) = m*h(1);          %Calculation for final image height

if ismember(-inf,di) || ismember(inf,di)
disp('<strong>Error: image distance is infinite and the program cannot to draw properly </strong>')
fprintf('di = %5.4f\n',di);
elseif abs(di)>(abs(do)*10)
disp('<strong>Error: image distance is way too far for the program to draw properly</strong>')
fprintf('di = %5.4f\n',di);
else    
%% Basic information for figure
hold on                             %Keeps all plots on same figure
tt = t0 + di;                       %Distance of image from origin
tf = t0-f;
tfp = t0+f;

if do> 0 && abs(dO/f(1))<20 && di>0            
    xmin = min([D_ini tt t0 tf tfp])*0.75;
elseif abs(dO/f(1)) >20 
    xmin = min(tf,tfp)*197/200;
elseif  D_ini<0 || tt<0 || tf<0 || tfp<0      
    xmin =min([D_ini tt t0 tf tfp])*1.25;
else
    xmin = min([D_ini tt t0 tf tfp])*0.75;
end

if abs(dO/f(1)) >20 
xmax = max(tf,tfp)*203/200;   
else
xmax = max([D_ini tt t0 tf tfp])*1.25;             %Size of domain of graph
end

line ([xmin xmax], [0 0], 'color', 'black', 'LineWidth', 3);           %Ploting of center line

if abs(dO/f(1))<20
line([D_ini D_ini], [0 h(1)], 'color', 'blue', 'LineWidth', 3);     %Ploting of object
end
plot(tf,0,'ro','LineWidth', 3,'MarkerFaceColor','r');
line([tt tt], [0 h(2)], 'color', 'red', 'LineWidth', 3);        %Ploting of image
plot(tfp,0,'ro','LineWidth', 3,'MarkerFaceColor','r');

%% Light ray calculations
if abs(dO/f(1))>20
light_ray(1)=-atan(h(1)/do);            %Light ray that goes through center
light_ray(2)=-atan(h(1)/do);            %Light ray that goes through center
light_ray(3)=-atan(h(1)/(do-f(1)));     %Light ray that goes through focal poin
else
light_ray(1)=0;                         %Light ray parallel to center line
light_ray(2)=-atan(h(1)/do);            %Light ray that goes through center
light_ray(3)=-atan(h(1)/(do-f(1)));     %Light ray that goes through focal point
end

for ii = 1 : 3              %For all three light rays
    for i= Nx : -1 : 1      %For as long as resolution defined
        Obj_x(i) = xmin+(t0-xmin)/(Nx-1)*(i-1);                         %X_window for object light rays
        Ima_x(i) = t0+(xmax-t0)/(Nx-1)*(i-1);                           %X_window for image light rays
        Obj_y(ii,i) = h(1)+tan(light_ray(ii))*(Obj_x(i)-D_ini);         %Y_window for object light rays
        Ima_y(ii,i)=(h(2)-Obj_y(end))/(di)*(Ima_x(i)-t0)+Obj_y(end);    %Y_window for image light rays
        
        Vir_o_x(i)=t0+(xmax-t0)/(Nx-1)*(i-1);                 %Draws the objects virtual lines
        Vir_i_x(i)= xmin+(t0-xmin)/(Nx-1)*(i-1);    %Draws the image virtual lines
        Vir_o_y(ii,i)=h(1)+tan(light_ray(ii))*(Ima_x(i)-D_ini);               %Draws the objects virtual lines
        Vir_i_y(ii,i)=(h(2)-Obj_y(ii,end))/(di)*(Obj_x(i)-t0)+Obj_y(ii,end);    %Draws the image virtual lines
    end
    
    if do < 0                                  %If object virtual
        plot(Vir_o_x,Vir_o_y,'color','cyan','LineStyle', '--')  %Plots virtual light rays
    end
    if di < 0                                  %If image virtual
        plot(Vir_i_x,Vir_i_y,'color','magenta','LineStyle', '--')  %Plots virtual light rays
    end
    plot(Obj_x,Obj_y,'b')                      %Plots object light rays
    plot(Ima_x,Ima_y,'r')                      %Plots image light rays
end

%% Draws the Lenses
if abs(dO/f(1))>20
lh = abs(h(2))*1.25;        %Determines lens height
else
lh = abs(max([abs(h(1)) abs(h(2))]))*1.25;        %Determines lens height
end

th = 1.5;                           %Determines  maximum domain of plot

line ([t0 t0], [-lh lh], 'color', 'k', 'LineWidth', th);        %Main lens line

if abs(dO/f(1))>20
    a = 1.25;
else
    a = 0.15;
end

if f(1)<0                                                 %If lens concave
    Lx1 = t0-(lh*a)*cos(pi/6);                               %Variable calculations
    Ly1 = lh+(lh*0.15)*sin(pi/3);
    Lx2 = t0+(lh*a)*cos(pi/6);
    Ly2 = -lh-(lh*0.15)*sin(pi/3);
    line ([t0 Lx1], [lh Ly1], 'color', 'k','LineWidth', th);    %Left Upper line for arrow
    line ([t0 Lx2], [lh Ly1], 'color', 'k','LineWidth', th);    %Right Upper line for arrow
    line ([t0 Lx1], [-lh Ly2], 'color', 'k','LineWidth', th);   %Left Lower line for arrow
    line ([t0 Lx2], [-lh Ly2], 'color', 'k','LineWidth', th);   %Right Lower line for arrow
    
elseif f(1)>0                                                  %If lens convex
    Lx1 = t0-(lh*a)*cos(pi/6);                               %Variable calculations
    Ly1 = lh-(lh*0.15)*sin(pi/3);
    Lx2 = t0+(lh*a)*cos(pi/6);
    Ly2 = -lh+(lh*0.15)*sin(pi/3);
    line ([t0 Lx1], [lh Ly1], 'color', 'k','LineWidth', th);    %Left Upper line for arrow
    line ([t0 Lx2], [lh Ly1], 'color', 'k','LineWidth', th);    %Right Upper line for arrow
    line ([t0 Lx1], [-lh Ly2], 'color', 'k','LineWidth', th);   %Left Lower line for arrow
    line ([t0 Lx2], [-lh Ly2], 'color', 'k','LineWidth', th);   %Right Lower line for arrow
end

%% Text to appear on screen, and plot characterisitics
td = (-lh-20)/9;                    %Used to determine the difference in hieght of each line of text
th = (-lh-20)-td;                   %Used to determine starting height of line of text
xtickangle(90)                      %Makes x value labels vertical
ylim([-lh*1.15 lh*1.15])                %Defines vertical limit of plot
xlim([xmin xmax])                      %Defines horizaontal limit of plot
title('Light travels from left to right')                           %Title to graph
text(xmin,th-td*31/4,['Focal length = ' num2str(f)],'fontsize',10)        %Displays focal length on graph
text(xmin,th-td*30/4,['Object distance = ' num2str(dO)],'fontsize',10)    %Displays object distance on graph
text(xmin,th-td*29/4,['Object height = ' num2str(h(1))],'fontsize',10)    %Displays object height on graph
text(xmin,th-td*28/4,['Image distance = ' num2str(di)],'fontsize',10)     %Displays image distance on graph
text(xmin,th-td*27/4,['Image height = ' num2str(h(2))],'fontsize',10)       %Displays image height on graph
text(xmin,th-td*26/4,['Magnification = ' num2str(m)],'fontsize',10)            %Displays magnification on graph
end

%% Credit
% Made by : Justin Rooney
% Modified by Sriram Kanagalingham
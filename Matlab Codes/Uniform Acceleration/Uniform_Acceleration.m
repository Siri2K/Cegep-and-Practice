%% Clean Program
clc; close all; format shortG;
clear all; % Uncoment this line if you have run a different program before this one

%% Constant variable
disp('<strong>Please compute the initial projectile values </strong>')
y0 =input ('y0 (in m) = ');
v0 = input ('v0 (in m/s) = ');
fprintf('\n');

T = input ('Number of time  intervals <strong>(of 0.2s)</strong> = ')+1; %% T = 40 --> t = 8s

%% Pre-Allocated value
t_row = zeros(1,T);

g_Earth_row = zeros(1,T);
g_Mars_row = zeros(1,T);
g_Venus_row = zeros(1,T);
g_Jupiter_row = zeros(1,T);

y_Earth_row = zeros(1,T);
y_Mars_row = zeros(1,T);
y_Venus_row = zeros(1,T);
y_Jupiter_row = zeros(1,T);

%% Calculated Variables
for i = 1:1:T
  t_row(i) = (i-1)*1/5; 
  
  g_Earth_row(i) = -9.8;
  g_Mars_row(i) = -8.82;
  g_Venus_row(i) = -3.92;
  g_Jupiter_row(i) = -26.46;
  
  y_Earth_row(i) = y0+v0*(t_row(i))+(1/2)*(g_Earth_row(i))*(t_row(i))^2;
  y_Mars_row(i) =  y0+v0*(t_row(i))+(1/2)*(g_Mars_row(i))*(t_row(i))^2;
  y_Venus_row(i) =  y0+v0*(t_row(i))+(1/2)*(g_Venus_row(i))*(t_row(i))^2;
  y_Jupiter_row(i) =  y0+v0*(t_row(i))+(1/2)*(g_Jupiter_row(i))*(t_row(i))^2;
end

%% Table variable
t = t_row.';

g_Earth = g_Earth_row.';
g_Mars = g_Mars_row.';
g_Venus = g_Venus_row.';
g_Jupiter = g_Jupiter_row.';

y_Earth = y_Earth_row.';
y_Mars = y_Mars_row.';
y_Venus = y_Venus_row.';
y_Jupiter = y_Jupiter_row.';

y_min = min([y_Earth(end) y_Mars(end) y_Venus(end) y_Jupiter(end)]);

%% Table plot
figure ('Name', 'KInematics for multiple planets Data table');
set(gcf, 'Position',  [100, 522.5, 725, 422.5]);
T1 = table(t,g_Earth,y_Earth,g_Mars,y_Mars,g_Venus,y_Venus,g_Jupiter,y_Jupiter); %% Create table in command prompt
uitable('Data',T1{:,:},'ColumnName',T1.Properties.VariableNames,'Units','Normalized', 'Position',[0,0,1,1]); %% Use command prompt table to make a table in the figure
text

figure ('Name','Uniform Acceleration Graph');
set(gcf, 'Position',  [900, 522.5, 572.5, 422.5]);
plot(t,y_Earth,'color','#77AC30','LineWidth', 2);
hold on 
plot(t,y_Mars,'color','#FF0000','LineWidth', 2);
hold on 
plot(t,y_Venus,'color','#D95319','LineWidth', 2);
hold on 
plot(t,y_Jupiter,'color','#EDB120','LineWidth', 2);
hold on 
legend('Earth','Mars','Venus','Jupiter','Location','southwest')
title('Kinematics for multiple planets');
if i >= 2
    xlim([0,max(t)]);
end
xlabel('t (s)')
ylabel('y (m)')
text((max(t_row)/2),y_min+0.5,char('y = y0+v0t+(1/2)*at^2'),'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',12);

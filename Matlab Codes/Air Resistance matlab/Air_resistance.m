%% Clean Program
clc; close all; format shortG

%% Constant variable
theta = deg2rad(45);
vo = 40;
B = 0.184;
M = 1/B;
g = 9.81;

%% Independant variable
Max_distance = 150;
Max_air_time = 50;

%% Dependants variable used for Graphs

% Pre-Allocated values (boosts in speed)
x_row = zeros(1,(Max_distance+1)); 
y1_row = zeros(1,(Max_distance+1)); 
y2_row = zeros(1,(Max_distance+1)); 

t_row = zeros(1,(Max_air_time+1)); 
Vx_row = zeros(1,(Max_air_time+1)); 
Vy_row = zeros(1,(Max_air_time+1)); 

for i = 1:1:(Max_distance+1) 
  x_row(i) = i-1;  
  y1_row(i) = (x_row(i))*tan(theta)-(g/((2*(vo^2)*(cos(theta))^2))*((x_row(i))^2));
  y2_row(i) = ((x_row(i))*(tan(theta)+M*g/(vo*cos(theta))))+(M^2)*g*log(1-B*(x_row(i))/(vo*cos(theta)));
end

for ii = 1:1:(Max_air_time+1)
  t_row(ii) = ii-1;
  Vx_row(ii) = (vo*cos(theta))*(exp(-B*t_row(ii)));
  Vy_row(ii) = (-M*g)+(M*g+vo*sin(theta))*(exp(-B*t_row(ii)));
end
%% Variables used for tables
x = x_row.';
y1 = y1_row.';
y2 = y2_row.';

t = t_row.';
Vx = Vx_row.';
Vy = Vy_row.';

%% Produced Figures
figure(1)
set(gcf, 'Position',  [50, 300, 500, 600]);
T1 = table(x,y1,y2);
uitable('Data',T1{:,:},'ColumnName',T1.Properties.VariableNames,'Position',[0 0 290 275]);
hold on
subplot(2,1,1);
plot(x_row,y1_row,'color','blue','LineWidth', 2);
hold on
plot(x_row,y2_row,'color','red','LineWidth', 2);
title('Projectile Motion’s  Trajectory  ');
if i >= 2
    xlim([0,x(end)]);
    
    if max(y1_row)>=max(y2_row)
        y_max = max(y1_row);
    else
        y_max = max(y2_row);
    end
    ylim([0 y_max]);
end

xlabel('x(m)');
ylabel('y(m)');
legend('Without Air resistance','With air resistance','location','southwest')
xtickangle(90);


figure(2)
set(gcf, 'Position',  [600, 300, 500, 600]);
T2 = table(t,Vx);
uitable('Data',T2{:,:},'ColumnName',T2.Properties.VariableNames,'Position',[0 0 202.5 275]);
hold on
subplot(2,1,1);
plot(t_row,Vx_row,'color','black','LineWidth', 2);
title('Velocity (Vx) over time with air resistance');
if ii >= 2
    xlim([0,max(t)]);
    ylim([min(Vx_row) max(Vx_row)]);
end
xlabel('Air time (s)');
ylabel('Horizontal velocity (Vx) (m/s)');
xtickangle(90);


figure(3)
set(gcf, 'Position',  [1150, 300, 500, 600]);
T3 = table(t,Vy);
uitable('Data',T3{:,:},'ColumnName',T3.Properties.VariableNames,'Position',[0 0 202.5 275]);
hold on
subplot(2,1,1);
plot(t_row,Vy_row,'color','black','LineWidth', 2);
title('Velocity (Vy) over time with air resistance');
if ii >= 2
    xlim([0,max(t)]);
    ylim([min(Vy_row) max(Vy_row)]);
end
xlabel('Air time (s)');
ylabel('Vertical Velocity (Vy) (m/s)');
xtickangle(90);





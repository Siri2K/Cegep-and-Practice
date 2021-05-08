%% Program Clean
clc;close all; format shortG;
clear all; % Uncomment this line, if you ran a different program before this one

%% Constant variable
g = 9.8;
h =10;

%% Input variable with Constant Calculated variables
%Case 1
disp('<strong>Case 1 Variables </strong>')
fprintf('h = %5.4f\n',h);
vi(1) = input('v = ');
fprintf('\n');

% Case 2
disp('<strong>Case 2 Variables </strong>')
fprintf('h = %5.4f\n',h);
vi(2) = input('v = ');
fprintf('\n');

% Case 3
disp('<strong>Case 3 Variables </strong>')
fprintf('h = %5.4f\n',h);
vi(3) = input('v = ');
fprintf('\n');

%% Initial values
disp('<strong>Compute an angle between 0 and 90 degrees</strong>')
theta = input('Maximum Possible Throwing Angle = ')/5;
theta_deg_row = zeros(1,(theta+1));
theta_rad = zeros(1,(theta+1));

%Case 1
vxi_1 = zeros(1,(theta+1));
vyi_1 = zeros(1,(theta+1));
t1 = zeros(1,(theta+1));
R1_row = zeros(1,(theta+1));

%Case 2
vxi_2 = zeros(1,(theta+1));
vyi_2 = zeros(1,(theta+1));
t2 = zeros(1,(theta+1));
R2_row = zeros(1,(theta+1));

%Case 3
vxi_3 = zeros(1,(theta+1));
vyi_3 = zeros(1,(theta+1));
t3 = zeros(1,(theta+1));
R3_row = zeros(1,(theta+1));

%% Calculated values
for i = 1:1:(theta+1)
    theta_deg_row(i) = 5*(i-1);
    theta_rad(i) = deg2rad(theta_deg_row(i));
    
    vxi_1(i) = vi(1)*cos(sym(theta_rad(i))); 
    vyi_1(i) = vi(1)*sin(sym(theta_rad(i))); 
    t1(i) = (vyi_1(i)+sqrt((vyi_1(i))^2+2*g*h))/g;
    R1_row(i) = vxi_1(i)*t1(i);
    
    vxi_2(i) = vi(2)*cos(sym(theta_rad(i))); 
    vyi_2(i) = vi(2)*sin(sym(theta_rad(i))); 
    t2(i) = (vyi_2(i)+sqrt((vyi_2(i))^2+2*g*h))/g;
    R2_row(i) = vxi_2(i)*t2(i);
    
    vxi_3(i) = vi(3)*cos(sym(theta_rad(i))); 
    vyi_3(i) = vi(3)*sin(sym(theta_rad(i))); 
    t3(i) = (vyi_3(i)+sqrt((vyi_3(i))^2+2*g*h))/g;
    R3_row(i) = vxi_3(i)*t3(i);
end

%% Table Values
theta_deg = theta_deg_row.';

R1 = R1_row.';
R2 = R2_row.';
R3 = R3_row.';

%% Table
set_pos = [300, 400, 1625/8, 2900/8];

figure('Name','Case 1 Range')
set(gcf, 'Position',set_pos);
T1 = table(theta_deg,R1);
uitable('Data',T1{:,:},'ColumnName',T1.Properties.VariableNames,'Units','Normalized', 'Position',[0,0,1,1]); %% Use command prompt table to make a table in the figure

figure('Name','Case 2 Range')
set(gcf, 'Position',set_pos);
T2 = table(theta_deg,R2);
uitable('Data',T2{:,:},'ColumnName',T2.Properties.VariableNames,'Units','Normalized', 'Position',[0,0,1,1]); %% Use command prompt table to make a table in the figure

figure('Name','Case 1 Range')
set(gcf, 'Position',set_pos);
T3 = table(theta_deg,R3);
uitable('Data',T3{:,:},'ColumnName',T3.Properties.VariableNames,'Units','Normalized', 'Position',[0,0,1,1]); %% Use command prompt table to make a table in the figure

%% Graph
figure('Name','Projectile Case 1 and 2 Range')
set(gcf, 'Position',[700, 550, 500, 400]);
plot(theta_deg,R1,'color','red','LineWidth', 2);
hold on;
plot(theta_deg,R2,'color','blue','LineWidth', 2);
title('Projectile Range of Object in Case 1 and 2');
legend('Case 1', 'Case 2','Location','southwest');
xlabel('\theta');
ylabel('R(m)');
xlim([0 theta_deg(end)]);

figure('Name','Projectile Case 3 Range')
set(gcf, 'Position',[700, 50, 500, 400]);
plot(theta_deg,R3,'color','black','LineWidth', 2);
title('Projectile Range of Object in Case 3');
xlabel('\theta');
ylabel('R(m)');
xlim([0 theta_deg(end)]);




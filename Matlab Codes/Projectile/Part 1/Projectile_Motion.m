%% Program Clean
clc;close all; format shortG;
clear all; % Uncomment this line, if you ran a different program before this one

%% Constant variable
g = 9.8 ;
h = 10;
vi = 12;

%% Input variable with Constant Calculated variables
%Case 1
disp('<strong>Case 1 Variables </strong>')
fprintf('h = %5.4f\n',h);
fprintf('vi = %5.4f\n', vi);
theta(1) = deg2rad(input('theta 1 = '));
vxi(1) = vi*cos(sym(theta(1)));
vyi(1) = vi*sin(sym(theta(1)));
fprintf('\n');

% Case 2
disp('<strong>Case 2 Variables </strong>')
fprintf('h = %5.4f\n',h);
fprintf('vi = %5.4f\n', vi);
theta(2) = deg2rad(input('theta 2 = '));
vxi(2) = vi*cos(sym(theta(2)));
vyi(2) = vi*sin(sym(theta(2)));
fprintf('\n');

% Case 3
disp('<strong>Case 3 Variables </strong>')
fprintf('h = %5.4f\n',h);
fprintf('vi = %5.4f\n', vi);
theta(3) = deg2rad(input('theta 3 = '));
vxi(3) = vi*cos(sym(theta(3)));
vyi(3) = vi*sin(sym(theta(3)));
fprintf('\n');

%% Inital values
% Initial Case 1 
t1_row(1) = 0;
x1_row(1) = 0;
y1_row(1) = h;

% Initial Case 2
t2_row(1) = 0;
x2_row(1) = 0;
y2_row(1) = h;

% Initial Case 3
t3_row(1) = 0;
x3_row(1) = 0;
y3_row(1) = h;

%% Calculated values
for i = 1:1:(10^10)
    t1_row(i+1) = t1_row(i)+0.1;
    x1_row(i+1) = vxi(1)*t1_row(i+1);
    y1_row(i+1) = h+vyi(1)* t1_row(i+1)-(1/2)*g*(t1_row(i+1))^2;
    
    if y1_row(i+1) <0
        break;
    end
end

for ii = 1:1:(10^10)
    t2_row(ii+1) = t2_row(ii)+0.1;
    x2_row(ii+1) = vxi(2)*t2_row(ii+1);
    y2_row(ii+1) = h+vyi(2)* t2_row(ii+1)-(1/2)*g*(t2_row(ii+1))^2;
    
    if y2_row(ii+1) <0
        break;
    end
end

for iii = 1:1:(10^10)
    t3_row(iii+1) = t3_row(iii)+0.1;
    x3_row(iii+1) = vxi(3)*t3_row(iii+1);
    y3_row(iii+1) = h+vyi(3)* t3_row(iii+1)-(1/2)*g*(t3_row(iii+1))^2;
    
    if y3_row(iii+1) <0
        break;
    end
end

%% Table Values
t1 = t1_row.';
x1 = x1_row.';
y1 = y1_row.';

t2 = t3_row.';
x2 = x2_row.';
y2 = y2_row.';

t3 = t3_row.';
x3 = x3_row.';
y3 = y3_row.';

%% Table
set_pos = [300, 400, 1625/8, 3625/8];

figure('Name','Case 1 Table')
set(gcf, 'Position',set_pos);
T1 = table(x1,y1);
uitable('Data',T1{:,:},'ColumnName',T1.Properties.VariableNames,'Units','Normalized', 'Position',[0,0,1,1]); %% Use command prompt table to make a table in the figure

figure('Name','Case 2 Table')
set(gcf, 'Position',set_pos);
T2 = table(x2,y2);
uitable('Data',T2{:,:},'ColumnName',T2.Properties.VariableNames,'Units','Normalized', 'Position',[0,0,1,1]); %% Use command prompt table to make a table in the figure

figure('Name','Case 3 Table')
set(gcf, 'Position',set_pos);
T3 = table(x3,y3);
uitable('Data',T3{:,:},'ColumnName',T3.Properties.VariableNames,'Units','Normalized', 'Position',[0,0,1,1]); %% Use command prompt table to make a table in the figure

%% Graph
x1_max = max(x1);
x2_max = max(x2);
x3_max = max(x3);

y1_max = max(y1);
y2_max = max(y2);
y3_max = max(y3);

x_max = round(max([x1_max x2_max x3_max]))+1;
y_max = round(max([y1_max y2_max y3_max]))+1;

figure('Name','Projectile Graph')
set(gcf, 'Position',  [700, 400, 572.5, 422.5]);
plot(x1,y1,'color','red','LineWidth', 2);
hold on;
plot(x2,y2,'color','blue','LineWidth', 2);
hold on;
plot(x3,y3,'color','green','LineWidth', 2);
title('Projectile Motion of Object');
legend('Case 1', 'Case 2', 'Case 3','Location','southwest');
hold on;
xlabel('x(m)');
ylabel('y(m)');
xlim([0 x_max]);
ylim([0 y_max]);



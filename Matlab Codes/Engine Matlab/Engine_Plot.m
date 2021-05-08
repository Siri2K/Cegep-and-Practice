%% Clean Program
clc; close all; format shortG;

%% Constant variables
r = 0.1;
l = 0.3;

%% Changing Variable
Max_turn =input('#Number of turns = ')*360;

%% Values and Variable calculation used for graph
% Pre-Allocate Values to increase speed
wA_row = zeros(1,(Max_turn+1));
theta_row_degree = zeros(1,(Max_turn+1)); 
theta_row_rad = zeros(1,(Max_turn+1));
B_row = zeros(1,(Max_turn+1));
wD_row = zeros(1,(Max_turn+1));
aD1_row =  zeros(1,(Max_turn+1));
L_row =  zeros(1,(Max_turn+1));
vD_row = zeros(1,(Max_turn+1));
aD2_row =  zeros(1,(Max_turn+1));

for i = 1:1:(Max_turn+1)
    wA_row(i) = 2*pi*1000/60;
    theta_row_degree(i) = i-1;
    theta_row_rad(i) = pi/180*theta_row_degree(i);
    B_row(i) = asin(r*sin(sym(theta_row_rad(i)))/l);
    wD_row(i) = r/l*(cos(sym(theta_row_rad(i)))/cos(sym(B_row(i))))*wA_row(i);
    aD1_row(i) = (wA_row(i))^2*r/l*((r/l*(cos(sym(theta_row_rad(i)))/cos(sym(B_row(i))))^2)*tan(sym(B_row(i)))-sin(sym(theta_row_rad(i)))/cos(sym(B_row(i))));
    L_row(i) = r*cos(sym(theta_row_rad(i)))+l*cos(sym(B_row(i)));
    vD_row(i) = -r*(wA_row(i))*(sin(sym(theta_row_rad(i))) + sin(sym(B_row(i)))*(cos(sym(theta_row_rad(i)))/cos(sym(B_row(i)))));
    aD2_row(i) =(-r*((wA_row(i))^2))*(cos(sym(theta_row_rad(i)))-(tan(sym(B_row(i))))*(sin(sym(theta_row_rad(i))))+((cos(sym(theta_row_rad(i))))^2)*(r/l)*(1/((cos(sym(B_row(i))))^3)));
end

%% Values of Graph values converted for table
wA = wA_row.';
theta_degrees = theta_row_degree.';
theta_rad = theta_row_rad.';
B = B_row.';
wD = wD_row.';
aD1 = aD1_row.';
L = L_row.';
vD = vD_row.';
aD2 = aD2_row.';

%% Plot table
figure (1)
T = table(theta_degrees,theta_rad,wA,B,wD,aD1,L,vD,aD2); %% Create table in command prompt
uitable('Data',T{:,:},'ColumnName',T.Properties.VariableNames,'Units','Normalized', 'Position',[0, 0, 1, 1]); %% Use command prompt table to make a table in the figure

%% Plot Graphs
figure (2)
plot(theta_row_rad,wA_row,'color','black','LineWidth', 2);
title('\omega_{A} vs \theta');
if i >= 2
    xlim([0,theta_rad(end)]);
end
xlabel('\theta(rad)');
ylabel('\omega_{A}(rad/s)');
xtickangle(90);

figure (3)
plot(theta_row_rad,B_row,'color','black','LineWidth', 2);
title('\beta vs \theta');
if i >= 2
    xlim([0,theta_rad(end)]);
end
xlabel('\theta(rad)');
ylabel('\beta(rad)');
xtickangle(90);

figure (4)
plot(theta_row_rad,wD_row,'color','black','LineWidth', 2);
title('\omega_{D} vs \theta');
if i >= 2
    xlim([0,theta_rad(end)]);
end
xlabel('\theta(rad)');
ylabel('\omega_{D}(rad/s)');
xtickangle(90);

figure (5)
plot(theta_row_rad,aD1_row,'color','black','LineWidth', 2);
title('a_{D} vs \theta (version 1)');
if i >= 2
    xlim([0,theta_rad(end)]);
end
xlabel('\theta(rad)');
ylabel('a_{D}(rad/s^2)');
xtickangle(90);

figure (6)
plot(theta_row_rad,L_row,'color','black','LineWidth', 2);
title('L vs \theta');
if i >= 2
    xlim([0,theta_rad(end)]);
end
xlabel('\theta(rad)');
ylabel('L(m)');
xtickangle(90);

figure (7)
plot(theta_row_rad,vD_row,'color','black','LineWidth', 2);
title('\nu_{D}vs \theta');
if i >= 2
    xlim([0,theta_rad(end)]);
end
xlabel('\theta(rad)');
ylabel('\nu_{D}(m/s)');
xtickangle(90);

figure (8)
plot(theta_row_rad,aD2_row,'color','black','LineWidth', 2);
title('a_{D} vs \theta (version 2)');
if i >= 2
    xlim([0 theta_rad(end)]);
end
xlabel('\theta(rad)');
ylabel('a_{D}(m/s^2)');
xtickangle(90);
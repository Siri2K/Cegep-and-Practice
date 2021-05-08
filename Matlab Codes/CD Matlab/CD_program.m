%% Clean Program
clc; close all; format shortG;

%% Constant variable
r_min = 23*10^-3;
r_max = 58*10^-3;

%% Input variable
T = input ('Number of intervals <strong>(of 45s)</strong> = ')*45;
fprintf('\n');
disp('Finish the sentence with <strong>constant </strong> or <strong>not constant </strong>');

R = input('Angular Acceleration is ','s');

%% Constant Calculated variable
if strcmp(R,'constant')
 V = 1.3;
 wI = V/r_min;
 wf = V/r_max;
 a = (wf-wI)/(4473-0);
 
elseif strcmp(R,'not constant')
 V = 1.3;
 h = (pi/(4473*V))*(r_max^2-r_min^2); 
else
 fprintf ("<strong>Error: R must be 'constant' or 'not constant' </strong>");
end

%% Pre-Allocated value
t_row = zeros(1,T/45+1);
wF_row = zeros(1,T/45+1);
r_row = zeros(1,T/45+1);
v_row = zeros(1,T/45+1);
theta_row = zeros(1,T/45+1);
a_row = zeros(1,T/45+1);

%% Calculated Variables
for i = 1:1:((T/45)+1)
    t_row(i) =45*(i-1); 
    
    if strcmp(R,'constant')
    wF_row(i) = wI+a*t_row(i);
    r_row(i) = (r_min*V)/(V+a*r_min*t_row(i));
    v_row(i) = wF_row(i)*r_row(i);
    theta_row(i) =wI*t_row(i)+1/2*a*t_row(i)^2;
    a_row(i) = a;
    
    elseif strcmp(R,'not constant')
     wF_row(i) = V/sqrt(r_min^2+(h*V*t_row(i))/pi);
     r_row(i) = sqrt(r_min^2+(h*V*t_row(i))/pi);
     v_row(i) = wF_row(i)*r_row(i);
     theta_row(i) = 2*pi*1/h*(r_row(i)-r_min);
     a_row(i) = -1/2*(V^2)*h/pi*(1/((r_row(i))^3));
    end
    
end

%% Table Variable
t = t_row.';
wF = wF_row.';
r = r_row.';
v = v_row.';
theta = theta_row.';
a =a_row.';

%% Table plot
figure ('Name', 'Measured Data')
set(gcf, 'Position',  [150, 522.5, 515, 422.5]);
T1 = table(t,wF,r,v,theta,a); %% Create table in command prompt
uitable('Data',T1{:,:},'ColumnName',T1.Properties.VariableNames,'Units','Normalized', 'Position',[0,0,1,1]); %% Use command prompt table to make a table in the figure

%% Graph plot
figure (2)
plot(t,wF,'color','black','LineWidth', 2);
set(gcf, 'Position',  [750, 522.5, 550, 422.5]);
title('\omega(t) vs t');
if i >= 2
    xlim([0,t_row(end)]);
end
xlabel('t (s)');
ylabel('\omega(t) (rad/s)');
xtickangle(90);

figure (3)
plot(t,r,'color','black','LineWidth', 2);
set(gcf, 'Position',  [750, 522.5, 550, 422.5]);
title('r(t) vs t');
if i >= 2
    xlim([0,t_row(end)]);
end
xlabel('t (s)');
ylabel('r(t) (m)');
xtickangle(90);

figure (4)
plot(t,v,'color','black','LineWidth', 2);
set(gcf, 'Position',  [750, 522.5, 550, 422.5]);
title('v(t) vs t');
if i >= 2
    xlim([0,t_row(end)]);
end
xlabel('t (s)');
ylabel('v(t) (m/s)');
xtickangle(90);

figure (5)
plot(t,theta,'color','black','LineWidth', 2);
set(gcf, 'Position',  [750, 522.5, 550, 422.5]);
title('\theta(t) vs t');
if i >= 2
    xlim([0,t_row(end)]);
end
xlabel('t (s)');
ylabel('\theta(t) (rad)');
xtickangle(90);

figure (6)
plot(t,a,'color','black','LineWidth', 2);
set(gcf, 'Position',  [750, 522.5, 550, 422.5]);
title('a(t) vs t');
if i >= 2
    xlim([0,t_row(end)]);
end
xlabel('t (s)');
ylabel('a(t) (rad/s^2)');
xtickangle(90);

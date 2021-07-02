%% Clean Program at Start
clc; close all; clear ; format shortG;

%% Declare and Intialize variables
m = 1;
b = 0;

%% Declare boundaries
tmin = input("Enter the minimum time: ");
tmax = input("Enter the maximum time: ");

time = tmin:1:tmax;
x = zeros(1,length(time));

%% Process and Generate graph
for i = 1:1:length(x)
    %% Determine current Time
    t = i-(1-tmin);
    
    %% Determine x(t) value
    x(i) = ramp(1,t,-3)*step(1,t,-3)-ramp(1,t,-2)*step(1,t,-2)-ramp(1,t,2)*step(1,t,2)+ramp(1,t,3)*step(1,t,3);
end

%% Print Graph
plot(time,x);
xlabel('t');
ylabel('g(t)');
title('Signal Graph');
axis ([tmin tmax -0.5 1.5]);

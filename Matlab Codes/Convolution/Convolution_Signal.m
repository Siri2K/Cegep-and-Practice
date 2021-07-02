%% Clean Program at Start
clc; close all; clear ; format shortG;

%% Signal Time
timestamp = 0.01;
tmin = input("Enter lowest value of t : ");
tmax = input("Enter highest value of t : ");

t = tmin:timestamp:tmax;

%% Convolution timer
Tmin = 2*tmin;
Tmax = 2*tmax;

T = Tmin:timestamp:Tmax;

%% Initialized Convolution output for question 3a) used in 3c)
ya_c = zeros(1,length(t));

%% Initialized  Convolution output for question 3b) used in 3c)
yb_c = zeros(1,length(t));

%% Convolution inputs for question 3a) used in 3d)
x1  = exp(-2.*t).*heaviside(t);
h  = exp(-3.*t).*heaviside(t);

%% Convolution inputs for question 3b) used in 3d)
x2 = heaviside(t)-2*heaviside(t-1)+heaviside(t-2);

%% Convolution outputs used in 3d)
ya_d = timestamp*conv(x1,h);
yb_d = timestamp*conv(x2,x2);

%% Convolution outputs used in 3c)
for i=1:1:length(t)
    if t(i)<0
        ya_c(i) = 0;
        yb_c(i) = 0;
        
    elseif t(i)>=0 && t(i)<1
        ya_c(i) = exp(-3*t(i))*(exp(t(i))-1);
        yb_c(i) = t(i);
        
    elseif t(i)>=1 && t(i)<2
        ya_c(i) = exp(-3*t(i))*(exp(t(i))-1);
        yb_c(i) = 4-3*t(i);
        
    elseif t(i)>=2 && t(i)<3
        ya_c(i) = exp(-3*t(i))*(exp(t(i))-1);
        yb_c(i) = 3*t(i)-8;
        
    elseif t(i)>=3 && t(i)<4
        ya_c(i) = exp(-3*t(i))*(exp(t(i))-1);
        yb_c(i) = 4-t(i);
        
    else
        ya_c(i) = exp(-3*t(i))*(exp(t(i))-1);
        yb_c(i) = 0;
        
    end
end

%% Print Graph for 3a)
figure(1)

subplot(1,2,1)
plot(t,ya_c);
xlabel('t');
ylabel('g(t)');
title('Signal Graph for 3a) from 3c)');
axis ([tmin tmax min(ya_c)-0.1 max(ya_c)+0.1]);

subplot(1,2,2)
plot(T,ya_d);
xlabel('t');
ylabel('g(t)');
title('Signal Graph 3a) from 3d)');
axis ([tmin tmax min(ya_c)-0.1 max(ya_c)+0.1]);

%% Print Graph for 3b)
figure(2)

subplot(1,2,1)
plot(t,yb_c);
xlabel('t');
ylabel('g(t)');
title('Signal Graph for 3b) from 3c)');
axis ([tmin tmax min(yb_c)-0.1 max(yb_c)+0.1]);

subplot(1,2,2)
plot(T,yb_d);
xlabel('t');
ylabel('g(t)');
title('Signal Graph 3b) from 3d)');
axis ([tmin tmax min(yb_c)-0.1 max(yb_c)+0.1]);


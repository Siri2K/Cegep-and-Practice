%% Clean Program
clc, clear, close all, format shortG

%% Initialize variables
syms t  w  % Ensures t and w are variables not numbers

T = 10;
k = linspace(-T/2,T/2,T+1);

%% Setup Integrals
x = w/(2*pi)*10*sin(w*t)*exp(-1j*k*w*t);

%% Find Fourier Coefficient Equation
y = @(k)int(x,t,0,pi/w);

%% Fill fourier Series Coefficients
figure(1)
stem(k,y(k));
xlim([-T/2-1,T/2+1])
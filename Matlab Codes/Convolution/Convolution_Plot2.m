%% Clean Program
clc, clear, close all, format shortG

%% Initialize variables
w = 2*pi;
T = -1:0.01:2;

%% Setup Integral
x = zeros(1,length(T));
for i = 1:1:length(T)
    t = T(i);
    x(i) = sqrt(3)/2*(exp(1j*w*t)+exp(2j*w*t)-exp(4j*w*t)-exp(5j*w*t));
end

%% Print Graph
figure(1)
plot (T,abs(x));
xlim([min(T)+1,max(T)-1]);
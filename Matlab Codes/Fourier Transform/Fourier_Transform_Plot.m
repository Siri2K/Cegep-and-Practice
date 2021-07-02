%% Clean Program
clc, clear, close all, format shortG

%% Initialize variables
w_min = input('Enter Minimum frequency : ');
w_max =input('Enter Maximum frequency : ');
w_interval = 0.01;

w = w_min:w_interval:w_max;

%% Initialize fourier
syms t
h = 1.25*-exp(-0.6*t)*sin(0.8*t)*heaviside(t);

%% Find Fourier Transform equation , Magnitude and Phase Spectrum
h_w_sym = fourier(h); % Fourier  Equation Symbol

%% Initialized Fourier variables
h_w = zeros(1,length(w));
h_w_magnitude = zeros(1,length(w));
h_w_phase = zeros(1,length(w));

%% Fill Fourier Variable
for a = 1:1:length(w)
h_w(a) = 5i/(8*(w(a)-1i+0.6-0.8i))-5i/(8*(w(a)-0.6+0.8i)); % Fourier  Equation Point
h_w_magnitude(a) = abs(h_w(a)); %% Fourier Magnitude Point
h_w_phase(a) = angle(h_w(a));
end

%% Print Graphs
figure(1)
plot(w,h_w_magnitude);
title('H(w) Magnitude')

figure(2)
plot(w,h_w_phase);
title('H(w) Phase Spectrum')


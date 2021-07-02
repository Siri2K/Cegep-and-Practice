%% Program clean
clc; clear; close all; format shortG;

%% ELEC 273
%{
f =input("Frequency (f) = "); 
w = 2*pi*f;
R1 = 2*10^3;
R2 = 2*10^3;
C = 0.1*10^-6;

vi = 2;
vo_theory = vi*R2/(R2*sqrt(1+(w*C*R2)^2))
vo_experiment = input("Output (Vo) = ");

error = abs((vo_theory-vo_experiment)/vo_theory)*100
%}
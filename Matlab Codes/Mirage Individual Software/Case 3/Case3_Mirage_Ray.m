function [y]= Case3_Mirage_Ray(x,thetaH)

global nH n0 n1 H

A = n0^2 - nH^2*(sin(thetaH))^2;
Q = sqrt(H*n1 + A);
y = (1/n1)*((Q-(x*n1)/(nH*sin(thetaH))).^2 - A);
end
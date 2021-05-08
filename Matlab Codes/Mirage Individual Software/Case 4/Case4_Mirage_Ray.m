function [y]=Case4_Mirage_Ray(x,thetaH)

global nH n0 n2 H

A = sqrt(n0^2 - nH^2*(sin(thetaH)^2));
C = log(sqrt(n2)*H + sqrt(n2*H^2+A^2));
B = exp(C-x*sqrt(n2)/(nH*sin(thetaH)));
y = (B.^2-A.^2)/(2.0*sqrt(n2));
y = rdivide(y,B);
end
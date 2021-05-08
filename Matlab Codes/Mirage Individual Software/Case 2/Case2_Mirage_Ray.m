function [y]= Case2_Mirage_Ray(x,thetaH)

global n0 a np nH H

k = sqrt(n0^2+np^2-nH^2*(sin(thetaH))^2)/np;
c = 2.0*nH*sin(thetaH)/(k*a*np)*acosh(k*exp(0.5*a*H));
y = 2.0/a*log(1.0/k*cosh((c-x)*k*a*np/(2.0*nH*sin(thetaH))));
end
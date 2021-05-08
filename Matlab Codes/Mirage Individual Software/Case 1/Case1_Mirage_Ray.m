function [y]= Case1_Mirage_Ray(x,thetaH)
   global n0 a nH H
   
   A=a^2/(nH*sin(thetaH))^2 ;
   B=2.0*n0*a/(nH*sin(thetaH))^2 ;
   C= (n0^2-(nH*sin(thetaH))^2)/(nH*sin(thetaH))^2 ;
   E=sqrt((B^2-4.0*A*C)/(4.0*A));  
   Kp=acosh(sqrt(A)/E*(H+B/2.0/A));
   y = E/sqrt(A)*cosh(-sqrt(A)*x+Kp)-B/(2.0*A);
end
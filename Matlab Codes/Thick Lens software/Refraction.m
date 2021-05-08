function [MR] = Refraction(n, np, R)
    A = (n - np)/(np*R);
    B = n/np; 
    MR = [1 0; A B];
end


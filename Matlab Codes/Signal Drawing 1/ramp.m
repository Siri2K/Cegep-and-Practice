function Ur= ramp(m,t,b)
    if t>= b/m
        Ur = m*(t-b);
    else
        Ur = 0;
    end
end

%% Code Breakdown
%{
ramp follows the following conditions:
-> r(mt-b) input
-> if t<b/m,then g(t) = m(t-b)
-> else 0
%}


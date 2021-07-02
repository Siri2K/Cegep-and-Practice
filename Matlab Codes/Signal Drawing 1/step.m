function Us = step(m,t,b)
    if t>= b/m
        Us = 1;
    else
        Us = 0;
    end
end

%% Code Breakdown
%{
ramp follows the following conditions:
-> u(mt-b) input
-> if t<b/m,then g(t) = 1
-> else 0
%}
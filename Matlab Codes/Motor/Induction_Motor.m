%% Program Clean
clc; clear; close all; format shortG

%% Command Prompt Instructions
disp('<strong>Induction Motor Program Cases</strong>');
disp('Case <strong>1</strong> : Power factor (<strong>PF</strong>), Resistance (<strong>R</strong>), Induction (<strong>L</strong>), Frequency (<strong>f</strong>) ');
disp('Case <strong>2</strong> : Voltage root mean square (<strong>Vrms</strong>),Initial Power factor (<strong>PFi</strong>),Final Power factor (<strong>PFf</strong>), Frequency (<strong>f</strong>)  ');
fprintf('\n')
%% Case variable Inputs
disp('<strong>Finish the sentence by inputting Case Number "1" or "2" depending on paramaters of your induction motor problem</strong>');
Case = input('Case ');
fprintf('\n')
disp('<strong>Parameters</strong>:')

switch (Case)
    case 1
        %% Case 1 Inputs
        PFf  = input('Final Power factor (between 0 and 1) = ');
        R    = input('Resistance (in ohms) = ');
        L    = input('Inductance (in mH) = ')*10^-3;
        f    = input('frequency (in Hz) = ');
        %% Case 1 Solutions
        w           = 2*pi*f;
        theta_i   = atan((w*L)/R);
        Pfi          = cos(sym(theta_i));
        zi            = sqrt(R^2+(w*L)^2);
        theta_f  = acos(sym(PFf));   
        C           = (w*L-R*tan(theta_f))/(w*(R^2+(w*L)^2));
        zf          = sqrt((R^2+(w*L)^2)/((w*C*R)^2+(1-(w^2)*C*L)^2));
        %% Case 1 Answers
        fprintf('\n')
        disp('<strong>Solution</strong>:')
        fprintf('Initial Phase Angle in radians = %5.4g', theta_i);
        fprintf(' or in degrees =%5.4g\n', rad2deg(theta_i));
        fprintf('Initial Power Factor = %5.4g\n', Pfi);
        fprintf('Initial Impedence (Ohms) = %5.4g\n', zi);
        fprintf('\n');
        fprintf('Capacitance (uF) = %5.4g\n', C*10^6);
        fprintf('Final Phase Angle in radians = %5.4g', theta_f);
        fprintf(' or in degrees =%5.4g\n', rad2deg(theta_f));
        fprintf('Final Impedence (Ohms) = %5.4g\n', zf);
    case 2
        %% Case 2 Inputs
        Vrms = input('Vrms (in V) =');
        P        =  input('Average Power (in kW) = ')*10^3;
        PFi     = input('Initial Power factor = ');
        f        = input('frequency (in Hz) = ');
        PFf    = input('Final Power factor = ');
        %% Case 2 Solutions
        theta_i = acos(sym(PFi));
        theta_f = acos(sym(PFf));
        w = 2*pi*f;
        zi = ((Vrms^2)*cos(sym(theta_i)))/(P);
        Irmsi = Vrms/zi;
        a = -sin(sym(theta_i));
        b = cos(sym(theta_i));
        c = zi*b;
        
        %% Multi Answers
        d = zeros(1,2);
        A =  zeros(1,2);
        B = zeros(1,2);
        C=  zeros(1,2);
        zf = zeros(1,2);
        Irmsf =  zeros(1,2);
        
       for i = 1:1:2
        theta(1) = acos(cos(sym(theta_f)));
        theta(2) = acos(-cos(sym(theta_f)));
        d(i) = (c*(b-a*tan(sym(theta(i)))))/(a+b*tan(sym(theta(i))));
        A(i) = a*c +b*d(i);
        B(i) = b*c - a*d(i);
        C(i) = -1/(w*a*zi+w*d(i));
         zf(i) = (zi*sqrt(A(i)^2+B(i)^2))/(w*C(i)*(c^2+d(i)^2));
        Irmsf(i) = Vrms/zf(i);
       end
        %% Case 2 Answers
        fprintf('\n')
        disp('<strong>Solution</strong>:')
        fprintf('Initial Impedence (Ohms) = %5.4g\n', zi);
        fprintf('Initial Current --> Irms (A) = %5.4g\n', Irmsi);
        fprintf('\n');
        fprintf('Capacitance (uF) = %5.4g', C(1)*10^6);
        fprintf(' or %5.4g\n', C(2)*10^6);
        fprintf('Final Impedence (Ohms) = %5.4g\n', zf(1));
        fprintf('Final Current --> Irms (A) = %5.4g\n', Irmsf(1));
    otherwise
        disp('<strong>Case is unavailable</strong>')
        disp('Press <strong>CTRL+C </strong> to terminate operation ')
end
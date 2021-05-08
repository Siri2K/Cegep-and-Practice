%% Clean program 
clc; clear; close all; format long;

%% Values used in all cases
disp('<strong>Setup Air refraction based on location</strong>');
fprintf('\n');

n0_vacuum = 1.000; % Index of air in a vaccum 


disp('Please enter <strong>Vacuum</strong> or <strong>Road</strong> ');
disp('<strong>Vacuum</strong> = Index is at 1.000 and environmental factor are ignored ');
disp('<strong>Road</strong> = Index is varied, because it accounts for air temperature ');
fprintf('\n');
loc= input('Location = ','s');

if strcmp(loc,'Vacuum')
    n0 = n0_vacuum;
elseif strcmp(loc,'Road')
    A = (6.1*10^-8);
    Tc = input('Air Temperature (in Celsius) = ');
    Tk = Tc+273;
    
    n0 = n0_vacuum*(1+A*(Tk-293));
else
    disp('Error: Not a registered Location with air')
end

%% Mirage Plot
disp ('Please Select Graph axis : <strong>(y,n(y)) </strong> or <strong> (n(y),y)</strong> ')
fprintf('\n');

coordinate = input('Coordinates = ', 's');

disp('<strong>Please Select the Case for Your Problem</strong>');
fprintf('\n');

disp('<strong>Case 1:</strong> n(y)=n0+a*y ');
disp('<strong>Case 2:</strong> (n^2)(y) = n0^2+(np^2)(1-e^(-a*y))');
disp('<strong>Case 3:</strong> (n^2)(y) = n0^2+n1*y');
disp('<strong>Case 4:</strong> (n^2)(y) = n0^2+n2*y^2');
fprintf('\n');

Case_Number = input('<strong>Case number</strong> = ');

if strcmp(coordinate,'(y,n(y))')
    
    switch (Case_Number)
        case 1
            fprintf('n0 =%5.4f\n',n0);
            a = input('a =');
            H = 0:0.01:input('H = ');
            nH = n0+a*H;
        case 2 
            fprintf('n0 =%5.4f\n',n0);
            np = input('np = ');
            a = input ('a = ');
            H =0:0.01:input('H = ');
            nH = sqrt(n0^2 + (np^2)*(1-exp(-a*H)));
        case 3
            fprintf('n0 =%5.4f\n',n0);
            n1 = input('n1 = ');
            H = 0:0.01:input('H = ');
            nH = sqrt(n0^2 + n1*H);
        case 4
            fprintf('n0 =%5.4f\n',n0);
            n2 = input('n2 = ');
            H = 0:0.01:input('H = ');
            nH = sqrt(n0^2 + n2*(H.^2));
        otherwise
            disp('Mirage case number is invalid');
    end
    
    figure;
    plot(H,nH,'color','black','LineWidth', 2);
    xlim([H(1) H(end)]);
    title('Index of Mirage based on height');
    xlabel('y');
    ylabel('n(y)');
    
elseif strcmp(coordinate,'(n(y),y)')
    
    switch (Case_Number)
        case 1
            fprintf('n0 =%5.4f\n',n0);
            a = input('a =');
            nH = n0:0.001:input('nH = ');
            H = (nH-n0)/a;
        case 2 
            fprintf('n0 =%5.4f\n',n0);
            np = input('np = ');
            a = input ('a = ');
            nH = n0:0.001:input('nH = ');
            H = -1/a*log(1-(nH.^2-n0^2)/(np^2));
        case 3
            fprintf('n0 =%5.4f\n',n0);
            n1 = input('n1 = ');
            nH = n0:0.001:input('nH = ');
            H = (nH.^2-n0^2)/n1;
        case 4
            fprintf('n0 =%5.4f\n',n0);
            n2 = input('n2 = ');
            nH =  n0:0.001:input('nH = ');
            H = sqrt((nH.^2-n0^2)/n2);
        otherwise
            disp('Mirage case number is invalid');
    end
    figure;
    plot(nH,H,'color','black','LineWidth', 2);
    xlim([nH(1) nH(end)]);
    title('Index of Mirage based on height');
    xlabel('n(y)');
    ylabel('y');
    
end


%% Helps clean program when running
clc; clear; close all; format shortG;

%% Initial Information 
t0 = 100;
Nx = 20;
Lens_Count = input('Number of lenses = ');
fprintf('\n');

% Object distance
disp('<strong>Input Object distance from first lens </strong>');
dO = input('do = ');
fprintf('\n');

% Focal Lenghts
disp('<strong>Input the Focal lengths of each lens </strong>');
f = zeros(1,Lens_Count);
F = zeros(1,Lens_Count);
for NL = 1:1:Lens_Count
    f(NL) =  input('f = ');
    F(NL) = f(NL);
end
fprintf('\n');

if abs(dO/f(1))>20
    alpha = deg2rad(input('Angle of ray = '));
    do(1) = 1000;
else
    do(1) = dO;
end
fprintf('\n');

% Lens gaps
if Lens_Count <2
t = 0;
else
disp('<strong>Input the gap between each lens </strong>');
t = zeros(1,Lens_Count);
for NL = 1:1:(Lens_Count-1)
    t(NL) =  input('t = ');
end
fprintf('\n');
end

%Points
D_ini = t0-do(1);

%% Lens System Drawing 
%Creating different heights for System
if abs(dO/f(1))>20
    height_n =2;               %Number of increments of heights used
    for j = height_n : -1 : 1   %For the total number of height increments
        height(j)=tan(alpha)*do*1/6;    %The height array is defined
    end
else
    disp('<strong>Input the object height array </strong>');
    height_n =2;               %Number of increments of heights used
    height_start=input('minimum height = ');            %The smallest height used
    height_end=input('maximum height = ');              %The largest hieght used
    for j = height_n : -1 : 1   %For the total number of height increments
        height(j)=height_start+(height_end-height_start)/(height_n-1)*(j-1);    %The height array is defined
    end
    fprintf('\n');
end

%Creating different angled light rays
Theta_N = 10;               %Number of increments of Theta's used
if dO/f(1)>20
    Thetastart = -alpha;
else
    Thetastart = -12;
end

Thetaend = 0;               %The largest angle used
for i = Theta_N : -1 : 1    %For the total number of theta increments used
    Theta(i)=(Thetastart+(Thetaend-Thetastart)/(Theta_N-1)*(i-1))*pi/180;   %The theta array is defined
end

%Defining variables used for drawings on graph
if abs(dO/f(1)) >20
a = round(max(max(height),max(abs(f))))*1.25;
else
a = round(abs(height(end))+(Thetaend-Thetastart)^(3/2));         %Height of lens
end
b = 0.05;       %Percentage of height of lens
c1 = pi/6;      %Angle used for lens
c2 = (pi/2)-c1; %Angle used for lens

%Functions and Formula that calculate and plot everything
for i = height_n : -1 : 1
    
    %Initial information for system
    figure(i)       %Defines figured used
    hold on         %Keep everything on the same figure
    h(1)=height(i); %The first height in the array is defined as the initial height
    M = 1;          %Initial Magnification is 1
    L(1) = t0;      %Variable used to simplify code 

    %For loop for image calculations, variables, and lens drawings
    for ii = 1 : length(f)      %Loops for the number of front focal lengths
        
        %Draws the Lenses
        line ([L(ii) L(ii)], [-a a], 'color', 'k', 'LineWidth', 2);
            if f(ii)<0                      %If focal length negative
                Lx1 = L(ii)-(a*b)*cos(c1);  %Draws lines to mark lens as diverging on figure...
                Ly1 = a+(a*b)*sin(c2);
                Lx2 = L(ii)+(a*b)*cos(c1);
                Ly2 = -a-(a*b)*sin(c2);
                line ([L(ii) Lx1], [a Ly1], 'color', 'k','LineWidth', 2);
                line ([L(ii) Lx2], [a Ly1], 'color', 'k','LineWidth', 2);
                line ([L(ii) Lx1], [-a Ly2], 'color', 'k','LineWidth', 2);
                line ([L(ii) Lx2], [-a Ly2], 'color', 'k','LineWidth', 2);                
            elseif f(ii)>0                  %If focal length positive
                Lx1 = L(ii)-(a*b)*cos(c1);  %Draws lines to mark lens as converging on figure...
                Ly1 = a-(a*b)*sin(c2);
                Lx2 = L(ii)+(a*b)*cos(c1);
                Ly2 = -a+(a*b)*sin(c2);
                line ([L(ii) Lx1], [a Ly1], 'color', 'k','LineWidth', 2);
                line ([L(ii) Lx2], [a Ly1], 'color', 'k','LineWidth', 2);
                line ([L(ii) Lx1], [-a Ly2], 'color', 'k','LineWidth', 2);
                line ([L(ii) Lx2], [-a Ly2], 'color', 'k','LineWidth', 2);
            end
        
        %Calculates the Image height, distance, magnification etc...
        di(ii) = F(ii)/(1-(f(ii)/do(ii)));          %Formula to calculate image distance formed by the lens
        m(ii+1) = -(f(ii)*di(ii)/F(ii)/do(ii));     %Formula to calculate magnification of individual lens
        h(ii+1) = m(ii+1)*h(ii);                    %Formula to calculate new height of image from lens
        M = M*m(ii+1);                              %Formula to calculate the total magnification
        
        if abs(do(1)/f(1))>20 
            di(1) = F(1);
        end
        
         if  abs(dO/f(1))>20 && di(end)<0
            T(1) = t0-(abs(di(end))+abs(f(1)));
         elseif abs(dO/f(1))>20 && di(end)>0
             T(1) = t0-abs(f(1));
        else
             T(1) = min([0 t0-abs(f(1))]);       %Variable used to simplify code
        end

        %Defines certain variables, and calculates object distance
        T(ii+1) = L(ii);                        %Variable used to simplify coding
        if ii < length(t)                      %if for loop is not at the end of its loop
            do(ii+1) = t(ii)-di(ii);            %New object distance is calculated this way
            L(ii+1) = L(ii) + t(ii);            %Variable used to simplify coding
        else                                        %If for loop is at the end of its loop
            xmax = max([(2*sum(t) + t0+(Lx2-Lx1)) * 1.25 (sum(t) + t0 + di(end)+(Lx2-Lx1)) * 1.25]);   %Calculate the maximum x distance of figure
            L(ii+1) = xmax;                         %Variable used to simplify coding
        end   
    end
  
    if ismember(inf,di)
    disp('<strong>Error: image distance is infinite and the program cannot to draw properly </strong>')
    d = find(di == inf);
    fprintf('d = %5.4f\n',d);
    fprintf('di = %5.4f\n',di(d));
    break;
    elseif ismember(-inf,di)
    disp('<strong>Error: image distance is infinite and the program cannot to draw properly </strong>')
    d = find(di == -inf);
    fprintf('d = %5.4f\n',d);
    fprintf('di = %5.4f\n',di(d));
    break;
    elseif ismember(0,di)
    disp('<strong>Error: image distance is zero and the program cannot to draw properly </strong>')
    d = find(di == 0);
    fprintf('d = %5.4f\n',d);
    fprintf('di = %5.4f\n',di(d));
    break;
    elseif max(abs(m))>10
    disp('<strong>Error: image distance is way too far for the program to draw properly</strong>')
    d = find(abs(m)>10)-1;
    fprintf('At lens %5.4f\n',d);
    fprintf('do = %5.4f\n',do(d));
    fprintf('di = %5.4f\n',di(d));
    break;
    end  
    
    %Draws objects and base line
    tt = sum(t) + t0 + di(end);                     %Total length of lens system
    line ([T(1) xmax], [0 0], 'color', 'black', 'LineWidth', 3);               %Draws center line
    line([tt tt], [0 h(end)], 'color', 'magenta', 'LineWidth', 3);          %Draws image
    
    if abs(dO/f(1))<20
    line([D_ini D_ini], [0 h(1)], 'color', 'blue', 'LineWidth', 3);          %Draws image
    end
    
    %Calculation for x window array
    for ii = 1 : length(f)+1                                        %loop for one number greater than number focal lengths
        for iii=Nx:-1:1                                             %loop for value of resolution
            x_window(ii, iii)=T(ii)+(L(ii)-T(ii))/(Nx-1)*(iii-1);   %Calculates x window of lens
            if do(1) < 0                                                %If object virtual
                Vir_windx_o(iii)=t0+(xmax-t0)/(Nx-1)*(iii-1);           %Calculates x window for virtual light rays
            end
            if di(end) < 0                                              %If image is virtual
                Vir_windx_i1(iii)=(T(end))/(Nx-1)*(iii-1);               %Calculates x window for virtual lines
                Vir_windx_i2(iii)=(T(1))/(Nx-1)*(iii-1);               %Calculates x window for virtual lines
            end    
        end
    end 
                     
    %Calculation for first y window array
    for iii = Theta_N : -1 : 1                      %For loop for number of angles used
        K = tan(Theta(iii));                        %K is defined for code simplification
        for iiii = 1 : Nx                           %For loop for value of resolution
            y_window1(iii, iiii)=h(1)+K*(x_window(1, iiii)-D_ini);   %Calculates the y window of first lens
            yw1(iiii)=y_window1(iii, iiii);                             %Variable needed to draw figures properly
            xw1(iiii)=x_window(1, iiii);                                %Variable needed to draw figures properly
            if do(1)<0                                                          %If object is virtual
                Vir_windy_o(iii, iiii)=h(1)+K*(Vir_windx_o(iiii)-D_ini);     %Calculates the y window of virtual rays
                vwo(iiii)=Vir_windy_o(iii, iiii);                               %Variable needed to draw figures properly
            end
        end
        plot (xw1, yw1, 'red')                              %Plots first light ray
        if do(1)<0                                          %If object is virtual
            plot (Vir_windx_o, vwo, 'b', 'LineStyle', '--') %Plots virtuals light rays
        end
    end
    
    %Calculation for subsequent y window arrays
    for ii = 1 : length(f)                                  %Loops for as many front focal lengths exist
        for iii = Theta_N : -1 : 1                          %Loops for as many angles used
            x1 = L(ii);                                     %Variable used for y window calculations
            if ii == 1                                      %If loop is at the first lens
               y1 = y_window1(iii, end);                    %Variable used for y window calculations is this
            else                                            %If loop is not at the first lens
               y1 = y_window(iii, end, ii-1);               %Variable used for y window calculations is this
            end
            x2 = x1+di(ii);                                 %Variable used for y window calculation
            y2 = h(ii+1);                                   %Variable used for y window calculation
            for iiii = 1 : Nx                               %Loop for as long as resolution value
                y_window(iii,iiii,ii)=(y2-y1)/(x2-x1)*(x_window(ii+1,iiii)-x1)+y1;  %Calculates y window for lens
                yw2(iiii)=y_window(iii,iiii,ii);                                    %Variable needed to plot rays on figure
                xw2(iiii)=x_window(ii+1,iiii);                                      %Variable needed to plot rays on figure
                if ((di(end) < 0) && (ii == length(f)))                             %If images is virtual and loop is on the last lens
                    Vir_windy_i1(iii,iiii)=(y2-y1)/(x2-x1)*(Vir_windx_i1(iiii)-x1)+y1;%Calculates y window for virtual ray
                    vwi1(iiii) = Vir_windy_i1(iii, iiii);                             %Variable needed to plot rays on figure
                    Vir_windy_i2(iii,iiii)=(y2-y1)/(x2-x1)*(Vir_windx_i2(iiii)-x1)+y1;%Calculates y window for virtual ray
                    vwi2(iiii) = Vir_windy_i2(iii, iiii);                             %Variable needed to plot rays on figure
                end    
            end
            plot (xw2, yw2, 'red')                                  %Plots rays on figure
            if ((di(end) < 0) && (ii == length(f)))                 %If image is virtual, and loop is at last lens
                plot (Vir_windx_i1, vwi1, 'm', 'LineStyle', '--')     %Plot virtual rays
                plot (Vir_windx_i2, vwi2, 'm', 'LineStyle', '--')     %Plot virtual rays
            end    
        end    
    end   
 
 xtickangle(90)                      %Makes x value labels vertical
 xlim([T(1) xmax])                         %Sets limit to figure y axis
 ylim([-a*(1.05+b) a*(1.05+b)])                     %Sets limit to g=figure x axis
 
td = (-a-20)/9;                    %Used to determine the difference in hieght of each line of text
th = (-a-20)-td;                   %Used to determine starting height of line of text
title('Light travels from left to right')                           %Title to graph
text(T(1),th-td*31/4,['Focal length = ' num2str(f(1))],'fontsize',10)        %Displays focal length on graph
text(T(1),th-td*30/4,['Object distance = ' num2str(dO)],'fontsize',10)    %Displays object distance on graph
text(T(1),th-td*29/4,['Object height = ' num2str(h(1))],'fontsize',10)    %Displays object height on graph
text(T(1),th-td*28/4,['Image distance = ' num2str(di(end))],'fontsize',10)     %Displays image distance on graph
text(T(1),th-td*27/4,['Image height = ' num2str(h(end))],'fontsize',10)       %Displays image height on graph
text(T(1),th-td*26/4,['Magnification = ' num2str(M)],'fontsize',10)            %Displays magnification on graph
end

%% Credit
%%% ray tracing program for mirror with paraxial approximation
%%%  Author: Shiwei  Huang   Dec.  2019  John Abbott College
%%% Modified by : Sriram kanagalingham  Jun. 2020   John Abbott College

%% Helps clean program when running
clc; clear; close all; format shortG;

%% Case Situations
disp('<strong>Please Select the Case for Your Problem</strong>');

disp('Case 1: Given f and do, determine m and di');
disp('Case 2: Given do and di, determine m and f');
disp('Case 3: Given f and di, determine m and do');
disp('Case 4: Given D and m, determine f, di and do');
disp('Case 5: Given do and m, determine f and di');
disp('Case 6: Given di and m, determine f and do');
disp('Case 7: Given D and f, determine do, di and m');
fprintf('\n');

Case_Number = input('<strong>Case number</strong> = ');

switch (Case_Number)
    
    case 1
        f = input ('Focal length (f) = ');
        do = input ('Object distance (do) = ');
        
        if (do == f)||(do == -abs(f))
            disp('<strong>Error: image distance and magnification is infinite. Graph cannot be produced</strong>');
        else
            m = -f/(do-f);
            di = (f*do)/(do-f);
            
            fprintf('Magnification (m) = %5.4f\n', m);
            fprintf('Image distance (di) = %5.4f\n', di);
        end

    case 2
        do = input ('Object distance (do) = ');
        di = input ('Image distance (di) = ');
        
        if di == -inf || di == inf
            disp('<strong>Error: image distance and magnification is infinite. Graph cannot be produced</strong>');  
        else    
        m = -di/do;
        f = (di*do)/(di+do);
        
        fprintf('Magnification (m) = %5.4f\n', m);
        fprintf('Focal length (f) = %5.4f\n', f);
        end
        
  case 3
        f = input ('Focal length (f) = ');
        di = input ('Image distance (di) = ');
        
        if di == -inf || di == inf
            disp('<strong>Error: image distance and magnification is infinite. Graph cannot be produced</strong>');  
        else   
        m = (f-di)/f;
        do = (f*di)/(di-f);
        
        fprintf('Magnification (m) = %5.4f\n', m);
        fprintf('Object distance (do) = %5.4f\n', do);
        end
       
  case 4
        D = input ('Distance between object and image (D) = ');

        if D == -inf || D == inf
            disp('<strong>Error: image distance and magnification is infinite. Graph cannot be produced</strong>');  
        else
        m = input ('Magnification (m) = ');
            
        f = (m*D)/(-(m-1)^2);
        do = -D/(m-1);
        di =(m*D)/(m-1);
        
        fprintf('Focal length (f) = %5.4f\n', f);
        fprintf('Object distance (do) = %5.4f\n', do);
        fprintf('Image distance (di) = %5.4f\n', di);      
        end
       
    case 5
        do = input ('Object distance (do) = ');
        m = input ('Magnification (m)= ');
        
        if m == -inf || m == inf
            disp('<strong>Error: image distance and magnification is infinite. Graph cannot be produced</strong>');  
        else
        f = (m*do)/(m-1);
        di = -m*do;
        
        fprintf('Focal length (f) = %5.4f\n', f);
        fprintf('Image distance (di) = %5.4f\n', di);
        end
        
    case 6
        di = input ('image distance (di) =');
       
        if di == -inf || di == inf
            disp('<strong>Error: image distance and magnification is infinite. Graph cannot be produced</strong>');  
        else
        m = input ('Magnification (m) = ');
        do = -di/m;
        f= di/(1-m);
        
        fprintf('object distance (do) = %5.4f\n', do);
        fprintf('Focal length (f) = %5.4f\n', f);
        end
        
    case 7
        D = input ('Distance between object and image (D) = ');
        
         if D == -inf || D == inf
            disp('<strong>Error: image distance and magnification is infinite. Graph cannot be produced</strong>');  
            disp('<strong>Press Enter and re-run program, ignore further error messages until you re-run the program</strong>')
         elseif D >=0
             fprintf('<strong>if D>= 0, then f <= D/4</strong> =%5.4f\n', D/4);
             fprintf('\n');
         elseif D<0
             fprintf('<strong>if D< 0,then f > D/4</strong>= %5.4f\n', D/4);
             fprintf('\n');
         end
         
             f = input ('focal length (f) = ');
        
            if (D>=0 && f<=D/4) || (D<0 && f>D/4)
               di_root = roots([1 -D D*f]);
               do_root = D-di_root;
               fprintf('\n');
               
               disp('<strong>There are 2 routes for di and do. Please pick 1 to display on graph</strong>');
               
               disp('<strong> Route 1</strong> : ')
               fprintf('di = %5.4f\n', di_root(1));
               fprintf('do = %5.4f\n', do_root(1));
               fprintf('\n');
               
               disp('<strong> Route 2</strong> : ')
               fprintf('di = %5.4f\n', di_root(2));
               fprintf('do = %5.4f\n', do_root(2));
               fprintf('\n');
               
               route = input('di and do route ='); 

              di = di_root(route);
              do = do_root(route);
              m = -di/do;    
          
              fprintf('Object distance (do) = %5.4f\n', do);   
              fprintf('Image distance (di) = %5.4f\n', di);  
              fprintf('Magnification (m) = %5.4f\n', m); 
            
            else 
             disp('Error: Focal Length does not match condition');
             disp('<strong>Press Enter and re-run program, ignore further error messages until you re-run the program</strong>') 
            end

    otherwise
       disp('Error: Case Number does not exist '); 
end
% h(1) = input('object height =  ');
h(1) = 10;

%% Initial information and variables
D_ini = do;          %Distance of object from origin
Nx = 20;                %Numer of columns in arrays (resolution of results
n(1)=1.0;               %1st index of refraction
n(2)=1.0;               %2nd index of refraction
%% Basic information for figure
hold on                             %Keeps all plots on same figure
h(1) = 10;
h(2) = h(1)*m;
t0 = D_ini + do;                    %Distance of lens from origin
tt = t0 + di;                           %Distance of image from origin
x_F = t0 - f;                            %Determines  focal point from origin
x_Fp = t0 + f;                            %Determines  focal point from origin
xmax = abs([tt D_ini t0]);               %Initialization of xmax
xmax = max(xmax)*1.1;               %Size of domain of graph

if do > 0               %If Object real
    xmin = D_ini;       %Start x_array from object
elseif do < 0           %If Object virtual
    xmin = 0;           %Start x_array from origin
end

% x_maximum_1 = max(xmax,abs(x_F));
% x_maximum = max(x_maximum_1, abs(x_Fp));
% x_maximum_2 = max([abs(xmax) abs(x_F) abs(x_Fp)])

if max([abs(xmax) abs(x_F) abs(x_Fp)]) == abs(x_Fp)
    xline =abs(x_Fp)+abs(t0);
elseif max([abs(xmax) abs(x_F) abs(x_Fp)]) == abs(x_F)
    xline =abs(x_F)+abs(t0); 
elseif max([abs(xmax) abs(x_F) abs(x_Fp)]) == abs(xmax)
    xline =abs(xmax)+abs(t0); 
end

if di <0 || do<0
    start_f = -xline;
else
    start_f = 0;
end

line ([start_f xline], [0 0], 'color', 'black', 'LineWidth', 3);           %Ploting of center line
line([D_ini D_ini], [0 h(1)], 'color', 'blue', 'LineWidth', 3);     %Ploting of object
line([tt tt], [0 h(2)], 'color', 'red', 'LineWidth', 3);        %Ploting of image

%% Light ray calculations
light_ray(1)=0;                         %Light ray parallel to center line
light_ray(2)=-atan(h(1)/do);            %Light ray that goes through center
light_ray(3)=-atan(h(1)/(do-f(1)));     %Light ray that goes through focal point

for ii = 1 : 3              %For all three light rays
    for i= Nx : -1 : 1      %For as long as resolution defined
        Obj_x(i) = start_f+(t0-start_f)/(Nx-1)*(i-1);                         %X_window for object light rays
        Ima_x(i) = t0+(xline-t0)/(Nx-1)*(i-1);                           %X_window for image light rays
        
        Vir_I_x1(i) = start_f/(Nx-1)*(i-1);                                   %X_window for virtual image light rays
        Vir_I_x2(i) = (start_f+t0)/(Nx-1)*(i-1);                                   %X_window for virtual image light rays
        Vir_I_x3(i) = t0/(Nx-1)*(i-1);                                   %X_window for virtual image light rays
        
        Obj_y(ii,i) = h(1)+tan(light_ray(ii))*(Obj_x(i)-D_ini);         %Y_window for object light rays
        Ima_y(ii,i)=(h(2)-Obj_y(end))/(di)*(Ima_x(i)-t0)+Obj_y(end);    %Y_window for image light rays
        
        if di < 0                                                                   %If image virtual
            Vir_i_y1(ii,i)=(h(2)-Obj_y(ii,end))/(di)*(Vir_I_x1(i)-t0)+Obj_y(ii,end);    %Draws the image virtual lines
            Vir_i_y2(ii,i)=(h(2)-Obj_y(ii,end))/(di)*(Vir_I_x2(i)-t0)+Obj_y(ii,end);    %Draws the image virtual lines
            Vir_i_y3(ii,i)=(h(2)-Obj_y(ii,end))/(di)*(Vir_I_x3(i)-t0)+Obj_y(ii,end);    %Draws the image virtual lines
        end
        
        if do < 0                                                                   %If object virtual
            Vir_o_y(ii,i)=h(1)+tan(light_ray(ii))*(Ima_x(i)-D_ini);                 %Draws the objects virtual lines
        end
           
    end
    
    if do < 0                                  %If object virtual
    plot(Ima_x,Vir_o_y,'color','cyan' ,'LineStyle', '--')  %Plots virtual light rays
    end
    
    if di < 0                                  %If image virtual
    plot(Vir_I_x1,Vir_i_y1,'color','magenta' ,'LineStyle', '--')  %Plots virtual light rays
    plot(Vir_I_x2,Vir_i_y2,'color','magenta' ,'LineStyle', '--')  %Plots virtual light rays
    plot(Vir_I_x3,Vir_i_y3,'color','magenta' ,'LineStyle', '--')  %Plots virtual light rays
    end   
    
    plot(Obj_x,Obj_y,'color','blue')                      %Plots object light rays
    plot(Ima_x,Ima_y,'color','red')                      %Plots image light rays
  
end


 
%% Draws the Lenses
% lh = abs(max([Obj_y(end) h(1)])*2.5);        %Determines lens height
lh = max(abs([Obj_y(end), Ima_y(end), h(1)])*1.5);        %Determines lens height
lth =1;                                                             %Determines  maximum domain of plot
line ([t0 t0], [-lh lh], 'color', 'k', 'LineWidth', lth);        %Main lens line
line([x_F x_F],[-lh lh],'linestyle','--','color','green');       %Draws focal line of system
line([x_Fp x_Fp],[-lh lh],'linestyle','--','color','green');       %Draws focal line of system
if f(1)<0                                                       %If lens concave
    
    Lx1 = 1.125*t0;                                %Variable calculations
    Ly1 = 1.125*lh;
    Lx2 = 0.875*t0;
    Ly2 = -1.125*lh;

    line ([t0 Lx1], [lh Ly1], 'color', 'k','LineWidth', lth);    %Left Upper line for arrow
    line ([t0 Lx2], [lh Ly1], 'color', 'k','LineWidth', lth);    %Right Upper line for arrow
    line ([t0 Lx1], [-lh Ly2], 'color', 'k','LineWidth', lth);   %Left Lower line for arrow
    line ([t0 Lx2], [-lh Ly2], 'color', 'k','LineWidth', lth);   %Right Lower line for arrow
elseif f(1)>0                                                   %If lens convex    
    Lx1 = 1.125*t0;                        %Variable calculations
    Ly1 = (lh-(lh*0.15)*sin(pi/3));
    Lx2 = 0.875*t0;
    Ly2 = (-lh+(lh*0.15)*sin(pi/3));
    
    line ([t0 Lx1], [lh Ly1], 'color', 'k','LineWidth', lth);    %Left Upper line for arrow
    line ([t0 Lx2], [lh Ly1], 'color', 'k','LineWidth', lth);    %Right Upper line for arrow
    line ([t0 Lx1], [-lh Ly2], 'color', 'k','LineWidth', lth);   %Left Lower line for arrow
    line ([t0 Lx2], [-lh Ly2], 'color', 'k','LineWidth', lth);   %Right Lower line for arrow
end

%% Text to appear on screen, and plot characterisitics
td = -1.125*lh/9;                    %Used to determine the difference in hieght of each line of text
th = -1.125*lh-td;                   %Used to determine starting height of line of text
xtickangle(90)                      %Makes x value labels vertical
ylim([-1.25*lh lh*1.25])                %Defines vertical limit of plot
xlim([start_f xline])                      %Defines horizaontal limit of plot
title('Light travels from left to right')                           %Title to graph

x_text = start_f+0.5;

text(x_F,lh,["F"],'fontsize',12,'color','green')        %Displays focal length on graph
text(x_Fp,lh,["F'"],'fontsize',12,'color','green')        %Displays focal length on graph

text(x_text,th-td*7,['Focal length = ' num2str(f)],'fontsize',10)        %Displays focal length on graph
text(x_text,th-td*6,['Object distance = ' num2str(do)],'fontsize',10)    %Displays object distance on graph
text(x_text,th-td*5,['Object height = ' num2str(h(1))],'fontsize',10)    %Displays object height on graph
text(x_text,th-td*4,['Image distance = ' num2str(di)],'fontsize',10)     %Displays image distance on graph
text(x_text,th-td*3,['Image height = ' num2str(h(2))],'fontsize',10)       %Displays image height on graph
text(x_text,th-td*2,['Magnification = ' num2str(m)],'fontsize',10)            %Displays magnification on graph

%%% Reference Shiwei's code for help

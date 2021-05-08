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

%% Case Input
Case_N = input('<strong>Case number</strong> = ');

switch (Case_N)
    
    case 1
        f = input ('Focal length (f) = ');
        dO = input ('Object distance (do) = ');
        if abs(dO/f)>20 && dO>0
            do = 1000;
            di =f;
            m = -(f*di)/(f*do); 
            MM =0;
        elseif abs(dO/f)>20 && dO<0
            do = -1000;
            di =f;
            m = -(f*di)/(f*do); 
            MM =0;
        else
            do =dO;
            di = (f*do)/(do-f);  
            m = -f/(dO-f);
            MM =m;
        end
        
        fprintf('Magnification (m) = %5.4f\n', MM);
        fprintf('Image distance (di) = %5.4f\n', di);

    case 2
        dO = input ('Object distance (do) = ');
        di = input ('Image distance (di) = ');
        if abs(dO/di)>20 && dO>0
            do = 1000;
            f = di;
            m = -(f*di)/(f*do); 
            MM =0;
        elseif abs(dO/di)>20 && dO<0
            do = -1000;
            f = di;
            m = -(f*di)/(f*do); 
            MM =0;
        else
           do = dO;
            f = (di*do)/(di+do);
            m = -di/dO;
            MM = m;
        end

        fprintf('Magnification (m) = %5.4f\n', MM);
        fprintf('Focal length (f) = %5.4f\n', f);

  case 3
        f = input ('Focal length (f) = ');
        di = input ('Image distance (di) = ');
        if f == di
            sign = input('Sign (+ for do = inf and - for do = -inf) --> ','s');
            if strcmp(sign,'+')
            dO = inf;
            do = 1000;
            elseif strcmp(sign,'-')
                dO = -inf;
                do = -1000;
            end
            m = -(f*di)/(f*do); 
            MM =0;
        else
            dO = (f*di)/(di-f);
            do = dO;
            m = (f-di)/f;
            MM =m;
        end

        fprintf('Magnification (m) = %5.4f\n', MM);
        fprintf('Object distance (do) = %5.4f\n', dO);
       
  case 4
        D = input ('Distance between object and image (D) = ');
        m = input ('Magnification (m) = ');
        MM = m;
            
        f = (m*D)/(-(m-1)^2);
        do = -D/(m-1);
        di =(m*D)/(m-1);
        
        fprintf('Focal length (f) = %5.4f\n', f);
        fprintf('Object distance (do) = %5.4f\n', do);
        fprintf('Image distance (di) = %5.4f\n', di);      
       
    case 5
        dO = input ('Object distance (do) = ');
        MM = input ('Magnification (m)= ');
        if MM == 0 && dO>0
            fprintf('\n');
            disp('<strong>"di = f", however due to "m =0", there are not enough inputs to calculate properly, thus you must input "di" </strong>');
            di = input('Image distance (di) =');
            fprintf('\n');
            do = 1000;
            m = -di/do;
            f =di;
        elseif MM == 0 && dO<0
            fprintf('\n');
            disp('<strong>"di = f", however due to "m =0", there are not enough inputs to calculate properly, thus you must input "di" </strong>');
            di = input('Image distance (di) =');
            fprintf('\n');
            do =-1000;
            m = -di/do;
            f =di;
        else
            m = MM;
            do = dO;
            f = (m*do)/(m-1);
            di = -m*do;
        end
        
        fprintf('Focal length (f) = %5.4f\n', f);
        fprintf('Image distance (di) = %5.4f\n', di);
        
    case 6
        di = input ('image distance (di) =');
        MM = input ('Magnification (m) = ');
        
        if MM == 0
            sign = input('Sign (+ for do = inf and - for do = -inf) --> ','s');
            if strcmp(sign,'+')
            dO = inf;
            do = 1000;
            elseif strcmp(sign,'-')
                dO = -inf;
                do = -1000;
            end
            m = -di/1000;
            f = di;
        else
            m = MM;
            dO = -di/m;
            do = dO;
            f= di/(1-m);
        end
       
        fprintf('object distance (do) = %5.4f\n', dO);
        fprintf('Focal length (f) = %5.4f\n', f);

    case 7
        D = input ('Distance between object and image (D) = ');
        
         if D >=0
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
              MM =m;
          
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

%% Height and Final Magnification
if abs(dO/f)>20
alpha = deg2rad(input('Angle of descent for rays = '));
fprintf('\n')
h(1) = abs(tan(alpha)*do*1/6);
M =-(f*di)/(f*do);
else
h(1) = input ('Object Height (h) = ');
fprintf('\n')
M =m;
end
h(2) = M*h(1);

%% Safety Checks
if ismember(-inf,di) || ismember(inf,di)
disp('<strong>Error: image distance is infinite and the program cannot to draw properly </strong>')
fprintf('di = %5.4f\n',di);
elseif abs(di)>(abs(do)*10)
disp('<strong>Error: image distance is way too far for the program to draw properly</strong>')
fprintf('di = %5.4f\n',di);
else
%% Basic information for figure
figure;
hold on
t0 = 100;
D_ini = t0-do;
Nx = 20;

tf = t0-f;
tfp = t0+f;
tt = t0-di;

%% Optical Axis Markers 
if do> 0 && abs(dO/f(1))<20 && di>0            
    xmin = min([D_ini tt t0 tf tfp])*0.75;
elseif abs(dO/f(1)) >20 
    xmin = min(tf,tfp)*197/200;
elseif  D_ini<0 || tt<0 || tf<0 || tfp<0      
    xmin =min([D_ini tt t0 tf tfp])*1.25;
else
    xmin = min([D_ini tt t0 tf tfp])*0.75;
end

if abs(dO/f(1)) >20 
xmax = max(tf,tfp)*203/200;   
else
xmax = max([D_ini tt t0 tf tfp])*1.25;             %Size of domain of graph
end

if xmin == tt*0.75
    xmax = t0+(t0-xmin);
elseif xmax == D_ini*1.25
    xmin = t0-(xmax-t0);
end

line ([xmin xmax], [0 0], 'color', 'black', 'LineWidth', 3);           %Ploting of center line

if abs(dO/f(1))<20
line([D_ini D_ini], [0 h(1)], 'color', 'blue', 'LineWidth', 3);     %Ploting of object
end
plot(tf,0,'ro','LineWidth', 3,'MarkerFaceColor','r');
line([tt tt], [0 h(2)], 'color', 'red', 'LineWidth', 3);        %Ploting of image
plot(tfp,0,'ro','LineWidth', 3,'MarkerFaceColor','r');

%% Light Rays
if abs(dO/f(1))>20
light_ray(1)=-atan(h(1)/do);            %Light ray that goes through center
light_ray(2)=-atan(h(1)/do);            %Light ray that goes through center
light_ray(3)=-atan(h(1)/(do-f(1)));     %Light ray that goes through focal poin
else
light_ray(1)=0;                         %Light ray parallel to center line
light_ray(2)=-atan(h(1)/do);            %Light ray that goes through center
light_ray(3)=-atan(h(1)/(do-f(1)));     %Light ray that goes through focal point
end

for ii = 1 : 3              %For all three light rays
    for i= Nx : -1 : 1      %For as long as resolution defined
        Obj_x(i) = xmin+(t0-xmin)/(Nx-1)*(i-1);                         %X_window for object light rays
        Ima_x(i) = t0-(xmax-t0)/(Nx-1)*(i-1);                           %X_window for image light rays
        Obj_y(ii,i) = h(1)+tan(light_ray(ii))*(Obj_x(i)-D_ini);         %Y_window for object light rays
        Ima_y(ii,i)=(Obj_y(end)-h(2))/(di)*(Ima_x(i)-t0)+Obj_y(end);    %Y_window for image light rays
        
        Vir_o_x(i)=t0+(xmax-t0)/(Nx-1)*(i-1);                 %Draws the objects virtual lines
        Vir_i_x(i)= t0+(xmax-t0)/(Nx-1)*(i-1);    %Draws the image virtual lines
        Vir_o_y(ii,i)=h(1)+tan(light_ray(ii))*(Vir_o_x(i)-D_ini);               %Draws the objects virtual lines
        Vir_i_y(ii,i)=(Obj_y(ii,end)-h(2))/(di)*(t0-Ima_x(i))+Obj_y(ii,end);    %Draws the image virtual lines
    end
  
    if do < 0                                  %If object virtual
        plot(Vir_o_x,Vir_o_y,'color','cyan','LineStyle', '--')  %Plots virtual light rays
    end
    if di < 0                                  %If image virtual
        plot(Vir_i_x,Vir_i_y,'color','magenta','LineStyle', '--')  %Plots virtual light rays
    end
    
    plot(Obj_x,Obj_y,'b')                      %Plots object light rays
    plot(Ima_x,Ima_y,'r')                      %Plots image light rays
end

%% Draw Mirror
th = 3; 
if abs(dO/f(1))>20
lh = abs(h(2))*1.25;        %Determines lens height
else
lh = max(abs(h))*1.25;
end
line([t0 t0], [-lh lh], 'color', 'black', 'LineWidth', th);          %Draws Lens

if abs(dO/f(1))>20
    a = 1.25;
else
    a = 0.15;
end

if f>0
txt='\leftarrow converging mirror';
Lx1 = t0-(lh*a)*cos(pi/6);                               %Variable calculations
Ly1 = lh+(lh*0.15)*sin(pi/3);
line ([t0 Lx1], [lh Ly1], 'color', 'black','LineWidth', th);    %Left Upper line for arrow
line ([t0 Lx1], [-lh -Ly1], 'color', 'k','LineWidth', th);   %Left Lower line for arrow
elseif f<0
txt='\leftarrow Diverging mirror';
Lx1 = t0+(lh*a)*cos(pi/6);
Ly1= lh+(lh*0.15)*sin(pi/3);
line ([t0 Lx1], [lh Ly1], 'color', 'black','LineWidth', th);    %Left Upper line for arrow
line ([t0 Lx1], [-lh -Ly1], 'color', 'k','LineWidth', th);   %Left Lower line for arrow
end

%% Text to appear on screen, and plot characterisitics
td = (-lh-20)/9;                    %Used to determine the difference in hieght of each line of text
th = (-lh-20)-td;                   %Used to determine starting height of line of text
xtickangle(90)                      %Makes x value labels vertical
ylim([-lh*1.15 lh*1.15])                %Defines vertical limit of plot
xlim([xmin xmax])                      %Defines horizaontal limit of plot
title('Light travel through mirrors')                           %Title to graph
text(t0,th-td*31/4,txt,'HorizontalAlignment','left','FontSize',10);
text(xmin,th-td*31/4,['Focal length = ' num2str(f)],'fontsize',10)        %Displays focal length on graph
text(xmin,th-td*30/4,['Object distance = ' num2str(dO)],'fontsize',10)    %Displays object distance on graph
text(xmin,th-td*29/4,['Object height = ' num2str(h(1))],'fontsize',10)    %Displays object height on graph
text(xmin,th-td*28/4,['Image distance = ' num2str(di)],'fontsize',10)     %Displays image distance on graph
text(xmin,th-td*27/4,['Image height = ' num2str(h(2))],'fontsize',10)       %Displays image height on graph
text(xmin,th-td*26/4,['Magnification = ' num2str(MM)],'fontsize',10)            %Displays magnification on graph
end
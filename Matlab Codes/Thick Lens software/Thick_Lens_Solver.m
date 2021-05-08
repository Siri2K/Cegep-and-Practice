%% Program clean
clc; clear; close all; format shortG;

%% Input Data Using Command Window
Number_Lenses = fix(input('<strong>Number of Surfaces</strong>(input integer) =  ')); % Number of lens used in System Matrix
fprintf('\n'); % Blank line

%% Pre Allocated value
% Input
R = zeros(1,Number_Lenses);
n = zeros(1,Number_Lenses+1);
t = zeros(1,Number_Lenses-1);

% Output
dI = zeros(1,Number_Lenses);
m = zeros(1,Number_Lenses+1);
h = zeros(1,Number_Lenses+1);
T = zeros(1,Number_Lenses+1);
L = zeros(1,Number_Lenses+1);


%% Input values
disp('<strong>Surfaces curvatures (R) from right to left </strong>'); 
disp('<strong>Note: </strong> ) = R<0 and ( = R>0 ');
for Curve = 1:1:Number_Lenses
      R(Curve) = input('R = '); % Input each lens radius value in order from right lens to left lens 
end
fprintf('\n'); % Blank line

disp('<strong>Medium (air or glass) index from right to left </strong>');  
for index = 1:1:(Number_Lenses+1)
    n(index) = input('n = '); % Input each surface index value in order from right medium to left medium
end
fprintf('\n'); % Blank line

disp('<strong>Gaps between each surface from right to left </strong>'); 
disp(' <strong>Note: </strong> if you have 1 surface, press return key again'); 
if Number_Lenses <2
t = 0;
else
    for gap = 1:1:(Number_Lenses-1)
     t(gap) = input('t = '); % Input each gap between lens in order from right lens to left lens 
    end 
end
 fprintf('\n');% Blank line

dO(1) = input('<strong>The distance from object to the first glass surface </strong>=  ');

if dO(1) == 0
    doo = dO(1)+1*10^-99;
else
    doo = dO(1);
end

h(1) =  input('<strong>Object height</strong>=  ');

if h(1) == 0
    h(1) = h(1)+1*10^-99;
end

%% Calclated Graph values
D_ini = doo*0.5;      %Distance of object from origin
t0 = doo + D_ini;       %Distance from origin to first surface
Nx = 20;                %Numer of columns in arrays (resolution of results

%% Lens count
if length(R) <= 1
    count = length(R); % Single Surface Lens
    figure_count = 0;
else
    count = length(R)-1; % Multiple Surface Lens
    figure_count = 1;
end

%% Matrix Paramater calculations
for i = count : -1:1
 MT{i} = Translation (t(i));                                 %Determines the translational matrix 
 MT_display{i} = rot90(MT{i},3);
 MT_display{i} = string(MT_display{i});
    
 MR{i} = Refraction (n(i), n(i+1), R(i)); 
 MR_display{i} = rot90(MR{i},3); 
  MR_display{i} = string(MR_display{i});
 
    if (length(R) - 1)<1                                     %If this is the last surface
        AO = 1;                      %Calculates system matrix
        AP = AO;                       %Calculates system matrix
        
    elseif i == length(R) - 1
        MR{i+1} = Refraction (n(i+1), n(i+2), R(i+1));          %Add an extra refraction matrix
        MR_display{i+1} = rot90(MR{i+1},3);
        MR_display{i+1} = string(MR_display{i+1});
        MR_initial = MR_display{i+1};
        
        AO = MR{i+1};                                           %Creates initial system matrix
        AP = AO;
         
    end
    
    AO =AO*MT{i} * MR{i};                   %Calculates system matrix
    AP =AP*MT{i} *MR{i};                       %Calculates system matrix
    AT = det(AP);
    System_Matrix_display = rot90(AP,3);
    
 %% Draw All matrix (except initial rotation and system matrix)
xtemp = repmat(1:2,1,2);
ytemp = reshape(repmat(1:2,2,1),1,4);

figure(2*i+figure_count+2);
text(1,1.55,char('Refraction Matrix'),'HorizontalAlignment','center','FontSize',15);
text(xtemp-.5,ytemp-.75,MR_display{i},'HorizontalAlignment','center');
line([.125 0 0 .125 NaN 1.75 2 2 1.75],[0 0 1.5 1.5 NaN 0 0 1.5 1.5])
axis off tight

figure(2*i+figure_count+1);
text(1,1.55,char('Translational Matrix'),'HorizontalAlignment','center','FontSize',15);
text(xtemp-.5,ytemp-.75,MT_display{i},'HorizontalAlignment','center');
line([.125 0 0 .125 NaN 1.75 2 2 1.75],[0 0 1.5 1.5 NaN 0 0 1.5 1.5])
axis off tight
end

%% Draw Most right lens refraction and System Matrix 
if figure_count == 1
figure(3);
text(1,1.55,char('Most right Surface refraction(i.e. Most left matrix in equations)'),'HorizontalAlignment','center','FontSize',15);
text(xtemp-.5,ytemp-.75,MR_initial,'HorizontalAlignment','center');
line([.125 0 0 .125 NaN 1.75 2 2 1.75],[0 0 1.5 1.5 NaN 0 0 1.5 1.5])
axis off tight
end

figure(2);
text(1,1.55,char('Optical System Matrix'),'HorizontalAlignment','center','FontSize',15);
text(xtemp-.5,ytemp-.75,string(System_Matrix_display(:)),'HorizontalAlignment','center');
text(0.1,-0.1,char('determinant (optical system matrix) = '),'FontSize',12.5);
text(1.4,-0.1,string(AT),'FontSize',12.5);
line([.125 0 0 .125 NaN 1.75 2 2 1.75],[0 0 1.5 1.5 NaN 0 0 1.5 1.5])
axis off tight

%% Calculate System Parameters using System Matrix
OF = -AO(2,2)/AO(2,1);              %Determines front focal point from first lens
OFp = -AO(1,1)/AO(2,1);             %Determines back focal point from last lens
f = -det(AO)/AO(2,1);               %Determines front focal point of system
fp = -1/AO(2,1);                    %Determines back focal point of system
FH = -f;                            %Determines first principal point from front focal point
FHp = -fp;                          %Determines second principal point from back focal point
FN = -fp;                           %Determines first nodal point from front focal point
FNp = -f;                           %Determines second nodal point from back focal point

%% Compare formula's with Justins
do_true = dO(1)-FH-OF;
do = doo-FH-OF;
di = do/(do-f)*fp;
m_shiwei = -(f*di)/(fp*do); 
dii = di+FHp+OFp;

if Number_Lenses == 1
    a(1) = 1;
    a(2) = f/do+fp/di;

    b(1) = (n(2)-n(1))/R(1);
    b(2) = n(1)/do + n(2)/di;
end

%% Old Method of Image Calculating
%Initial information for system
figure(1)       %Defines figured used
hold on         %Keep everything on the same figure
M = 1;          %Initial Magnification is 1
L(1) = t0;      %Variable used to simplify code

%For loop for image calculations, variables, and lens drawings
for ii = 1 : length(R)      %Loops for the number of lens surfaces
    
%Calculates the Image height, distance, magnification etc...
    dI(ii) = n(ii+1)/(((n(ii+1)-n(ii))/R(ii))-(n(ii)/doo(ii)));      %Formula to calculate image distance formed by the lens
    m(ii+1) = (n(ii)*(-dI(ii)))/(n(ii+1)*(doo(ii)));                 %Formula to calculate magnification of individual lens
    h(ii+1) = m(ii+1)*h(ii);                                        %Formula to calculate new height of image from lens
    M = M*m(ii+1);                                                  %Formula to calculate the total magnification
   
    %Defines certain variables, and calculates object distance
    T(ii+1) = L(ii);                        %Variable used to simplify coding
    
    if length(R)<=1
        xmax = (sum(t) + t0 + dI(end)) * 1.3;   %Calculate the maximum x distance of figure

        if (abs(xmax)+abs(L(end)))>(abs(fp)+abs(f))
         % Calculation for Optical Axis 
            xline = 3/4*(abs(xmax)+abs(L(end)));
            L(ii+1) = xline;
        else 
            xline =3/4*(abs(fp)+abs(f));
            L(ii+1) =xline;
        end

    else
        if ii <= length(t)                      %if for loop is not at the end of its loop
            doo(ii+1) = t(ii)-dI(ii);            %New object distance is calculated this way
             L(ii+1) = L(ii) + t(ii);            %Variable used to simplify coding
        else                                        %If for loop is at the end of its loop
            xmax = (sum(t) + t0 + dI(end)) * 1.3;   %Calculate the maximum x distance of figure

            % Calculation for Optical Axis 
            if (abs(xmax)+abs(L(end)))>(abs(fp)+abs(f))
                xline =1.5*(abs(xmax)+abs(L(end)));
                L(ii+1) = xline;
            else 
                xline =1.5*(abs(fp)+abs(f));
                L(ii+1) =xline;
            end
        end
    end
end

%% Finding the point to graph on figure
x_F = t0 - OF;              %Determines front focal point from origin
x_Fp = sum(t) + t0 + OFp;   %Determines back focal point from origin
x_H = x_F - FH;             %Determines first principal point from origin
x_Hp = x_Fp + FHp;          %Determines second principal point from origin
x_N = x_F - FN;             %Determines first nodal point from origin
x_Np = x_Fp + FNp;          %Determines second nodal point from origin

%% Light Ray arrays
if x_F <0 || x_Fp <0||dO(1) <0||dI(end)<0 
    start_f = -xline;
else
    start_f = 0;
end

% Creating x arrays for matrix light rays
matrix_ray1_x1 = linspace(start_f, x_H, Nx);          %Creating x array for angled ray 1
matrix_ray1_x2 = linspace(x_H, xline, Nx);       %Creating x array for horizontal ray 2
matrix_ray2_x1 = linspace(start_f, x_Hp, Nx);         %Creating x array for horizontal ray 1
matrix_ray2_x2 = linspace(x_Hp, xline, Nx);      %Creating x array for angled ray 2
matrix_ANI_x1 = linspace(start_f, x_N, Nx);           %Creating x array for Nodal ray 1
matrix_ANI_x2 = linspace(x_Np, xline, Nx);       %Creating x array for Nodal ray 2

%Calculating y arrays for matrix light rays
for i = Nx : -1 : 1
    matrix_ray1_y1(i) = (0-h(1))/(x_F-D_ini)*(matrix_ray1_x1(i)-D_ini)+h(1);%Creating angled light ray 1
    matrix_ray1_y2(i) = matrix_ray1_x2(i)*0 + matrix_ray1_y1(end);          %Creating horizontal light ray 2
    
    matrix_ray2_y1(i) = matrix_ray2_x1(i)*0 + h(1);                         %Creating horizontal light ray 1
    matrix_ray2_y2(i) = (0-h(1))/(x_Fp-x_Hp)*(matrix_ray2_x2(i)-x_Hp)+h(1); %Creating anlged light ray 2
    
    matrix_ANI_y1(i) = (0-h(1))/(x_N-D_ini)*(matrix_ANI_x1(i)-D_ini)+h(1);  %Creating first nodal ray
    K = (matrix_ANI_y1(i)-h(1))/(matrix_ANI_x1(i)-D_ini);                   %Calculates Theta for Nodal ray
    matrix_ANI_y2(i) = K*(matrix_ANI_x2(i)-x_Np);                           %Creating second nodal ray
end

plot(matrix_ray1_x1, matrix_ray1_y1, 'color', 'yellow', 'linewidth', 3)     %Plotting angled light ray 1
plot(matrix_ray1_x2, matrix_ray1_y2, 'color', 'yellow', 'linewidth', 3)     %Plotting horizontal light ray 2
plot(matrix_ray2_x1, matrix_ray2_y1, 'color', 'yellow', 'linewidth', 3)     %Plotting horizontal light ray 1
plot(matrix_ray2_x2, matrix_ray2_y2, 'color', 'yellow', 'linewidth', 3)     %Plotting angled light ray 2
plot(matrix_ANI_x1, matrix_ANI_y1, 'color', 'yellow', 'linewidth', 3)       %Plotting first nodal light ray
plot(matrix_ANI_x2, matrix_ANI_y2, 'color', 'yellow', 'linewidth', 3)       %Plotting second nodal light ray

%% Plotting Light Rays Using Old Method
%Creating different angled light rays
T(1) = start_f;       %Variable used to simplify code
Theta_N = 10;               %Number of increments of Theta's used
Thetastart = -12;           %The smallest angle used
Thetaend = 0;               %The largest angle used
for i = Theta_N : -1 : 1    %For the total number of theta increments used
    Theta(i)=(Thetastart+(Thetaend-Thetastart)/(Theta_N-1)*(i-1))*pi/180;   %The theta array is defined
end

for ii = 1 : (length(R)+1)                                        %loop for one number greater than number of surfaces
    for iii=Nx:-1:1                                             %loop for value of resolution
        x_window(ii, iii)=T(ii)+(L(ii)-T(ii))/(Nx-1)*(iii-1);   %Calculates x window of lens
        if doo(1) < 0                                                %If object virtual
            Vir_windx_o(iii)=t0+(xline-t0)/(Nx-1)*(iii-1);           %Calculates x window for virtual light rays
        end
        if dI(end) < 0                                              %If image is virtual
            Vir_windx_i1(iii)=(T(1))/(Nx-1)*(iii-1);               %Calculates x window for virtual lines
            Vir_windx_i2(iii)=(T(end))/(Nx-1)*(iii-1);               %Calculates x window for virtual lines
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
        if doo<0                                                          %If object is virtual
            Vir_windy_o(iii, iiii)=h(1)+K*(Vir_windx_o(iiii)-D_ini);     %Calculates the y window of virtual rays
            vwo(iiii)=Vir_windy_o(iii, iiii);                               %Variable needed to draw figures properly
        end
    end
    plot (xw1, yw1, 'red')                              %Plots first light ray
    if doo<0                                          %If object is virtual
        plot (Vir_windx_o, vwo, 'b', 'LineStyle', '--') %Plots virtuals light rays
    end
end

%Calculation for subsequent y window arrays
for ii = 1 : length(R)                                  %Loops for as many lens surfaces exists
    for iii = Theta_N : -1 : 1                          %Loops for as many angles used
        x1 = L(ii);                                     %Variable used for y window calculations
        if ii == 1                                      %If loop is at the first lens
            y1 = y_window1(iii, end);                    %Variable used for y window calculations is this
        else                                            %If loop is not at the first lens
            y1 = y_window(iii, end, ii-1);               %Variable used for y window calculations is this
        end
        x2 = x1+dI(ii);                                 %Variable used for y window calculation
        y2 = h(ii+1);                                   %Variable used for y window calculation
        for iiii = 1 : Nx                               %Loop for as long as resolution value
            y_window(iii,iiii,ii)=(y2-y1)/(x2-x1)*(x_window(ii+1,iiii)-x1)+y1;  %Calculates y window for lens
            yw2(iiii)=y_window(iii,iiii,ii);                                    %Variable needed to plot rays on figure
            xw2(iiii)=x_window(ii+1,iiii);                                      %Variable needed to plot rays on figure
            if ((dI(end) < 0) && (ii == length(R)))                             %If images is virtual and loop is on the last lens
                Vir_windy_i1(iii,iiii)=(y2-y1)/(x2-x1)*(Vir_windx_i1(iiii)-x1)+y1;%Calculates y window for virtual ray
                Vir_windy_i2(iii,iiii)=(y2-y1)/(x2-x1)*(Vir_windx_i2(iiii)-x1)+y1;%Calculates y window for virtual ray
                vwi1(iiii) = Vir_windy_i1(iii, iiii);                             %Variable needed to plot rays on figure
                vwi2(iiii) = Vir_windy_i2(iii, iiii);                             %Variable needed to plot rays on figure
            end
        end
        plot (xw2, yw2, 'red')                                  %Plots rays on figure
        if ((dI(end) < 0) && (ii == length(R)))                 %If image is virtual, and loop is at last lens
            plot (Vir_windx_i1, vwi1, 'm', 'LineStyle', '--')     %Plot virtual rays
            plot (Vir_windx_i2, vwi2, 'm', 'LineStyle', '--')     %Plot virtual rays
        end
    end
end

%% Draws objects and base line
%Preliminary calculations to perform drawings
tt = sum(t) + t0 + dI(end);                     %Total length of lens system
lh = abs(max(y_window(end), h(1))*1.1);         %Determines lens height

%Draws the lens
for ii = 1 : length(R)                                          %Loops for the number of lens surfaces
    line ([L(ii) L(ii)], [-lh lh], 'color', 'black', 'LineWidth', 1.5);   %Draws vertical lens line for each lens
    if R(ii)<0                                                           %If lens concave
        Lx = L(ii)-(lh*0.06)*cos(pi/6);                                 %Variable calculations
        Ly1 = lh+(lh*0.06)*sin(pi/3);
        Ly2 = -lh-(lh*0.06)*sin(pi/3);
        line ([L(ii) Lx], [lh Ly1], 'color', 'k','LineWidth', 1.5);    %Upper line for lens
        line ([L(ii) Lx], [-lh Ly2], 'color', 'k','LineWidth', 1.5);   %Lower line for lens
    elseif R(ii)>0                                                      %If lens convex
        Lx = L(ii)+(lh*0.06)*cos(pi/6);                                %Variable calculations
        Ly1 = lh+(lh*0.06)*sin(pi/3);
        Ly2 = -lh-(lh*0.06)*sin(pi/3);
        line ([L(ii) Lx], [lh Ly1], 'color', 'k','LineWidth',1.5);    %Upper line for lens
        line ([L(ii) Lx], [-lh Ly2], 'color', 'k','LineWidth', 1.5);   %Lower line for lens
    end
end

    x_H1 = x_H*0.9875;
    x_H2 = x_Hp;

    x_N1 = x_N*0.9875;
    x_N2 = x_Np;

%% Draws Matrix Points
line([start_f xline], [0 0], 'color', 'k', 'LineWidth', 1.5);  %% Draws Optical Center Line    
line([D_ini D_ini], [0 h(1)], 'color', 'blue', 'LineWidth', 3);  %Draws object
line([tt tt], [0 h(end)], 'color', 'cyan', 'LineWidth', 3);   %Draws image
line([x_F x_F],[-lh-20 lh+10],'linestyle','--','color','green');       %Draws front focal point line of system
line([x_Fp x_Fp],[-lh-20 lh+10],'linestyle','--','color','green');     %Draws back focal point line of system
line([x_H x_H],[-lh-20 lh+10],'linestyle','--','color','blue');        %Draws first principal point line of system
line([x_Hp x_Hp],[-lh-20 lh+10],'linestyle','--','color','blue');      %Draws second principal point line of system
plot(x_N,0,'marker','+','markersize',12,'color','magenta');            %Draws first nodal point of system
plot(x_Np,0,'marker','+','markersize',12,'color','magenta');           %Draws second nodal point of system

text(D_ini,lh+9,"do",'fontsize',12,'color','red');                    %Writes f next to front focal line
text(x2,lh+9,"di",'fontsize',12,'color','red');                  %Writes fp next to back focal line
text(x_F,lh+9,"f",'fontsize',12,'color','green');                    %Writes f next to front focal line
text(x_Fp,lh+9,"f'",'fontsize',12,'color','green');                  %Writes fp next to back focal line
text(x_H1,-lh-19,"H",'fontsize',12,'color','blue');                   %Writes H next to first principal line
text(x_H2,-lh-19,"H'",'fontsize',12,'color','blue');                 %Writes Hp next to second principal line
text(x_N1,-1,"N",'fontsize',12,'color','magenta');                    %Writes N next to first nodal point line
text(x_N2,-1,"N'",'fontsize',12,'color','magenta');                  %Writes Np next to second nodal point line

%% Text to appear on screen, and plot characterisitics
td = (-lh-20)/9;                    %Used to determine the difference in hieght of each line of text
th = (-lh-20)-td;                   %Used to determine starting height of line of text
x_mag_start = (abs(x_F) +abs(x_Fp))/(abs(x2) +abs(D_ini));
x_mag_end = xline/0.5;
xtickangle(90)                      %Makes x value labels vertical
ylabel('y-axis Distance');         %Titles y-axis
xlabel('x-axis Distance');          %Titles x-axis
title('Light travels from left to right')                   %Title to graph

if x_mag_start >10000
    x_start = 0.01;
else
    x_start = start_f;
end

if x_mag_end>10000
    x_end = 50;
else
    x_end = xline;
end

% xlim([0 xline])                      %Defines horizaontal limit of plot
xlim([x_start x_end])                      %Defines horizaontal limit of plot
ylim([-lh-20 lh+10])                %Defines vertical limit of plot

text(x_start ,th-td*15/2,['dO(1) (from object to the first surface) = ' num2str(dO(1))],'fontsize',10)           %Displays front focal length on graph
text(x_start ,th-td*14/2,['dI(ii) (from last surface to image) = ' num2str(dI(ii))],'fontsize',10)           %Displays front focal length on graph
text(x_start,th-td*13/2,['do (from object to H) = ' num2str(do_true)],'fontsize',10)           %Displays front focal length on graph
text(x_start ,th-td*12/2,['di (from image to H^\prime) = ' num2str(di)],'fontsize',10)         %Displays back focal length on graph
text(x_start ,th-td*11/2,['m = ' num2str(M)],'fontsize',10)         %Displays back focal length on graph
% text(5,th-td*11/2,['m_shiwei = ' num2str(m_shiwei)],'fontsize',10)         %Displays back focal length on graph
text(x_start ,th-td*10/2,['f = ' num2str(f)],'fontsize',10)           %Displays front focal length on graph
text(x_start ,th-td*9/2,['f^\prime = ' num2str(fp)],'fontsize',10)         %Displays back focal length on graph
text(x_start ,th-td*8/2,['OF = ' num2str(OF)],'fontsize',10)         %Displays focal length on graph
text(x_start,th-td*7/2,['O^\primeF^\prime = ' num2str(OFp)],'fontsize',10)      %Displays object distance on graph
text(x_start,th-td*6/2,['FH = ' num2str(FH)],'fontsize',10)         %Displays object height on graph
text(x_start ,th-td*5/2,['F^\primeH^\prime = ' num2str(FHp)],'fontsize',10)      %Displays image distance on graph
text(x_start,th-td*4/2,['FN = ' num2str(FN)],'fontsize',10)           %Displays image height on graph
text(x_start,th-td*3/2,['F^\primeN^\prime = ' num2str(FNp)],'fontsize',10)           %Displays magnification on graph
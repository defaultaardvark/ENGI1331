p = polyfit(x, y, n);%<-- used to build trend lines of data sets(?)
% n = degree of polynomial function (will only be 1 in this class)
y = mx+b

%Power functions
y = bx^m
log10(y) = log10(b(x^m)) %<-- log base 10 for power functions; log() is used for ln, not used for power functions
p = polyfit(log10(x), log10(y), 1);
p1 = m
p2 = b = log10(b) = 10^p2

%Exponential functions
y = be^mx
p = polyfit(x, logy, 1)

%% linear functions
clc
clear
close all

%graph pressure vs temperature of an ideal gas
data = [375 2.2; 395 2.3; 420 2.5; 450 2.6; 500 2.9];

T = data(:,1);
P = data(:,2);

figure('color','w');

%plotting experimental data

plot(T,P,'dr','MarkerFaceColor','r','MarkerSize', 14);
axis([350 550 2 3]);
xlabel('Temperature (T) [K]','FontSize',12);
ylabel('Pressure (P) [atm]','FontSize',  12);
title('Pressure using Ideal Gas Law','FontSize',20);
grid on

%polyfit is used to find the slope and y intercept

linear_fit = polyfit(T,P,1);
m = linear_fit(1);
b = linear_fit(2);

%creating the equation of a straight line
t_line = [375:10:505];
p_line = m.*t_line + b;

hold on
plot(t_line, p_line, '-r','LineWidth',3);

label = sprintf('P = %0.3fT + %0.3f',m,b);
text(375,2.8,label,'BackgroundColor','w','EdgeColor','r','Color','r','FontSize',14);


%%power function
clc
clear
close all

%graphing volume (cm^3) and radius (cm) of cylinder holding height constant

data = [0.5 3; 1 13; 1.25 20; 1.5 28; 2 50];
radius = data(:,1);
volume = data(:,2);

figure('color','w');

%plot experimental data

plot(radius, volume, 'sb','MarkerFaceColor','b','MarkerSize',14);
axis([0 3 0 60]);
xlabel('Radius (r) [cm]');
ylabel('Volume (V) [cm^3]');
title('Volume Expansion from Radius Growth');
grid on

%using polyfit to create the power curve
power_fit = polyfit(log10(radius), log10(volume), 1);
m = power_fit(1);
b = 10^power_fit(2);

%creating power curve
r_fit = [0.5:0.1:2];
v_fit = b*r_fit.^m;

hold on
plot(r_fit, v_fit, '-b','LineWidth',3);
power_label = sprintf('V = %0.1fR^{%0.0f}',b,m);
text(0.25, 50, power_label,'BackgroundColor','w','EdgeColor','b','Color','b','FontSize',14);

%%exponential function

%graph voltage (volts) in a capacitor over time (seconds)
data = [1 18.1; 5 12.1; 15 4.5; 20 2.5; 30 1];
time = data(:,1);
voltage = data(:,2);

%plotting experimental data
plot(time,voltage,'hg','MarkerFaceColor','g','MarkerSize',20);
axis([0 40 0 20]);
xlabel('Time (T) [sec]');
ylabel('Voltage (V) [volts]');
title('Voltage in Capacitor Over Time');
grid on

%using polyfit to create an exponential curve
expo_fit = polyfit(time,log(voltage),1);
m = expo_fit(1);
b = exp(expo_fit(2));

%creating our exponential curve
t_fit = [1:30];
v_fit = b*exp(m*t_fit);

hold on
plot(t_fit, v_fit, '-g','LineWidth',3);

expo_label = sprintf('V = %0.0fe^{%0.1f}',b,m);
text(0.25, 50, expo_label,'BackgroundColor','w','EdgeColor','g','Color','g  ','FontSize',14);

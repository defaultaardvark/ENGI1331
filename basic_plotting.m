%% ENGI 1331 Ravi Namuduri Basic Plotting

%Experimental data

clc
clear
close all

%Inputes
voltage = [18 30 40 45]; %<--volts
resista = [5 18 24 30]; %<--mA
resistb = [15 26 34 50];%<--mA

%Basic way to create a plot
plot(voltage, resista, voltage, resistb);
figure(2);
plot(voltage, resista, 'sk', voltage, resistb, 'xr');

%option 2
figure(3);
plot(voltage, resista, 'sk');
hold on
plot(voltage, resistb, 'xr');

%change the limits of our axis
axis([0 50 0 60]);

%[xmin, xmax, ymin, ymax]
axis([max(voltage), max(voltage), min(resista), min(resistb)]);


%yet another option
xmin = min(voltage) - 5;
xmax = max(voltage) + 5;
ymin1 = min(resista) - 5;
ymax1 = max(resista) + 5;
ymin2 = min(resistb) - 5;
ymax2 = max(resistb) + 5;

ymin = min([ymin1 ymin2]);
ymax = min([ymax1 ymax2]);

axis([xmin xmax ymin ymax]);

%axis labels
xlabel('Voltage (V) [volts]');
ylabel('Current (I) [mA]');
%Label should include variable name, symbol, and units

%Title
title('Currents through Thermionic Resistors');

%option 2
plot_title = input('Enter title for plot: ', 's');
title(plot_title);

%option 3: user gives component name
component = input('Enter the component name: ', 's');
plot_title1 = sprintf('Voltage and current in %s', component);
title(plot_title1);

%add legend
legend('ResistorA', 'ResistorB', 'Location', 'Best');
grid on

%% Theoretical data

clc
clear
close all

%inputs
B_0 = 10; %initial number of bacteria
k1 = 0.2; %first set growth constant (per hour)
k2 = 0.3; %second set growth constant (per hour)

%option 1: predefine the independent variables
t = [0:0.1:5];

%option 2: user defined independent variable
% tstart = input('Starting time (hours): ');
% tstep = input('Preferred increment (hours): ');
% tend = input('End time (hours): ');
% t = [tstart:tstep:tend];

%dependent variables
B1 = B_0*exp(k1*t);
B2 = B_0*exp(k2*t);

figure('color','r');

%plot theoretical data
plot(t, B1, '-k');
hold on
plot(t, B2, '--g');

%create a textbox to show equation used
M = 'B = B_0*exp(k*t)';
text(0.5, 40, M, 'BackgroundColor', 'k', 'EdgeColor', 'b', 'FontSize', 16);

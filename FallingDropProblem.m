%%  Ravi Namuduri 1543511 ENGI 1331 Falling Drop Problem

% Problem statement: Calculate the surface tension of a falling drop given the maximum radius in inches and the specific gravity of a liquid.

% Input variables
% R = Maximum radius [in]
% SG = Specific gravity [-]

% Constants
% g = acceleration due to gravity [m/(s^2)]
% rho_w = density of water [kg/(m^3)]

% Intermediate variable
% rho_l = density of the liquid [kg/m^3]

% Output variables
% sigma = surface tension of the liquid drop [J/m^3]

clc
clear

% Set input variables and Constants
R  = 0.25;  %[inches]
SG = 0.79;  %[-]
g = 9.8;    %[m/s^2]
rho_w = 1000; %[kg/m^3]

R = input('Enter the maxiumum radius (in): ');
SG = input('Enter the specific gravity of the drop: ');

% Convert from inches to meters
R = R*2.54; %[cm]
R = R/100;  %[m]

%Calculating density of the liquid
rho_l = SG*rho_w; %[kg/m^3]

%Calculate surface tension
sigma = (R^2)*g*rho_l;  %[kg/s^2]

% 1[kg/s^2] = 1[J/m^2]

fprintf('The the surface tension is %0.2f J/m^2 when the acceleration of gravity (g) is %0.1f m/s^2.\n', sigma, g);

% '%%f' should be used if you want to print the text '%f'

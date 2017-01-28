%%
% Ravi Namuduri
% 1543511
% ENGI 1332 TTh 2:30-4
% Problem 1
%%

%Problem Statement: Find the difference in pressure [atm] using the gas using the Ideal Gas Law
%and van der Waals equation given the volume [L], absolute temperature [K], and compensation values [-] of the gas.

%input variables
% gas = name of gas
% GVol = volume of gas [L]
% temp = absolute temperature of gas [K]
% a = compensation value a [-]
% b = compensation value b [-]
%
% %output variables
% ideal = pressure of gas using the ideal gas law [atm]
% waals = pressure of gas using the van der Waals equation [atm]
% diff = difference in pressure between the two equations [atm]
%
%Constants
% R = ideal gas constant [(L*atm)/(K*mol)]
%
%intermediate variables
% mol = calculating number of moles of gas from volume [mol]

%Housekeeping
clear;
clc;

%Constants
R  = 0.08206; %[(L*atm)/(K*mol)]

%user inputs
gas = input('Gas: ', 's');
GVol = input('Gas Volume [L]: ');
temp = input('Absolute Temperature [K]: ');
a = input('Value of a: ');
b = input('Value of b: ');

%converting volume to moles of gas (only works with ideal gas)
mol = GVol/22.41; %liters/mol

%resulting pressure [atm]
ideal = (mol*R*temp)/GVol; %atm
waals = ((mol*R*temp)/(GVol-(mol*b)))-((a*(mol^2))/(GVol^2)); %atm
diff = ideal-waals; %atm

%outputs
fprintf('The estimated pressure using the Ideal Gas Law is %0.4f atm.\n', ideal);
fprintf('The estimated pressure using the van der Waals equation is %0.4f atm.\n', waals);
fprintf('The difference between the two estimations is %0.4f atm.\n ', diff);

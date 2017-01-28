%%
% Ravi Namuduri
% 1543511
% ENGI 1332 TTh 2:30-4
% Problem 1
%%
% Problem Statement: Determine the weight of a rod on Jupiter's moon Callisto given
%specific gravity, gravitational acceleration in m/s^2, and volume in m^3.

% Input Variables
% volrod = volume of rod [m^3]
%
% Ouput Variables
% weigh2rod = weight of rod in pounds-force
%
% Intermediate Variables
% densrod = density of rod [kg/m^3]
% massrod = mass of rod [kg]
% weighrod = weight of rod on Callisto [N]
%
% Constants
% sgrod = specific gravity of rod [-]
% gravcall = acceleration of gravity on Callisto

%Housekeeping
clear;
clc;

%Constants
sgrod = 4.7; % no units
gravcall = 1.25; % m/(s^2);

%calculating density of rod
densrod = sgrod * 1000; % kg/(m^3)

%user input
volrod = input('Volume of rod [m^3]: ');

%calculating mass of rod
massrod = densrod * volrod; % kg

%calculating weight of rod and converting from Newtons to pounds-force
weighrod = massrod * gravcall; % N
weigh2rod = weighrod * 0.225; % pound-force

%output
fprintf('The weight of the rod is %0.0f pounds-force. \n',weigh2rod);

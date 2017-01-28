%%
% Ravi Namuduri
% 1543511
% ENGI 1332 TTh 2:30-4
% Problem 1
%%
%
%Problem Statement: Find the time in seconds it takes a motor to raise a load given
% the acceleration of gravity [m/s^2], power [W], efficiency [%], load [kg}], and height [m].
%
%input variables
% mot = name of motor
% pow = power of motor [W]
% effic = efficiency of motor [%]
% load = load on motor [kg]
% height = height to lift load [m]
%
%output variables
% time = time it takes the motor to lift the load a certain height
%
%Constants
% g = acceleration of gravity [m/s^2]
%
%intermediate variables
% PE = potential energy [J]

%Housekeeping
clear;
clc;

%constants
g = 9.8; %m/s^2

%user inputs
mot = input('Name of motor: ', 's');
pow = input('Power of motor [W]: ');
effic = input('Rated efficiency of motor [%]: ');
load = input('Load [kg]: ');
height = input('Height [m]: ');

%calculating potential energy
PE = load*height*g; %[J]

%calculating time
time = PE/(pow*(effic/100));

%output
fprintf('It will take %0.2f seconds for the %s motor to raise a %0.0fkg load %0.1fm.\n', time, mot, load, height);

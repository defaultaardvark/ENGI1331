clear;
clc;

% Calculate the time a motor can lift a given load a given height with a given power and efficiency

mot = input('Name of motor: ', 's');
pow = input('Power of motor [W]: ');
effic = input('Rated efficiency of motor [%]: ');
load = input('Load [kg]: ');
height = input('Height [m]: ');

g = 9.8; %m/s^2

% PE = mgh
PE = load*height*g; %[kg (m^2)/(kg^2)]
time = PE/(pow*(effic/100));

fprintf('It will take %0.2f seconds for the %s motor to raise a %0.0fkg load %0.1fm.\n', time, mot, load, height);

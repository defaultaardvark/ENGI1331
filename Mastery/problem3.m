%%
% Ravi Namuduri
% 1543511
% TTh 2:30 - 4
% ENGI 1331
%%
%
%problem statement: Find the energy required to boil a gallon of water [J], the power
% used to do so [W], and the efficiency of the burner [%] given the initial temperature of the water [deg F], amount of time it took to boil [min],
% and rated power of the burner [W].
%
%input variables
% name = name of motor
% fahr = initial room temperature [deg Fahrenheit]
% time = time taken to reach boiling point [min]
% power = rated burner power [W]
%
%output variables
% energy = energy used to heat 1 gallon of water to boiling point [J]
% p_used = power used by the burner to heat the water to boiling point [W]
% effic = efficiency of burner compared to its rated power [%]
%
%intermediate variables
% vol = volume of water [L]
% cels = room temperature [deg Celsius]
% temp = room temperature [Kelvin]
%
%Constants
% gal = initial volume of water [1 gallon]
% Cw = specific heat of water [J/(kg*K)]

%Housekeeping
clear;
clc;

%Constants
gal = 1; %Gallons
Cw = 4184; %J/(kg*K)
vol = (gal/0.264); %density of water = 1000 kg/m^3

%user inputs
fahr = input('Initial room temp [deg F]: '); %[Fahrenheit]
time = input('Time taken to reach boil [min]: '); %[minutes]
name = input('Brand name and model of stove: ', 's');
power = input('Rated burner power [W]: '); %[W]

%convert fahrenheit to Celsius
cels = (fahr-32)*(1/1.8); %[deg C]

%convert celsius to kelvin
temp = cels+273.15; %[K]

%calculate energy used
energy = (373.15-temp)*vol*Cw; %[J]

%calculate power used by burner
p_used = energy/(time*60); %[W]

%calculate efficiency of burner
effic = (p_used/power)*100; %[%]

%outputs
fprintf('\nEnergy required:\t\t\t%0.0f J\n', energy);
fprintf('Power used by burner:\t\t%0.0f W\n\n', p_used);
fprintf('Burner efficiency for a %s stove: %0.1f%%\n', name, effic);

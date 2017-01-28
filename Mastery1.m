% Mastery 1

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

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
count = 1;
again = 1;

%user inputs
name = input('Brand name and model of stove: ', 's');
while again == 1
  fahr = input('Initial temp [deg F]: '); %[Fahrenheit]
  time = input('Time taken to reach boil [min]: '); %[minutes]
  while time < 0
    fprintf('Please enter a positive time: \n');
    time = input('Time taken to reach boil [min]: '); %[minutes]
  end
  power = input('Rated burner power [W]: '); %[W]
  temp = ((fahr-32)*(1/1.8))+273.15; %[K]
  energy = (373.15-temp)*vol*Cw; %[J]
  p_used = energy/(time*60); %[W]
  effic = (p_used/power)*100; %[%]
  while effic > 100
      fprintf('It is not possible to have an efficiency greater than 100%%.\n')
      power = input('Please enter a new rated burner power [W]: '); %[W]
      effic = (p_used/power)*100; %[%]
  end

  %outputs
  fprintf('Household Appliance Efficiency Calculator #%0.0f',count);
  fprintf('\nEnergy required:\t\t\t%0.0f J\n', energy);
  fprintf('Power used by burner:\t\t%0.0f W\n\n', p_used);
  fprintf('Burner efficiency for a %s stove: %0.1f%%\n', name, effic);

  menu_title = sprintf('Would you like to use the %s again with new values?', name);
  again = menu(menu_title, 'Yes','No');
  count = count + 1;
end

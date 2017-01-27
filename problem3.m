clear
clc

name = input('Brand name and model of stove: ', 's');
temp = input('Room temp [deg F]: ');
time = input('Time taken to reach boil [min]: ');
power = input('Rated burner power [W]: ');

vol = 1; %Gallons
Cw = 4.184; %J/(g*K)
volmet = (vol/0.264)*1000; %mL = cm^3; density of water = 1 g/cm^3

tempC = (temp-32)*(5/9);
energy = (100-tempC)*Cw*volmet;

fprintf('The energy produced by %s is %0.0fJ.\n', name, energy);

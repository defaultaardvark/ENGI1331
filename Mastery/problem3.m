clear
%clc

name = input('Brand name and model of stove: ', 's');
fahr = input('Room temp [deg F]: ');
time = input('Time taken to reach boil [min]: ');
power = input('Rated burner power [W]: ');

gal = 1; %Gallons
Cw = 4.184; %J/(g*K)
vol = (gal/0.264)*1000; %mL = cm^3; density of water = 1 g/cm^3

cels = (fahr-32)*(1/1.8);
temp = cels+273.15;
energy = (373.15-temp)*vol*Cw;

fprintf('The energy produced by %s is %0.0fJ.\n', name, energy);

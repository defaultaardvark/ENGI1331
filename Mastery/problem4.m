clear
clc

gas = input('Gas: ', 's');
GVol = input('Gas Volume [L]: ');
temp = input('Absolute Temperature [K]: ');
a = input('Value of a: ');
b = input('Value of b: ');

mol = GVol/22.41; %liters/mol
R  = 0.08206;
ideal = (mol*R*temp)/GVol; %atm
waals = ((mol*R*temp)/(GVol-(mol*b)))-((a*(mol^2))/(GVol^2)); %atm
diff = ideal-waals; %atm

fprintf('The estimated pressure using the Ideal Gas Law is %0.4f atm.\n', ideal);
fprintf('The estimated pressure using the van der Waals equation is %0.4f atm.\n', waals);
fprintf('The difference between the two estimations is %0.4f atm.\n ', diff);

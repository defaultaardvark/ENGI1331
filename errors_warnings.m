%% Ravi Namuduri ENGI 1331 errors

%problem statement: conert temp from kelvin to degrees fahrenheit

%input variables
%T = temp [K]

%output variable
%T_F = Temp in deg fahrenheit

clear
clc

T = input('Enter a temperature in degrees Kelvin: ');

%check if value is negative; if it is, terminate program <-- goddamn that's harsh
%otherwise convert to fahrenheit and print out to command window

if T > 0
  T_F = (T-273)*1.8+32;
  fprintf('The temperature is %0.0f degrees Fahrenheit.',T_F);
else
  error('Given temperature is invalid. Terminating program');
end

%% warnings

%problem statement: conert temp from kelvin to degrees fahrenheit

%input variables
%T = temp [K]

%output variable
%T_F = Temp in deg fahrenheit

clear
clc

T = input('Enter temperature in Kelvin: ');

%Check if value is negative; if it is, warn the user and assume absolute
% value of T to do the conversion

if T > 0
  T_F = (T-273)*1.8+32;
else
  warning('Input is negative. Changing to absolute value.');
  T_F = (abs(T)-273)*1.8+32;
end
fprintf('Temperature %0.0f is equivalent to %0.0f degrees Fahrenheit',abs(T),T_F);

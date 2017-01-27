%%  Creates a section which allows certain parts within the program to run independently
%{
Ravi Namuduri 1543511
ENGI 1331 TTh 2:30-4
Example 15-8

Use the above header format for assignments

Problem Statement: Calculate the volume and surface area of a cylinder
given radius and height in cm.

Input Variables:
(variable name = defined variable (units))

r = radius (cm)
H = height (cm)

Output Variables:
SA = surface area (cm^2)
V = volume (cm^3)
%}
% Housekeeping commands
% NOTE: Must always have these two at the beginning of the program
% Do not require output suppression

clc
clear

% Set input Variables
% NOTE: Always suppress inputs
% Always include units in comments
% pi is inbuilt, there is no need to define it

r = 3; % (cm)
H = 4; % (cm)

% Calculatiosn
% NOTE: Typically there will formatted outputs
% If not formatted output, then do not suppress

SA = 2*pi*(r^2) + 2*pi*r*H %  (cm^2)
V = pi*(r^2)*H %  (cm^3)
SA2 = int16(SA);
V2 = int16(V);

fprintf('The surface area of the cylinder is %d cm^2 and the volume is %d. \n', SA2, V2);

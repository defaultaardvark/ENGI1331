clc
clear
close all

v = 0.3;
sg = 4.7;
g = 1.25;

[lbf] = weight(v,sg,g);
fprintf('Weight is %0.0flbf',lbf);

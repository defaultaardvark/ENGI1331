clc
clear
close all

Test = input('Input Voltage [V] and Frequency [Hz]: ');

tstcount = 1;
if size(Test) ~= [1 2]
  if tstcount == 3
    error('Too many tries. Terminating.');
  else
    test_txt = sprintf('Dimensions not correct. Please try again: ');
    Test = input(test_txt);
    tstcount = tstcount + 1;
end

if Test(1) <= 

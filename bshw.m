%%
clc
clear
close all

d = [1 3 7 9];
ra = [80 402 1100 2496];
rb = [143 830 2530 4546];
rc = [465 2533 6864 14956];

rafit = polyfit(log10(d), log10(ra), 1);
fprintf('\n R = %0.2f*distance^%0.2f',10^(rafit(2)), rafit(1));

rbfit = polyfit(log10(d), log10(rb), 1);
fprintf('\n R = %0.2f*distance^%0.2f',10^(rbfit(2)), rbfit(1));

rcfit = polyfit(log10(d), log10(rc), 1);
fprintf('\n R = %0.2f*distance^%0.2f',10^(rcfit(2)), rcfit(1));


%%

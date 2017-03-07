%% Ravi Namuduri 1543511 ENGI 1331 TTh 2:30 - 4

% problem 2

clc
clear

datnum = input('Data point count: ');
decnum = input('Decimal show count: ');

dat_in = [];
for curr = 1:datnum
  data = input(sprintf('Data point #%d: ',curr));
  dat_in = [dat_in data];
end
dat_vec = [];

for curr = 1:length(dat_in)-1
  dat_vec = [dat_vec sprintf('%0.*f, ', decnum, dat_in(curr))];
end

dat_vec = [dat_vec sprintf('%0.*f', decnum, dat_in(curr+1))];
fprintf('\n\nData set information:\n');
fprintf('Vector = [');
fprintf(dat_vec);
%fprintf(sprintf('%0.*f ', decnum, dat_in)); <--- Why doesn't this work?
fprintf(']');

mask = dat_in > 0;
fprintf(sprintf('\n\nNegative:\t\t\t\t%0.*f', decnum, length(mask)-sum(mask)));
fprintf(sprintf('\nPositive:\t\t\t\t%0.*f', decnum, sum(mask)));

dat_sum = 0;
for curr = 1:length(dat_in)
  dat_sum = dat_in(curr) + dat_sum;
end

fprintf(sprintf('\n\nSum of all values:\t\t%0.*f', decnum, dat_sum));

dat_mean = dat_sum/length(dat_in);
dat_med = length(dat_in)/2;

if dat_med == floor(dat_med);
  dat_med = ((2*dat_med)+1)/2;
else
  dat_med = ceil(dat_med);
end

fprintf(sprintf('\n\nMean:\t\t\t\t\t%0.*f', decnum, dat_mean));
fprintf(sprintf('\nMedian:\t\t\t\t\t%0.*f', decnum, dat_in(dat_med)));

dat_std = std(dat_in(:));
fprintf(sprintf('\n\nStandard Deviation:\t\t%0.*f', decnum, dat_std));

fprintf(sprintf('\n\nMinimum:\t\t\t\t%0.*f', decnum, min(dat_in)));
fprintf(sprintf('\nMaximum:\t\t\t\t%0.*f\n', decnum, max(dat_in)));

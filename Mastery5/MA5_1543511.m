%% Ravi Namuduri 1543511 ENGI 1331 TTh 2:30 - 4

% problem 1

clc
clear

again = 1;
while again == 1
line = menu('Resistance in Parallel or Series?','Parallel','Series');
resist = input('Input resistances [ohms] as vector: ');
fprintf('Resistances entered are ');
fprintf('%0.0f,',resist(1:length(resist)-1));
fprintf(' and %0.0f ohms.',resist(length(resist)));
  if line == 1
    total = [];
    for curr = 1:length(resist)
      total = [total 1/resist(curr)];
    end
    equiv = (sum(total))^(-1);
  elseif line == 2
    total = [];
    for curr = 1:length(resist)
      total = [total resist(curr)];
    end
    equiv = sum(total);
  else
    again = menu('Line type not recognized. Again?','Yes','No');
  end
fprintf('\n\nEquivalent resistance: %0.0f ohms',equiv);
again = menu('Would you like to enter another data set?','Yes','No');
end

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

%% Ravi Namuduri 1543511 ENGI 1331 TTh 2:30 - 4

%problem 3

clc
clear

again = 1;
while again == 1
  init_inv = input('Initial inventory for week 1: ');
  sale_in = input('Sales information as vector: ');

  %weeks
  week = [];
  for curr = 1:length(sale_in)
    week = [week curr];
  end
  fprintf('\nWeek:\t\t');
  fprintf('%0.0f\t',week)

  %sales
  fprintf('\nSales:\t\t')
  fprintf('%0.0f\t',sale_in);

  %Inventory
  inv = [];
  inv = [inv init_inv];
  for curr = 1:length(sale_in)
    if curr-1 == 0
      curr_inv = init_inv;
      inv = [inv curr_inv];
    else
      curr_inv = inv(curr-1) + sale_in(curr-1) - sale_in(curr);
      if curr_inv < 0
        warning('Inventory is below zero at week %d',curr);
        inv_floor = 0;
        inv = [inv inv_floor];
      else
        inv = [inv curr_inv];
      end
    end
  end
  fprintf('\nInventory:\t');
  fprintf('%0.0f\t',inv(2:length(inv)));
  scatter(week, inv);
  xlabel('Time [week]');
  ylabel('Inventory [units]');
  again = menu('Enter another data set?','Yes','No');
end

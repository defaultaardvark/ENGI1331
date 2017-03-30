%% Ravi Namuduri 1543511 ENGI 1331 TTh 2:30 - 4

%problem 3
% locate values in matrix larger than 1000 and prompt user input to replace them. Then calculate the average of the numbers surrounding
% each value and determine if the percent difference is greater than a user determined percentage.

clc
clear

photov_dat = csvread('Problem3.csv');

%matrix check
[indrow indcol] = find(photov_dat >= 1000);
fprintf('The values at ');
for curr = 1:length(indrow)-1
  fprintf('(%0.0f, %0.0f), ', indrow(curr), indcol(curr));
end
fprintf('and (%0.0f, %0.0f) are greater than 1000.\n', indrow(length(indrow)), indcol(length(indcol)));

%all this extra indexing is from when I wrote the program without checking the rubric
% and didn't want to rewrite a bunch of indexing code when it works. Sorry about that.
indmask = find(photov_dat >= 1000);
indlength = sprintf('Input %d corresponding value(s) less than 1000 (vector): ', length(indmask));
indlength_2 = sprintf('Incorrect quantity of values. Input %d value(s) less than 1000 (vector): ', length(indmask));
valrep = input(indlength);
while length(valrep) ~= length(indmask)
  valrep = input(indlength_2);
end
for curr = 1:length(indmask)
  while valrep(curr) >= 1000
    fprintf('Value(s) too high\n');
    rep = sprintf('Input new value for (%d, %d) less than 1000: ', indrow(curr), indcol(curr));
    valrep(curr) = input(rep);
  end
  photov_dat(indmask(curr)) = valrep(curr);
end

u_per = input('Percent Difference for failed cells: ');

%average calculations
row = 0;
col = 0;
failed = [];
fail_row = [];
fail_col = [];
fail_avg = [];
fail_pd = [];
while row < size(photov_dat, 1) && col < size(photov_dat, 2)
  for row = 1:size(photov_dat, 1)
    for col = 1:size(photov_dat, 2)
      dat_avg = [];
      %for each value around the current number
      for rowshift = -1:1
        for colshift = -1:1
          %checking if indices are within bounds
          if row + rowshift > size(photov_dat, 1)
            rowshift1 = rowshift - 1;
            %continue;
          elseif row + rowshift < 1
            rowshift1 = rowshift + 1;
            %continue;
          else
            rowshift1 = rowshift;
          end
          if col + colshift > size(photov_dat, 2)
            colshift1 = colshift - 1;
            %continue;
          elseif col + colshift < 1
            colshift1 = colshift + 1;
            %continue;
          else
            colshift1 = colshift;
          end
          if photov_dat(row+rowshift1, col+colshift1) ~= photov_dat(row, col) %&& row+rowshift1 ~= row && col+colshift1 ~= col
            dat_ext = photov_dat(row+rowshift1, col+colshift1);
            dat_avg = [dat_avg dat_ext];
          end
        end
        p_diff = abs((mean(dat_avg)-photov_dat(row, col))/((mean(dat_avg)+photov_dat(row,col))/2))*100;
      end
        if p_diff > u_per
          %concatenating all data for later processing/output
          fail_row = [fail_row row];
          fail_col = [fail_col col];
          fail_avg = [fail_avg mean(dat_avg)];
          fail_pd = [fail_pd p_diff];
          failed = [failed photov_dat(row, col)];
        end
    end
  end
end

fprintf('Row\tCol\tPV Cell\tAvg around PV\t%% Diff\n');
for curr = 1:length(fail_row)
  fprintf('%0.0f\t%0.0f\t%0.0f\t\t%0.2f\t\t\t%0.2f\n', fail_row(curr), fail_col(curr), failed(curr), fail_avg(curr), fail_pd(curr));
end

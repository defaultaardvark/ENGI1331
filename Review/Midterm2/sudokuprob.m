clc
clear

sud = csvread('Sudoku.csv');

sudsum = 45;

inc = 3;
curr = inc;
for row = 1:size(sud,1)
  if sum(sud(curr,:)) == sudsum
  for col = 1:size(1,sud)
    if sum(sud(:,curr)) == sudsum
      incstart = curr-inc;
      if incstart == 0
        incstart = 1;
      end
      for incrow = incstart:curr

    end
  end
end

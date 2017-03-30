clc
clear

a = input('Input matrix of any size: ');

[row col] = size(a);

acol = [];
for currcol = 1:col
  rowvec = [];
  for currrow = 1:row
    rowvec = [rowvec a(currrow, currcol)];
  end
  acol = [acol; rowvec'];
end

disp(acol);

ind = row*col;
acolind = [];
for curr = 1:ind
  acolind = [acolind a(curr)];
end
disp(acolind');

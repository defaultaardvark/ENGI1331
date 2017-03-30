clc
clear

dat_mat = input('Input Matrix: ');

dat_max = 0;
for row = 1:size(dat_mat, 1)
  for col = 1:size(dat_mat, 2)
    if dat_mat(row, col) > dat_max
      dat_row = row;
      dat_col = col;
      dat_max = dat_mat(row, col);
    end
  end
end

disp(row);
disp(col);
disp(dat_max);

%% Ravi Namuduri 1543511 TTh 2:30-4

%problem 2
%find overall minimum and maximum of input matrix

clc
clear

mat_dat = input('Input Matrix: ');

row1 = size(mat_dat,1);
col1 = size(mat_dat,2);

mat_max = 0;
for row = 1:row1
  for col = 1:col1
    %if count gets to end of row, exit loop and proceed to next row. Not sure if necessary in this situation, but it works.
    if col+1 > col1
      break;
    %if compared value is larger than next value && saved value, replace saved value
    elseif mat_dat(row, col) > mat_dat (row, col+1) && mat_dat(row, col) > mat_max
      max_row = row;
      max_col = col;
      mat_max = mat_dat(row, col);
    end
  end
end

%all comments above apply in same place here, but for Minimum
mat_min = 0;
for row = 1:row1
  for col = 1:col1
    if col+1 > col1
      break;
    elseif mat_dat(row, col) < mat_dat (row, col+1) && mat_dat(row, col) < mat_min
      min_row = row;
      min_col = col;
      mat_min = mat_dat(row, col);
    end
  end
end

fprintf('Overall Minimum at (%d, %d): %0.2f\n', min_row, min_col, mat_min);
fprintf('Overall Maximum at (%d, %d): %0.2f\n', max_row, max_col, mat_max);

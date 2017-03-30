%% Ravi Namuduri 1543511 TTh 2:30-4

%problem 1
%Flip any input matrix from left to right

clc
clear

mat_dat = input('Input matrix: ');

%matrix for modifying
mat_new = mat_dat;

[row col] = size(mat_dat);
for row1 = 1:row
  for col1 = 1:col
    %swap compared values in matrix
    mat_new(row1, col1) = mat_dat(row1, col);
    %reduce column count by 1 so swapping won't exceed halfway
    col = col-1;
  end
   col = size(mat_dat,2);
end
disp(mat_new);

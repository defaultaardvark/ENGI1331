clc
clear

A = [1 2 3; 4 5 6; 7 8 9];

A_size = zeros(size(A));
i = 0;
while i < length(A_size)
  i = i + 1;
  j = 0;
  while j < length(A_size)
    j = j + 1;
    B = A;
    B(i,:) = [];
    B(:,j) = [];
    A_size(i,j) = det(B);
  end
end
A_cof = det(A_size);

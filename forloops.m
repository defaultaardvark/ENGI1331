%% Ravi Namuduri 1543511  ENGI 1331
% for loop example

clc
clear

A = [1 54 8 2 4 6 4];
B = [2 5 8 5 1 10 3];

if length(A) ~= length(B)
  error('Vectors must be of same length. Terminating program');
end

%find the number of rows and columns of the Vectors

[rA, cA] = size(A);
[rB, cB] = size(B);

if (rA == 1 || cA == 1) && (rB == 1 || cB == 1)
else
  error('Inputs are not vectors. Terminating program');
end

C = [];
for curr = 1:3:length(A)
if A(curr) == B(curr)
  C = [C 0];
elseif A(curr) - B(curr) > 0
  C = [C 1];
elseif A(curr) - B(curr) < 0
  C = [C -1];
end
end

% How many values are the same between the two vectors?
% Count the number of zeros in the final vector

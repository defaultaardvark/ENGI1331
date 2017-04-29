function [D_val] = CircuitSolver(v2, v1, r1, r2, r3)

% syms x y
% eqns = [x*r1 + x*r3 + y*r3 == v1; x*r3 + y*r3 + y*r2 == v2];
% s = solve(eqns, [x y]);
% i3 = s.x + s.y;
% i1 = s.x;
% i2 = s.y;
%
% i1 = double(i1);
% i2 = double(i2);
% i3 = double(i3);

%cramer's rule
eq = [(r1+r3) r3; r3 (r3+r2)];
sol = [v1; v2];

%takes determinant of coefficient matrix
D = det(eq);

%calculates determinant of matrix when x and y column are replaced with answer column vector and stores it in another column vector
D_val = [];
for curr = 1:size(eq, 2)
  mat = eq; %< gets equation matrix for manipulation
  mat(:,curr) = sol; %< replaces corresponding column with solution vector
  D_sub = det(mat)/D; %< divides determinant of resulting matrix by the original determinant (this solves for the corresponding x or y value, or in this case, the currents I1 and I2)
  D_val = [D_val; D_sub]; %< stores currents 1 and 2
end

D_val = [D_val; D_val(1)+D_val(2)]; %< I1 + I2 = I3

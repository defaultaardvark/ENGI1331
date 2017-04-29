function [I_val,V2New] = CircuitSolver(v2, v1, r1, r2, r3,R3New)

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
I_val = [];
for curr = 1:size(eq, 2)
  mat = eq; %< gets equation matrix for manipulation
  mat(:,curr) = sol; %< replaces corresponding column with solution vector
  I_sub = det(mat)/D; %< divides determinant of resulting matrix by the original determinant (this solves for the corresponding x or y value, or in this case, the currents I1 and I2)
  I_val = [I_val; I_sub]; %< stores currents 1 and 2
end

I_val = [I_val; I_val(1)+I_val(2)]; %< I1 + I2 = I3

% Calculating a new V2 with a new R3
V2Cal = ((I_val(1) + I_val(2))* R3New) +((I_val(2) * r2)); % Calculates V2 from new R3 values from for loop and outputs it to the main script
V2New = V2Cal;
end


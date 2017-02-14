%{
%tolerance creation
if y-(3.2*x)/1.6 < 0.001
  fprintf('yes')
end

strcmp
strcmpi

%% Ravi Namuduri 1543511 ENGI1331 Masking

clear
clc

A = [2 3 4; 6 2 4; 9 2 5];

%logical matrix for masking
mask = A > 4;
% ^ produces boolean matrix for condition A > 4

%A mask is a logical type matrix which tells you when a certain condition is met.
% in this case when an element of A is greater than 4

%NOTE: namind the logical matrix 'mask' is just convention.
%you do not have to name your logical matrix 'mask'.
%use 'mask' to make it easier for the TAs to grade.

A(mask); % <-- extracts all elements from original matrix that satisfy the condition A > 4
% returns a column matrix

A(mask) = 3; % <-- replaces all values in column matrix of mask with a different value

A;

%%

clear
clc

%replacing certain elements in matrix B with the corresponding elements in matrix C
B = [5 10 15; 20 25 30; 35 40 45];
C = [7 8 9; 1 3 0; 10 12 2];

mask = B < 30;

B(mask) = C(mask)
%}

%%

clear
clc

age1min = 15;
age1max = 19;
age2min = 20;
age2max = 24;
sp1max = 120;
dp1max = 81;
sp2max = 132;
dp2max = 83;

age = input('Enter age (15-24): ');

if age < age1min || age > age2max
  error('Age outside limit. Do not use this.');
else
  sp = input('Enter systolic pressure: ');
  dp = input('Enter diastolic pressure: ');
  if age < age2max
    if sp > sp1max
      fprintf('You have high blood pressure.');
    else
      fprintf('You have normal blood pressure.');
    end
  else
    if sp > sp2max
      fprintf('You have high blood pressure.');
    else
      if dp > dp2max
        fprintf('You have high blood pressure.');
      else
        fprintf('You have normal blood pressure');
      end
    end
  end
end

%seriously? You couldn't come up with an algorithm of your own?

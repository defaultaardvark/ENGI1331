
clc
clear
close all

%create a simple phase diagram, with 2 phases
% one above the curve y = Ax^2 + Bx + C (upper phase)
%one below the cuve (lower phase)

%with the following coefficients

A = -1;
B = 5;
C = -2;

%creata user defined function for the equation
x = [0:0.1:5];
y = fun(x,A,B,C);

figure
plot(x,y)
axis([0 5 0 5]);
grid on

%need to know the zeros of the function
%split up the range 0<x<5 using fminbnd

%fminbnd finds a local minimum of a decreasing function
%since the function is increasing, in the range 0<x<5, we can find the minimum of the negative of the function

x_min = fminbnd(@(x) -fun(x,A,B,C), 0 ,5);
x_max = x_min

z1 = fzero(@(x) fun(x,A,B,C), [0 x_max]);
z2 = fzero(@(x) fun(x,A,B,C), [x_max 5]);

%tell the user to input a point
test = 0;
while size(test, 2) ~= 2
  test = input('Enter a point on the phase diagram [x,y]: ');
end
while test(1) < 0 || test(1) > 5 || test(2) < 0 || test(2) > 5
  test = input('Enter x and y values between 0 and 5: ');
end

%we know that for our test point to be in the upper phase, test(1) < z1 or test(1) > z2
if test(1) < z1 || test(1) > z2
  fprintf ('\nThe point is in the upper phase');
else
  %when test(1) is between z1 and z2, we need to compare test(2) to the value of the function at test(1)
  y_curve = fun(test(1), A, B, C);
  if test(2) > y_curve
    fprintf('\nThe point is in the upper phase');
  else
    fprintf('\nThe point is in the lower phase');
  end
end

hold on
plot(test(1), test(2), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 10);

%what phase do points on the curve go to?
% you sometimes have the choice to decide what to do with points on the curve (either upper phase or lower phase)
%make sure you are always consistent with your choice throughout the entire phase diagram

if

else

end
% ^ loop statements in matlab

% > - greater than
% < - less than
% >= - greater than or equal to
% <= - less than or equal to
% == - equal to
% ~= - not equal to
% && - AND
% || - OR
% ~ - NOT

%can write elseif statements within larger elseif statements

if x < 2000
  flow = laminar;
elseif x > 10000
  flow = turbulent;
else
  flow = transitional;
end
fprintf('The flow is %s.',flow,'s');

%errors
x = input('Enter a number between 0 and 100: ');
if x > 100 || x < 0
  error('Value outside of range. Program terminated.');
end

%warnings
T = input('Enter a temperature [K]: ');
if T < 0
  warning('Value below 0. Using absolute value.')
  TC = abs(T)-273;
else
  TC = T-273;
end

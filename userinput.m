%% User input
clc
clear

%What is the user entering?
%What do you need to get from the user?

%Case 1: I want the user to enter a number value
%Always remember to suppress the input Statement

% r = input('Enter the radius of the cylinder (cm): ');


% Case 2: I want the user to enter a text value
% ONly use 's' when we want to enter a string ('s' indicates the string datatype for inputs)

%name = input('Enter your name: ', 's');
%name2 = input ('Enter your technician''s name: ', 's');

% Case 3: I want the user to select from a set of options
% menu commands

%option = menu('Please select from the options given:', 'Fish', 'Chicken', 'Steak', 'Ice Cream');
% The value of the option would store in the variable, not the name of the menu entry

% fprintf = produces a formatted output on the console

%%  Basic formatted outputs

clc
clear

a = input('Enter the value of a: ');
b = input('Enter the value of b: ');
p = a/b;

c = input('Enter the value of c: ');
q = b/c;

% fprintf formatting options
% %f = floating point
% fprintf('The value of p is %0.3f. \n', p);
% fprintf('The value of q is %0.1e \n', q);
%
% name = input('What is your name: ');
% fprintf('Your name is %s \n', name);

% \n = linebreak ; \t = tab
fprintf('\nVariable\tValue');
fprintf('\np\t\t\t%0.3f', p);
fprintf('\nq\t\t\t%0.3f', q);

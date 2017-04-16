%Functions take values, process them, and output them back to the main script
%must be stored as .m file in the same root directory as the main script

function[output_var] = function_name(input_var);

%clc and clear don't work in functions. Do not add

All variables in the input parameter list must be defined in the program
All variables in the output parameter list must be defined in the function

The variable names in the program and the function do not need to match; value is determined by input order position

[x,y] = fn_name(a,b,c)
function[w,z] = fn_ame(e,f,g)
^these two functions are the same(?)

%% function header for the program
function[d, h, power] = Review_F(mass,time);

%% Line in main program
[y,z] = Calc_Temp(t,x);

%% main program 1
clc
clear
close all

%calculate the volume and surface area of a cylinder in m^3 and m^2 given radius and height in cm
%inputs
r = 3; %[cm]
h = 4; %[cm]

%converts units to [m]
[r_m] = mconv(r);
[h_m] = mconv(h);
[v,sa] = cylcal(r_m,h_m);

fprintf('The volume is %0.3e m^3\n',v);
fprintf('The surface area is %0.3e m^2\n',sa);

%% fn 1 (mconv.m)
function[val2] = mconv(val1)
val2 = val1/100;
end

% program passes the input variables r and h
% function returns the variables r_m and h_m

% calculate volume and surface area uising a user defined function
%% cylcal.m
function[vol, s_area] = cylcal(q1,q2)
vol = pi* q1^2 * q2;
s_area = 2*pi*q1^2 + 2*pi*q1*q2;
end

%%more functions in matlab
a function can take another function as an argument by using a special @ notation
f() and g()
f(@g,...);

fzero() %<finds a zero of a function
x = fzero(@fname,x0);
x0 = starting point for function to begin searching
[xL xR] x value range with fname(xL) being opposite in sign from fname(xR)
@fname, x0, [], p1, p2,...)
p1 and p2 are additional variables required by fname

fminbnd() %finds min of a function
quad()
integral()
--------------------------------------------------------------------------------
%% intersection of curves
clc
clear
close all

x = [-2:.01:2];

[y] = f(x);
[z] = g(x);
figure
plot(x,y);
hold on
plot(x,z);

[w] = h(x);
[x1] = fzero(@h,-1.5);

%function (f)
function[y] = f(x)
y = x.^2 - 1;
end

%function (g)
function[z] = f(x)
z = exp(x/5);
end

%function (h)
function[w] = h(x)
w = f(x) - g(x);
end

%% integration
%find area under a straight line
m = 5;
b = 7;

%option 1
t1 = @(t)m.*t+b;
[int1] = integral(t1,0,50); %interval of 0 to 50

%option 2
[int2] = integral(@(t)m.*t+b,0,50);

%option 3
[int3] = my_int(m,b);
%% function my_int
function[value] = my_int(m,b)
y = @(t)m.*t+b;
value = integral(y,0,50);
end

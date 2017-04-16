%% Ravi Namuduri 1543511 TTh 2:30-4

clc
clear
close all

a_dat = csvread('area_data.csv');
a = a_dat(:,1);
b = a_dat(:,2);
c = a_dat(:,3);
m = a_dat(:,4);
n = a_dat(:,5);
z = a_dat(:,6);
w = a_dat(:,7);

%y1, y2, y3
%program works under the assumption that fn1 is a parabola and fn2 and fn3 are lines
a_inc = input('Increment value for area: ');

fprintf('\tArea Fn2\tLH\t\tRH\t\tMP\t\tArea Fn3\tLH\t\tRH\t\tMP\t\tLeft Edge\tRight Edge\n');
for curr = 1:size(a_dat,1)
  [a2, a3, l2, l3, r2, r3, int2, int3, ly, ry] = Compute_area(a(curr),b(curr),c(curr),m(curr),n(curr),z(curr),w(curr),a_inc);
  fprintf('\t%0.2f\t\t%0.2f\t%0.2f\t%0.2f\t%0.2f\t\t%0.2f\t%0.2f\t%0.2f\t\t%s\t\t%s\n', int2, l2, r2, a2, int3, l3, r3, a3, ly, ry);
end

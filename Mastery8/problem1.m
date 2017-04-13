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

%a_inc = input('Increment value for area: ');

cnt = 0;
z_1 = [];
while cnt ~= 2 && y1 == 0
  ext = 1;
  for curr = 0:0.01:ext
    [y1] = fn1(a,b,c,curr)
    if y1 == 0
      z_1 = [z_1 curr];
      break;
    end
    ext = ext + 1;
  end
  cnt = cnt + 1;
end

%[y1] = fn1(a,b,c);
%[y2] = fn2(m,n);
%[y3] = fn3(z,w);

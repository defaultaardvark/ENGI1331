%% Ravi Namuduri 1543511 ENGI 1331 TTh 2:30-4

% problem 1

%problem statement: Import data from an external file that has data concerning
% the height a projectile with varying mass was launched and how much time it spent
% in the air. Convert each set of values to SI units. Then, combine the sets
% of data and find the number of observations, average mass [g], average potential
% energy [J], and average power [W].
% In addition, extract the minimum height launched and its corresponding
% height and time spent in the air.
% Output this data into another file.

clear
clc

data1 = csvread('Problem1_data1.csv'); %row 1: mass[g]; row 2: height[ft]; row 3: time[min]
data2 = csvread('Problem1_data2.csv'); %row 1: mass[lb m]; row 2: height[cm]; row 3: time[h] <-- who does this?

%data1 conversions
data1_h = (1/3.28)*data1(2,:); % ft --> m
data1_t = (60)*data1(3,:); % min --> s

%data2 conversions
data2_m = (1/2.205)*1000*data2(1,:); % lb m --> g
data2_h = (1/100)*data2(2,:); % cm --> m
data2_t = (3600)*data2(3,:); % h --> s

data1_new = [data1(1,:); data1_h; data1_t];
data2_new = [data2_m; data2_h; data2_t];

data_new = [data1_new data2_new];
[mass_min, min_col] = min(data_new(1,:));
new_length = length(data_new(1,:));

PE_min = data_new(1,min_col)*data_new(2,min_col)*(9.81/1000);
power_min = PE_min/(data_new(3,min_col));

mass_avg = (sum(data_new(1,:)))/(new_length);
height_avg = (sum(data_new(2,:)))/(new_length);
time_avg = (sum(data_new(3,:)))/(new_length);


PE_avg1 = [];
for curr_col = 1:new_length
  PE = data_new(1,curr_col)*data_new(2,curr_col)*(9.81/1000);
  PE_avg1 = [PE_avg1 PE];
end
PE_avg = sum(PE_avg1)/new_length;

power_avg1 = PE_avg1./data_new(3,:);
power_avg = sum(power_avg1)/new_length;

data_out = [data_new(1,:).' PE_avg1.' power_avg1.'];
csvwrite('Problem1_results.csv',data_out);

fprintf('\nThe total number of combined observations record is %0.0f.\n',new_length);
fprintf('\nThe minimum mass recorded was %0.1f [g].',mass_min);
fprintf('\nIt had a potential energy of %0.3f [J] and a power of %0.3f [W].\n',PE_min,power_min);
fprintf('\nThe average mass [g] record is: %0.1f',mass_avg);
fprintf('\nThe average potential energy [J] calculated is: %0.1f',PE_avg);
fprintf('\nThe average power [W] record is: %0.1f\n',power_avg);

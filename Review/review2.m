clc
clear

M1 = csvread('Problem1_M1_test.csv'); %3x5 [g],[ft],[min]
M2 = csvread('Problem1_M2_test.csv'); %3x3 [kg],[in],[s]

mask = [M1 M2] < 0;
neg_count = sum(sum(mask));

M1_pos = abs(M1);
M2_pos = abs(M2);

M1_pos(1,:) = M1_pos(1,:)/1000;
M1_pos(2,:) = ((M1_pos(2,:)/12)*2.54)/1000;
M1_pos(3,:) = M1_pos(3,:)/60;

M2_pos(2,:) = (M2_pos(2,:)*2.54)/1000;

M3 = [M1_pos M2_pos];
M3_PE = (M3(1,:).*M3(2,:))*9.81;
M3_power = M3_PE./M3(3,:);
M3(2,:) = M3_PE;
M3(3,:) = M3_power;

mMax = find(max(M3(1,:)) == M3(1,:));

csvwrite('reviewProblem1', M3);

fprintf('Negative results were detected: %0.0f times\n',neg_count);
fprintf('Total number of observations was: %0.0f\n',length(M3(1,:)));
fprintf('Highest mass: %0.2f\n', max(M3(1,mMax)));
fprintf('Corresponding Potential Energy: %0.4f\n', 10*M3(2,mMax));
fprintf('Corresponding Power: %0.4f\n', 10*M3(3,mMax));

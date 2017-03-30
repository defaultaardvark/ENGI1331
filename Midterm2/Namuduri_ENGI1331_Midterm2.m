%% Part II - Midterm 2
% Name: Ravi Namuduri
% Cougarnet Username: rnamudur
% Student ID: 1543511
% Class Time: TTh 2:30 - 4

clc
clear

Velocity = csvread('Midterm2.csv');

[v_row v_col] = size(Velocity);

for i = 1:v_row
    for j = 1:v_col
        if Velocity(i,j) <= 0
            reptxt = sprintf('Replace cell (%0.0f, %0.0f) with a value greater than zero: ', i, j);
            replace = input(reptxt);
        end
    end
end

Vel_limit = input('Enter a maximum allowable limit for velocity in m/s: ');
while Vel_limit >= 15000
    limtxt = sprintf('Limit too high. Please enter lower limit in m/s: ');
    Vel_limit = input(limtxt);
end
while Vel_limit <= 13500
    limtxt = sprintf('Limit too low. Please enter higher limit in m/s: ');
    Vel_limit = input(limtxt);
end

iinf = [];
jinf = [];
Changes = 0;
for i = 1:v_row
    for j = 1:v_col
        if Velocity(i,j) > Vel_limit
            Velocity(i,j) = Vel_limit;
            iinf = [iinf i];
            jinf = [jinf j];
            Changes = Changes + 1;
        end
    end
end
Velinfo = [iinf; jinf];
% for i = 1:size(iinf, 1)
%     for j = 1:size(jinf, 2)
%         iinft(j,i) = iinf(i,j);
%         jinft(j,i) = jinf(i,j);
%     end
% end
% Velinfo = [iinft jinft];

fprintf('The number of changes made were %0.0f.\n', Changes);

fprintf('Row#\tCol#\n');
i = 1;
j = 1;
while i <= size(iinf,2)
        fprintf('%0.0f\t\t%0.0f\n', iinf(i), jinf(j));    % ask if this is considered implicit loop
        i = i+1;
        j = j+1;
end

SortCol = input('Enter column number to be sorted: ');
while SortCol < 1 || SortCol > size(Velocity, 2);
    fprintf('Column not within range.');
    SortCol = input('Enter column number to be sorted: ');
end

VelCol = [];
for i = 1:v_row
    VelCol = [VelCol Velocity(i,SortCol)];
end

%bubble sort
i = 1;
SortedVelocity = VelCol;
count = size(VelCol, 2);
while count >= 0
    if SortedVelocity(i) > SortedVelocity(i+1)
        comp = SortedVelocity(i);
        SortedVelocity(i) = SortedVelocity(i+1);
        SortedVelocity(i+1) = comp;
        i = i + 1;
    elseif SortedVelocity(i) < SortedVelocity(i+1)
        count - 1;
    end
    if i == size(VelCol, 2)-1
        i = 1;
        count = size(VelCol, 2);
    end
end

fprintf('Column %0.0f before sorting\tColumn %0.0f after sorting', SortCol, SortCol);
i = 1;
j = 1;
while i <= size(VelCol, 2)
    fprintf('\n%0.0f\t\t\t\t%0.0f',VelCol,SortedVelocity);
    i = i + 1;
    j = j + 1;
end

NormVelocity = [];
for i = 1:size(SortedVelocity, 1)
    normvel = (SortedVelocity(i)-SortedVelocity(1))/(SortedVelocity(size(SortedVelocity,1))-SortedVelocity(1));
    NormVelocity = [NormVelocity normvel];
end

csvwrite('NormVelocity.csv',NormVelocity);
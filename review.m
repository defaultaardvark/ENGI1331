CA = {'Luke' [3 2 0 6] 8 {'Skywalker','Jedi'}};

% to get Luke
CA{1}; % returns contents

% to get 'Luke'
CA(1); % returns datatype

% to get 2
CA{2}(1,2);

% to get Jedi
CA{4}{2};

fprintf('The person''s name is %s',CA{1});
% The person's name is Luke.

fprintf('The names of the people are %%%s.',CA);

[value, row_index] = min(B,[],1); % <-- will return the minimum value in each column
%goes by rows

[value, column_index] = min(B,[],2); % <-- will return the minimum value in each row
%goes by columns

[rows, columns] = find(A == min(min(A)))
% finds the index of the overall minimum

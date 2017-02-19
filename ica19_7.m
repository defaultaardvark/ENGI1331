clc
clear

status = menu('ClassStanding','Freshman','Sophomore','Junior','Senior');

if status == 1
  fprintf('You are a new student\n');
elseif status > 1
  fprintf('You are a continuing student\n');
else
  error('You did not make a selection');
end

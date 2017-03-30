clc
clear

run = menu('Car is running','Yes','No');
drive = menu('Car is in drive','Yes','No');
on = menu('Car has been driving for more than 10 seconds','Yes','No');
seat = menu('There is someone sitting in the seat','Yes','No');

if run == 0 || drive == 0 || on == 0 || seat == 0
  error('Missed a selection. Terminating.');
elseif (run + drive + on + seat == 4) && run ~= 0 && drive ~= 0 && on ~= 0 && seat ~= 0
  activated = 'is';
else
  activated = 'is not';
end

fprintf('The car alarm %s activated.',activated);

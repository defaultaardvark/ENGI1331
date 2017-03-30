clc
clear all

again = 1;
while again == 1

  v = input('\n\nEnter a vector of values');
  c = 1;
  fprintf('Location 1\tLocation 2\tPercent Diff');
  for i = 1:size(v,2)
    if i == size(v,2)
        break;
    end
    Pdiff = abs((v(i)-v(i+1))/v(i));
    if Pdiff < 0.01
      Loc1(c) = i;
      Loc2(c) = i+1;
      PercentDiff(c) = Pdiff;
      fprintf('\n%0.0f\t\t%0.0f\t\t%0.3f',Loc1(c),Loc2(c),PercentDiff(c));
    end
  end

  again = menu('Do you want to repeat the program?','Yes','No');
end

%error 1
% again = 1;
%error 2
% for i = length(v)-1
%error 3
% PDiff = abs(v(i) - v(i+1))/(v(i));
%error 4
% if PDiff < 0.01
%error 5
% c = c+1; <- in last line of if statement
%error 6
% for i = 1:c-1
%error 7
% all variables in fprintf should have i as index, not c
%error 8
% again = menu('Would you like to go again?', 'Yes','No');

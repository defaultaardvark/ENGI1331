%% Ravi Namuduri 1543511 ENGI 1331 TTh 2:30 - 4

%problem 2

%allow the user to choose if they have a resistance in ohms or in color code.
% then convert the selected input to the other; e.g. if given in ohms, return
% color code, and vice versa.

clear
clc

load('P2_ColorGuide.mat');

resist = menu('Color Code or Resistance', 'Color Code', 'Resistance');

if resist == 1


elseif resist == 2
  ohms = input('Enter resistance in ohms as vector: ');
  if ohms(1, 3:length(ohms)) ~= 0
    error('Invalid resistance. Terminating');
  else
    color1 = cell((length(ohms)):0);
    for dig1 = 1:2
      color1{dig1} = [ColorCode{1,(ohms(1,dig1)+1)} dig1];
    end
    mult = length(ohms(1,:))-2;
      color1{mult} = [Multiplier{1,mult} mult];
  end


else
  error('No choice made. Terminating.');
end

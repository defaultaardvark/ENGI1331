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
  stripes = input('Enter color digits as cell array: ');
  colors = [];
  curr = 1;
  for curr = 1:length(stripes)
    if curr ~= length(stripes)
      for dig1 = 1:length(ColorCode)
        if strcmpi(stripes{curr}, ColorCode{1,dig1}) == 1
          colors = [colors dig1-1];
        else
        end
      end
    elseif curr == length(stripes)
      for digmult = 1:length(Multiplier)
        if strcmpi(stripes{curr}, Multiplier{1,digmult}) == 1
          fill = zeros(1,digmult-1);
          colors = [colors fill];
        else
        end
      end
    end
  end
  fprintf('Resistance [ohms]: ');
  fprintf('%0.0f\t',colors);
  fprintf('\n');
elseif resist == 2
  ohms = input('Enter resistance in ohms as vector: ');
  if ohms(1, 3:length(ohms)) ~= 0
    error('Invalid resistance. Terminating');
  else
    color1 = cell(2:0);
    for dig1 = 1:2
      color1{dig1} = [ColorCode{1,(ohms(1,dig1)+1)} dig1];
    end
    color2 = cell(1:0);
    mult = length(ohms(1,:))-1;
      color2{mult} = [Multiplier{1,mult} mult];
    color3 = {color1{:} color2{length(color2)}};
  end
  fprintf('Color Code: ');
  fprintf('%s\t',color3{1,:});
  fprintf('\n');
else
  error('No choice made. Terminating.');
end

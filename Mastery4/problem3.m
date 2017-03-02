%% Ravi Namuduri 1543511 ENGI 1331 TTh 2:30 - 4

%problem 2

%allow the user to choose if they have a resistance in ohms or in color code.
% then convert the selected input to the other; e.g. if given in ohms, return
% color code, and vice versa.

clear
clc

load('P2_ColorGuide.mat');

again = 1;
lockstri = 1;
while again == 1
  resist = menu('Color Code or Resistance', 'Color Code', 'Resistance');
  if resist == 1
  tries = 1;
  lockstri = 1;
  while lockstri == 1
    stripes = input('Enter color digits as cell array: ');
    if length(stripes) == 3
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
      if colors(1,1) == 0
        colors = colors(1,2:length(colors));
      else
      end
      fprintf('Resistance [ohms]: ');
      fprintf('%0.0f\t',colors);
      fprintf('\n');
      lockstri = 0;
      again = menu('Again?', 'Yes', 'No');
    elseif tries == 4
      fprintf('Please stop. This is going nowhere.\n');
      tries = 1;
      lockstri = 0;
    elseif length(stripes) ~= 3
      fprintf('Incorrect number of colors. Please try again.\n');
      tries = tries + 1;
    end
  end
  elseif resist == 2
    locknum = 1;
    again2 = 1;
    ohms = input('Enter resistance in ohms as vector: ');
    while locknum == 1;
      if again2 == 4
        warning('Please stop. This is going nowhere.');
        fprintf('Assuming zero for all values after second position.\n');
        ohms(1,3:length(ohms)) = 0;
      else
      end
      if isequal(ohms(1, 3:length(ohms)), zeros(1,length(ohms(3:length(ohms))))) ~= 1;
        ohms = input('Invalid resistance. Please enter resistance again: ');
        again2 = again2 + 1;
      else
        color1 = cell(2:0);
        for dig1 = 1:2
          color1{dig1} = [ColorCode{1,(ohms(1,dig1)+1)} dig1];
        end
        color2 = cell(1:0);
        mult = length(ohms(1,:))-1;
        color2{mult} = [Multiplier{1,mult} mult];
        color3 = {color1{:} color2{length(color2)}};
        locknum = 0;
      end
      end
      fprintf('Color Code: ');
      fprintf('%s\t',color3{1,:});
      fprintf('\n');
      locknum = 0;
      again = menu('Again?', 'Yes', 'No');
    else
      error('No choice made. Terminating.');
  end
end

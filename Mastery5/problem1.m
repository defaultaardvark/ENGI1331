%% Ravi Namuduri 1543511 ENGI 1331 TTh 2:30 - 4

% problem 1

clc
clear

again = 1;
while again == 1
line = menu('Resistance in Parallel or Series?','Parallel','Series');
resist = input('Input resistances [ohms] as vector: ');
fprintf('Resistances entered are ');
fprintf('%0.0f,',resist(1:length(resist)-1));
fprintf(' and %0.0f ohms.',resist(length(resist)));
  if line == 1
    total = [];
    for curr = 1:length(resist)
      total = [total 1/resist(curr)];
    end
    equiv = (sum(total))^(-1);
  elseif line == 2
    total = [];
    for curr = 1:length(resist)
      total = [total resist(curr)];
    end
    equiv = sum(total);
  else
    again = menu('Line type not recognized. Again?','Yes','No');
  end
fprintf('\n\nEquivalent resistance: %0.0f ohms',equiv);
again = menu('Would you like to enter another data set?','Yes','No');
end

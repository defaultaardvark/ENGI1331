%% Ravi Namuduri 1543511 ENGI 1331 TTh 2:30 - 4

%problem 1

%Problem statement: determine whether the motor is enabled or disabled based on the
% state of the lawnmower switches

%input variables
%brake = brake (on/off)
%seat = operator seat switch (seated/Not-seated)
%blade = blade power switch (turning/off)
%leftbar = left guide bar neutral switch (neutral, forward, backward)
%rightbar = right guide bar neutral switch (neutral, forward, backward)
%ignition = ignition switch (run, off)

%output variables
%state = state of motor after switch input (enabled, disabled)

%housekeeping
clear
clc

%menu inputs
brake = menu('Brake Switch', 'On', 'Off');
seat = menu('Operator Seat Switch', 'Seated', 'Not-seated');
blade = menu('Blade Power Switch', 'Turning', 'Off');
leftbar = menu('Left Guide Bar Neutral Switch', 'Neutral', 'Forward', 'Back');
rightbar = menu('Right Guide Bar Neutral Switch', 'Neutral', 'Forward', 'Back');
ignition = menu('Ignition Switch', 'Run', 'Off');

%calculations

%if there is no input for any choice
if brake == 0 || seat == 0 || blade == 0 || leftbar == 0 || rightbar == 0 || ignition == 0
  fprintf('Missed selection. Unable to determine motor state.\n');
%pass input presence check
else
%ignition is primary check
  if ignition == 1
    if brake == 2
      if leftbar ~= 1 || rightbar ~= 1 || blade == 1 && seat == 2
        state = 'disabled';
      elseif leftbar ~= 1 || rightbar ~= 1 || blade == 1 && seat == 1
        state = 'enabled';
      end
    else
      if leftbar ~= 1 || rightbar ~= 1 || blade == 1 && seat == 2
        state = 'disabled';
      elseif leftbar == 1 && rightbar == 1 || blade == 1 && seat == 1
        state = 'enabled';
      end
    end
  else
    state = 'disabled';
  end
%output
  fprintf('Motor should be %s.\n',state);
end

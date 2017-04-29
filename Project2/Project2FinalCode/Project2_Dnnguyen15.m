%% Project 2 Danny Nguyen Ravi Namuduri Joshua Tran ENGI 1331

clc
clear
close all

% TASK 1
R3New = [];
[v1, v2, r1, r2, r3] = VR();
%  [v1, v2, r1, r2, r3] = VR1();
[I_val] = CircuitSolver(v2, v1, r1, r2, r3, R3New);
Voltage = {v1;v2;' '}; % Puts voltage in cell array
Resistance = {r1;r2;r3}; % Puts resistances in cell array
Current = {I_val(1);I_val(2);I_val(3)}; % Puts all calculated I values in a cell array.

Values = table(Voltage,Resistance,Current); % Puts a table together
disp(Values) % Displays table

% TASK 2
%calculates the min and max of v2 that yields values right before I1 becomes either negative or greater than 1 amp
%in this case, rad stands for extreme.
rad_volt = [];
corr_volt = []; %< corrected voltage and corresponding current (voltage right before current exceeds limit)
for curr = 1:-2:-1 %< counts up first and then counts down
  rad = [0.5; 0.5];
  v_2 = v2;
  while rad(1) > 0 && rad(1) < 1 %< upper and lower bound check (current greater than 1/less than 0)
    v_2 = v_2 + curr*1; %< voltage increment/decrement
    rad = CircuitSolver(v_2, v1, r1, r2, r3, R3New);
  end
  rad_volt = [rad_volt; v_2 rad(1)]; %< populated with values right after limit is passed
  corr = CircuitSolver(v_2-curr, v1, r1, r2, r3, R3New);
  corr_volt = [corr_volt; (v_2-curr) corr(1)]; %< populated with values just before limit is reached (values obtained from previous line)
end
%comments above apply, since the code is the same. This block just deals with I2 instead of I1
%calculates the min and max of v2 that yields values right before I2 becomes either negative or greater than 1 amp
for curr = 1:-2:-1
  rad = [0.5; 0.5];
  v_2 = v2;
  while rad(2) > 0 && rad(2) < 1
    v_2 = v_2 + curr*1;
    rad = CircuitSolver(v_2, v1, r1, r2, r3,R3New);
  end
  rad_volt = [rad_volt; v_2 rad(2)];
  corr = CircuitSolver(v_2-curr, v1, r1, r2, r3,R3New);
  corr_volt = [corr_volt; (v_2-curr) corr(2)];
end

V2 = {corr_volt(1,1);corr_volt(2,1);corr_volt(3,1);corr_volt(4,1)};
I1_And_I2 = {corr_volt(1,2);corr_volt(2,2);corr_volt(3,2);corr_volt(4,2)};

VoltTable = table(I1_And_I2,V2);
disp(VoltTable)
fprintf('\nThe maximum voltage for V2 is %0.3f before I1 (%0.4f) becomes a negative value.',corr_volt(1),corr_volt(1,2));
fprintf('\nThe minimum voltage for V2 is %0.3f before I1 (%0.4f) becomes greater than 1.',corr_volt(2),corr_volt(2,2));
fprintf('\nThe maximum voltage for V2 is %0.3f before I2 (%0.4f) becomes greater than 1.',corr_volt(3),corr_volt(3,2));
fprintf('\nThe minimum voltage for V2 is %0.3f before I2 (%0.4f) becomes a negative value.\n',corr_volt(4),corr_volt(4,2));

% TASK 3
R3Vals = []; % Stores all R3 values to be extracted later
V2Vals = []; % Stores all calculated V2 values from changed R3 value
Count = 1;
for R3New = 15:1:115
  [I_val,V2New] = CircuitSolver(v2,v1,r1,r2,r3,R3New); % Calls upon function to calculate V2New
  V2Vals(Count) = V2New; % Stores all new V2 values into empty vector
  R3Vals(Count) = R3New; % Stores all R3 values from for loop
  Count = Count + 1;
end


% Plotting:
figure(1)
Scatters = scatter(R3Vals,V2Vals,'ob');
axis([0 max(R3Vals + 5) 0 max(V2Vals + 5)])
grid

% Polyfitting:
PolyValues = polyfit(R3Vals,V2Vals,1);
M = PolyValues(1); % M value from plot
B = PolyValues(2); % B value from plot
PolyX = [0:1:120]; % X variables
PolyLine = (M*PolyX) + B; % Linear line
hold on
plot(PolyX,PolyLine,'-b','LineWidth',2)
hold on
MinPlot = plot(min(R3Vals),min(V2Vals),'xr','MarkerSize',20,'LineWidth',6);
hold on
MaxPlot = plot(max(R3Vals),max(V2Vals),'xg','MarkerSize',20,'LineWidth',6);

% Labels:
xlabel('Resistance [ohms]')
ylabel('Voltage 2 [volts]')
title('Relationship between Voltage 2 and Resistance from 15 ohms to 115 ohms')
legend([MinPlot,MaxPlot],'Minimum Voltage','Maximum Voltage','Location','Best')

Formula = sprintf('Y = %0.3f*R3 + %0.3f',M,B);
text(20,14,Formula,'EdgeColor','b','FontSize',16)

fprintf('\nThe relationship is that whenever you increase the resistance, you increase the voltage.\n');
fprintf('Increase the amount of resistors to optimize the voltage range.\n');

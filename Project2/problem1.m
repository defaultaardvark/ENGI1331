clc
clear
close all

[v1, v2, r1, r2, r3] = VR();
[D_val] = CircuitSolver(v2, v1, r1, r2, r3); %<-does the task1 output

%calculates the min and max of v2 that yields values right before I1 becomes either negative or greater than 1 amp
%in this case, rad stands for extreme. Thought it was funny:P
rad_volt = [];
corr_volt = []; %< corrected voltage and corresponding current (voltage right before current exceeds limit)
for curr = 1:-2:-1 %< counts up first and then counts down
  rad = [0.5; 0.5];
  v_2 = v2;
  while rad(1) > 0 && rad(1) < 1 %< upper and lower bound check (current greater than 1/less than 0)
    v_2 = v_2 + curr*1; %< voltage increment/decrement
    rad = CircuitSolver(v_2, v1, r1, r2, r3);
  end
  rad_volt = [rad_volt; v_2 rad(1)]; %< populated with values right after limit is passed
  corr = CircuitSolver(v_2-curr, v1, r1, r2, r3);
  corr_volt = [corr_volt; (v_2-curr) corr(1)]; %< populated with values just before limit is reached (values obtained from previous line)
end

%comments above apply, since the code is the same. This block just deals with I2 instead of I1
%calculates the min and max of v2 that yields values right before I2 becomes either negative or greater than 1 amp
for curr = 1:-2:-1
  rad = [0.5; 0.5];
  v_2 = v2;
  while rad(2) > 0 && rad(2) < 1
    v_2 = v_2 + curr*1;
    rad = CircuitSolver(v_2, v1, r1, r2, r3);
  end
  rad_volt = [rad_volt; v_2 rad(2)];
  corr = CircuitSolver(v_2-curr, v1, r1, r2, r3);
  corr_volt = [corr_volt; (v_2-curr) corr(2)];
end

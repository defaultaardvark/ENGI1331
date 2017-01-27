clear;
clc;

% Determine the weight of rod when user provides volume
sgrod = 4.7; % no units
gravcall = 1.25; % m/(s^2);

volrod = input('Volume of rod [m^3]: ');
densrod = sgrod * 1000; % kg/(m^3)
massrod = densrod * volrod; % kg

weighrod = massrod * gravcall; % N
weigh2rod = weighrod * 0.225; % pound-force
%weigh2int = int16(weigh2rod); % converts number to 16 bit integer

% fprintf('The weight of the rod is %f pounds-force. \n',weigh2int);
fprintf('The weight of the rod is %0.0f pounds-force. \n',weigh2rod);

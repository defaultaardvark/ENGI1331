%% Example Problem #1: Data Validation
% Ask the user to enter the number of times they have seen their favorite
% movie, using an integer between 0 and 5. Store the result in a variable
% named MovieNumA.

% If the user enters a value less than zero or greater than 5,
% ask the user again until the user enters a valid integer

clc
clear

MovieNumA = input('How many times have you seen your favorite movie?: ');
while MovieNumA < 0 || MovieNumA > 5
    MovieNumA = input('How many times have you seen your favorite movie?: ');
end
fprintf('You have seen your favorite move %0.0f times.',MovieNumA);


%% Example Problem #2: Error Minimization
% The function rand is a built-in function that will return a random number.
% The rand function will generate a random number between 0 and 1 using
% the following syntax:  X = rand; where X is a variable.

% We want to write a program to determine how many times we must run the
% rand function until it generates two random numbers in a row that differ
% by less than 0.1.
% The output of the program should display both random numbers to three decimal
% places and the number of times the code must run.

clc
clear

rand1 = rand;
rand2 = rand;
count = 1;
while (abs(rand1-rand2) > 0.1)
  rand1 = rand;
  rand2 = rand2;
  count = count + 1;
end
fprintf('The two numbers are %0.3f and %0.3f, and it took %0.0f tries to get there.\n',rand1, rand2,count);

%% Example Problem #3: Controls
% Ask the user to enter temperature and pressure readings from a reactor.
% If the temperature is greater than zero but less than 100 degrees
% Celsius [�C] and the pressure is greater than 1 and less than 2
% atmospheres [atm], print "Status: Normal Operation" in the Command
% Window and ask the user using text if they would like to enter another
% set of readings.  If the user responds yes, repeat the user entry.

% If the temperature or pressure readings are outside the normal range,
% print "Status: WARNING! Adjust operating parameters!" in the Command
% Window and ask the user to enter a new set of values.

clc
clear
redo = 'yes';
while strcmpi(redo, 'yes') == 1
  temp = input('Input temp [C]: ');
  pressure = input('Input Pressure [atm]: ');
  while check == 1
  if temp > 0 && temp < 100 && pressure > 1 && pressure < 2
    disp('Status: Normal Operation');
    check = 0;
  elseif temp < 0 || temp > 100 || pressure < 1 || pressure > 2
    disp('Status: Warning! Adjust operating parameters!');
    check = 1;
  end
  redo = input('Again? ','s');
end

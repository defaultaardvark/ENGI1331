%%
% Ravi Namuduri
% 1543511
% TTh 2:30 - 4
% ENGI 1331
% Problem 1
%%
%
%problem statement: Find the energy required to boil a gallon of water [J], the power
% used to do so [W], and the efficiency of the burner [%] given the initial temperature of the water [deg F], amount of time it took to boil [min],
% and rated power of the burner [W].
%
%input variables
% name = name of motor
% fahr = initial room temperature [deg Fahrenheit]
% time = time taken to reach boiling point [min]
% power = rated burner power [W]
%
%output variables
% energy = energy used to heat 1 gallon of water to boiling point [J]
% p_used = power used by the burner to heat the water to boiling point [W]
% effic = efficiency of burner compared to its rated power [%]
%
%intermediate variables
% vol = volume of water [L]
% cels = room temperature [deg Celsius]
% temp = room temperature [Kelvin]
%
%Constants
% gal = initial volume of water [1 gallon]
% Cw = specific heat of water [J/(kg*K)]

%Housekeeping
clear;
clc;

%Constants
gal = 1; %Gallons
Cw = 4184; %J/(kg*K)
vol = (gal/0.264); %density of water = 1000 kg/m^3
count = 1;
again = 1;

%user inputs
name = input('Brand name and model of stove: ', 's');
while again == 1
  fahr = input('Initial temp [deg F]: '); %[Fahrenheit]
  time = input('Time taken to reach boil [min]: '); %[minutes]
  while time < 0
    fprintf('Please enter a positive time: \n');
    time = input('Time taken to reach boil [min]: '); %[minutes]
  end
  power = input('Rated burner power [W]: '); %[W]
  temp = ((fahr-32)*(1/1.8))+273.15; %[K]
  energy = (373.15-temp)*vol*Cw; %[J]
  p_used = energy/(time*60); %[W]
  effic = (p_used/power)*100; %[%]
  while effic > 100
      fprintf('It is not possible to have an efficiency greater than 100%%.\n')
      power = input('Please enter a new rated burner power [W]: '); %[W]
      effic = (p_used/power)*100; %[%]
  end

  %outputs
  fprintf('Household Appliance Efficiency Calculator #%0.0f',count);
  fprintf('\nEnergy required:\t\t\t%0.0f J\n', energy);
  fprintf('Power used by burner:\t\t%0.0f W\n\n', p_used);
  fprintf('Burner efficiency for a %s stove: %0.1f%%\n', name, effic);

  menu_title = sprintf('Would you like to use the %s again with new values?', name);
  again = menu(menu_title, 'Yes','No');
  count = count + 1;
end

%%  Ravi Namuduri 1543511 ENGI 1331 TTh 2:30-4

%Problem 2

%problem statement: With the given data, find the highest costing quarter
% and then calculate the overall cost for that quarter. Then, find the highest costing
% product of the year and its corresponding product costs.

clear
clc

%import data
data1 = csvread('Problem2_cost.csv'); % rows: products 1-x, columns: materials, labor, and transporation costs
data2 = csvread('Problem2_volume.csv'); % rows: products 1-x, columns: quarters 1-4

again = 1;
while again == 1
  %part 1
  data1_length = length(data1(:,1).');
  prod_sum_list = [];
  for curr_row = 1:data1_length
    prod_sum = sum(data1(curr_row,:));
    prod_sum_list = [prod_sum_list prod_sum];
    curr_row = curr_row + 1;
  end

  q_cost = [];
  for curr_q = 1:4
    q1 = prod_sum_list.' .* data2(:,curr_q);
    q_cost = [q_cost q1];
    curr_q = curr_q + 1;
  end

  q_sum = [];
  for curr_col = 1:4
    q2 = sum(q_cost(:,curr_col).');
    q_sum = [q_sum q2];
    curr_col = curr_col + 1;
  end

  [max_cost max_q] = max(q_sum);

  %part 2
  prod_mat = [];
  prod_lab = [];
  prod_trans = [];
  for curr_row = 1:data1_length
    q3 = sum(data2(curr_row,:));
    q4 = sum(data1(curr_row,1)) * q3;
    prod_mat = [prod_mat q4];
    q5 = sum(data1(curr_row,2)) * q3;
    prod_lab = [prod_lab q5];
    q6 = sum(data1(curr_row,3)) * q3;
    prod_trans = [prod_trans q6];
    q7 = prod_mat + prod_lab + prod_trans;
    curr_row = curr_row + 1;
  end

  [max_prod_cost prod] = max(q7);

  fprintf('\nOverall Costs: $%0.2f\n',max_prod_cost);
  fprintf('\nProduct %0.0f was the highest costing product for the year.\n',max_q);
  fprintf('\nMaterial Costs: $%0.2f',prod_mat(1,max_q));
  fprintf('\nLabor Costs: $%0.2f',prod_lab(1,max_q));
  fprintf('\nTransportaion Costs: $%0.2f',prod_trans(1,max_q));
  fprintf('\nOverall Costs: $%0.2f\n',q7(1,max_q));

  again = menu('Would you like to enter another volume data set?','Yes','No');
  if again == 1
    data2 = [];
    data2 = input(['Input new ' num2str(data1_length) 'x' num2str(4) ' volume matrix: ']);
    while length(data2(:,1)) ~= data1_length || length(data2(1,:)) ~= 4
      data2 = input(['You entered a ' num2str(length(data2(:,1)).') 'x' num2str(length(data2(1,:))) '. Please input new ' num2str(data1_length) 'x' num2str(4) ' volume matrix: ']);
    end
  end
end

%% Ravi Namuduri 1543511 ENGI 1331 TTh 2:30 - 4

%Problem 3

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

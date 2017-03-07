%% Ravi Namuduri 1543511 ENGI 1331 TTh 2:30 - 4

%problem 3

clc
clear

again = 1;
while again == 1
  init_inv = input('Initial inventory for week 1: ');
  sale_in = input('Sales information as vector: ');

  %weeks
  week = [];
  for curr = 1:length(sale_in)
    week = [week curr];
  end
  fprintf('\nWeek:\t\t');
  fprintf('%0.0f\t',week)

  %sales
  fprintf('\nSales:\t\t')
  fprintf('%0.0f\t',sale_in);

  %Inventory
  inv = [];
  inv = [inv init_inv];
  for curr = 1:length(sale_in)
    if curr-1 == 0
      curr_inv = init_inv;
      inv = [inv curr_inv];
    else
      curr_inv = inv(curr-1) + sale_in(curr-1) - sale_in(curr);
      if curr_inv < 0
        warning('Inventory is below zero at week %d',curr);
        inv_floor = 0;
        inv = [inv inv_floor];
      else
        inv = [inv curr_inv];
      end
    end
  end
  fprintf('\nInventory:\t');
  fprintf('%0.0f\t',inv(2:length(inv)));
  scatter(week, inv);
  xlabel('Time [week]');
  ylabel('Inventory [units]');
  again = menu('Enter another data set?','Yes','No');
end

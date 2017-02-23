%%  Ravi Namuduri 1543511 ENGI 1331 TTh 2:30-4

%problem 2

%problem statement: With the given data, find the highest costing quarter
% and then calculate the overall cost for that quarter. Then, find the highest costing
% product of the year and its corresponding product costs.

clear
clc

%import data
data1 = csvread('Problem2_cost.csv'); % rows: products 1-x, columns: materials, labor, and transporation costs
data2 = csvread('Problem2_volume.csv'); % rows: products 1-x, columns: quarters 1-4

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

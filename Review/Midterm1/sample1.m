%%Ravi Namuduri 1543511 ENGI 1331 TTh 2:30 - 4
clc
clear

Prod = [4 4 2 3; 2 2 6 1; 3 4 5 2; 5 3 4 2];

Company = input('Name of company: ','s');
NumPlant = length((Prod(1,:)'));
prod_min = min(min(Prod));
[row_min col_min] = find(Prod==prod_min);
PlantYrProd = sum(Prod');
ProdQ = sum(Prod);
ProdTot = sum(sum(Prod));

ProdSummary = [Prod PlantYrProd'; [ProdQ ProdTot]];
csvwrite('Exam2Part1', ProdSummary);

fprintf('%s produced %0.0fx10^3 tons of coal for the year, using %0.0f plants.\n',Company,ProdTot,NumPlant);
fprintf('Plant %0.0f had the worst quarter in the company producing %0.0fx10^3 tons of coal in Quarter %0.0f.\n',row_min,prod_min,col_min);

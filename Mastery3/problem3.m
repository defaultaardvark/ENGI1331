%% Ravi Namuduri 1543511 ENGI 1331 TTh 2:30 - 4

%problem 3

%problem statement: find the maximum distance travelled [m] from a given weight [N],
% k1 [N/m], k2 [N/m], and distance to rest [m].

%input variables
%weight = weight of mass [N]
%k_1 = spring constant of main spring [N/m]
%k_2 = spring constant of support springs [N/m]
%d = distance travelled until rest [m]

%intermediate variables
%x_mat = defined matrix for set of calculated distances
%curr_col = current column during vector column cycling
%dist = concatenation of weight and x_mat vectors
%rowd = row of max weight (unused)
%cold = column of max weight

%output variables
%x = distance mass travelled before rest [m]
%dist = set of distances x [m]

%housekeeping
clc
clear

%input
weight = input('Enter weight [N]: ');
k_1 = input('Enter k1 [N/m]: ');
k_2 = input('Enter k2 [N/m]: ');
d = input('Enter rest position [m]: ');

%calculations

%multiple weight values
  if length(weight) > 1
    x_mat = [];
    for curr_col = 1:length(weight)
      x = weight(1,curr_col)/k_1;
      if x >= d
        x = (weight(1,curr_col)+(2*k_2*d))/(k_1+(2*k_2));
        x_mat = [x_mat x];
        curr_col = curr_col + 1;
      elseif x < d
        x_mat = [x_mat x];
      end
    end
    dist = [weight;x_mat];
    [rowd cold] = max(weight);
%output
    fprintf('The max weight given (%0.0f) will pass through a distance of %0.2f m.\n',max(weight),dist(2,cold));
%plotting
    scatter(weight,x_mat);
    title('Relationship of weight and spring compression');
    xlabel('Weight (weight) [N]');
    ylabel('Distance moved through (x) [m]');
%only one weight value
  elseif length(weight) == 1
    x = weight/k_1;
    if x >= d
      x = (weight+(2*k_2*d))/(k_1+(2*k_2));
    elseif x < d
    end
%output
    fprintf('The weight will pass through a distance of %0.4f m.\n',x);
  end

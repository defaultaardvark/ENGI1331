%% Problem 1

clc
clear

ProdData = [1, 2, 4, 4, 5, 4; 7, 8, 9, 0, 1, 5; 9, 8, 5, 6, 7, 7];

[Row, Col] = size(ProdData);
Trend = zeros([Row, Col]);
TrendNum = zeros([1,3]);

for c = 2:Col
    for r = 1:Row
        if ProdData(r,c) < ProdData(r,c-1)
            Trend(r,c) = -1;
            TrendNum(1) = TrendNum(1) + 1;
        elseif ProdData(r,c) > ProdData(r,c-1)
            Trend(r,c) = 1;
            TrendNum(3) = TrendNum(3) + 1;
        else
            TrendNum(2) = TrendNum(2) + 1;
        end
    end
end

%%problem 2


OFact(1) = 1;
Limit = input('Enter the maximum factorial value: ');

N = 1;
while OFact(N) <= Limit
  N = N+1;
  OFact(N) = 1;
  for k = 3:2:2*N-1
    OFact(N) = OFact(N)*k;
  end
end

fprintf('\nN\tOFact(N)\n');
for N = 1:length(OFact)-1
  fprintf('%0.0f\t%0.0f\n',N,OFact(N));
end

fprintf('Desired max is %0.2E.\n', Limit);
fprintf('OFact(%0.0f) = %0.0f is the closest value without exceeding the limit.\n', N, OFact(N));

%% problem 3

clear
clc
close

A = [5 21 5; 12 9 21; 5 8 12];
[row, col] = size(A);
D = 0;
B = [];
for ii = 1:2:row
  for jj = 1:2:col
    C = A(ii,jj)*jj - ii;
    if ii > jj
      D = D+1;
      B(D) = C;
    else
      D = D + 2;
      B(D) = C - ii*jj;
    end
  end
end

%%Ravi Namuduri ENGI 1331 Matrix Functions

clear
clc

%random matrices

q = randi(10);
%Generates a random number between 1 and 10

s = randi(10,5);
%generates a 5x5 matrix of random integers

u = randi([-5 100],8,5);
u = randi([-5 100],[8 5]);
%both generate a random matrix of size 8x5 with values ranging from -5 to 100
%both perform the same Function

%vector or matrix of all zeros

z = zeros(1,5);
%generates a row vector with 5 zeroes

z = zeros(5);
%generates a 5x5 matrix of all zeroes

z = zeros(8,5);
%generates an 8x5 matrix of all zeroes

%vectors of matrices of all ones

O1 = ones(1,5); %creates a row vector with 5 ones
O1 = ones(7,6);

%I want to create a 4x5 matrix filled with eights
f = 8*ones(4,5); %no other integer Functions

%matrix function that calculates element x element
S1 = sin(s);
%calculates the sin of a value in radians; also applies to matrices
%argument must be in radians
%cos(x) and tan(x) will also work with the same arguments

S_1 = sind(s);
%calculates the sin of a value in degrees; also applies to matrices
%argument must be in degrees

Q = sqrt(s);
%calculates the square root of a value

%power = power(s,3); == s.^3;
%exp = exponential
%log = natural logarithm
%log10 = logarithm to the base 10

%length and size Functions

%vector
a = [0:0.27:10];

l = length(a);
%calculates the number of elements in a vector

b = [3 4; 5 6; 7 8];
c = [1 2 3 4; 5 6 7 8];

b1 = length(b);
c1 = length(c);
%length() will return the longer of the two dimensions
%ex: length(3x5 matrix) returns 5

%to find the actual dimensions of a matrix, use size()
b2 = size(b);
c2 = size(c);

%I want the number of rows of matrix b

r = b2(1,1);
r = b2(1);
%extracts the number of rows

col = b2(1,2);
col = b2(2);

%or

[rows columns] = size(b);
%stores the extracted dimensions in each corresponding variable
%stores the first element in size(b) in variable 'rows'
% and the second element from size(b) in variable 'columns'

%sample problem

%given a table of temperatures, we know that each column represents
% a location and each row represents a reading taken at a different time

%input the temperature readings:

temp = [333 245 287; 273 345 292];

[row columns] = size(temp);

%how many temperature readings were taken at each location? (2)
fprintf('\nThe number of temperature readings taken at each location is %0.0f.\n', row);

%at how many locations were the temperatures measured? (3)
fprintf('\nThe temperature was measured at %0.0f locations.\n',columns);

%what were the total number of readings taken?
fprintf('\nThe total number of readings taken were %0.0f.\n', row*columns);

%functions that go row x row or column x column

%vector

aS = sum(a);
%sums across for a horizontal vector
%sums down for a column vector

%matrix

bS = sum(b);
%output shows 2 values, one for each column (sum of each column)
%default is to sum each column

bS1 = bS(1,1);
bS1 = bS(1);
bS1 = sum(b(:,1));
%extracting the sum for column 1 only

%want to sum by row
bS2 = sum(b,2); %<-- using '2' indicates the second 'option' for the function
%adding across for each row

%vector
aM = max(a);

%matrix
bM = max(b);
%default is the maximum of each column

bM = max(b,[],1); %calculates maximum of each column (row vector output)
bM2 = max(b,[],2); %calculates maximum of each row (column vector output)

%calculate the highest temperature reading at each location
temp_M = max(temp);
%maximum of each column
%meaning maximum temperature at each location

[temp_M, temp_row] = max(temp);
%stores the maximum value in temp_M and the corresponding row numbers at which
%the maximum value appears


%maximum overall temperature
temp_MOverall = max(temp_M);
temp_MOverall = max(max(temp));
temp_MOverall = max(temp(:)); %converts matrix temp into a column vector and then extracts the maximum

%using find function
[rown,coln] = find(temp == max(max(temp)));

[rowsn,colsn] = find(temp > 300);

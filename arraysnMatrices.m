%%  Ravi Namuduri ENGI 1331 Arrays and Matrices
clc
clear

%Vector
%Brackets are vital to defining vectors
% as well as Matrices
f = [10 20 30];
f = [10, 20 , 30]; %Same as above

%I want to create a vector starting at 10 and ending at 50 in increments of 10
g = [10:10:50]; %can use variables for increments; can we use them for count bounds as well?

%separate by row (column vector) - use semicolon
r = [10;20;30];

%create a 2x2 matrix
a = [2 3; 4 5];
i = [1 3; 4 5];

%create a 3x2 matrix
j = [4 5; 6 7; 8 9];

%create a matrix where the first row starts at 10 and goes to 50 in increments of 10
%the second row starts at 100 and goes to 500 in increments of 100
G = [10:10:50; 100:100:500]; %used to make a matrix that has increments in its rows
%note: length of row 1 must be the same as the length of row 2. Otherwise, the error
  %"dimensions do not match" will appear

%combining vectors and matrices
H = [G; g]; %combines g to the bottom of G
%H = [g; G]; %combines G to the bottom of g

%combine a vertical array to the first column of matrix H
H_new = [r H]; %note number or rows of H and r are equal.
H_new = [r [G; g]];

%indexing
%extracting and replacing elements of a matrix
e = j(2,2); %parentheses are used to define index (location)
j(2,2) = 10; %replaces value in 2,2 in matrix j with 10;
%q = j(2,3); <-- returns error; index exceeds matrix dimensions because there is no third column

%extract the entire first row
e_new = j(1,:);

%extract the entire second column
e_new2 = j(:,2);

%extract values from both 1 and 2
e_new3 = j(1:2,:);

%extract the first 3 columns from H_new
e_new4 = H_new(:,1:3);

%Try This: place column vector r in between columns 2 and 3 of matrix H

%matrix operations

b = a+i; %dimensions of both matrices must be identical
B = a*i; %the number of columns of matrix 1 must be equal to the number of rows of matrix 2 (matrix multiplication);

%element by element multiplication
B_item = a.*i; %for this type of matrix multiplication, both matrices must be identical in size

%multiplying a matrix by a scalar
B_scalar = 5*a; %every element will be multiplied by the multiple

%square each element in a matrix
B_square = a.^2;

%transpose
a_T = a';

%load
%write
%^commands you can use to read and write from external files

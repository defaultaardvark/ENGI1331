%% problem 2
% find waldo in a background image using a given reference image
clc
clear
close all

foundim = imread('P2_Waldo1.png');
%foundim = imread('P2_Waldo2.png');
%foundim = imread('P2_Waldo3.png');

where_at = imread('P2_wheresWaldo1.jpg');
%where_at = imread('P2_wheresWaldo2.jpg');
%where_at = imread('P2_wheresWaldo3.jpg');

if size(foundim,1) > size(where_at, 1) || size(foundim, 2) > size(where_at, 2)
  error('Reference image too large');
end

[ref_red, back_red, xpos, ypos, xloc, yloc] = wheretfwaldoat(foundim, where_at);

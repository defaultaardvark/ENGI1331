%% imaging

%red green and blue colors each have their own value matrices that are "overlayed" to find the resulting colors
% in each pixel, creating an image.

%images are considered figures, so you need close all in housekeeping
clc
clear
close all

% dimensions of RGB image
% number of rows of pixels x number of columns x 3 (1 layer per color)

%imread

ImageMatrix = imread('puppy.jpg');

%layer 1 = red
%layer 2 = green
%layer 3 = blue

%show the image
%show the image matrix as an image

figure(1)
image(ImageMatrix);

%wants to know the size of the ImageMatrix

%layer should always be 3
[row, col, layer] = size(ImageMatrix);

%R = I(:,:,1);
%G = I(:,:,2);
%B = I(:,:,3);

%implicit loop
%separate each color layer
red = ImageMatrix(:,:,1);
green = ImageMatrix(:,:,2);
blue = ImageMatrix(:,:,3);

%finding dimensions of the red matrix
[redr, redc, redl] = size(red);

%2 dimensional matrix
max_red = max(max(red)); %255 is max
min_red = min(min(red)); %0 is min

%the range for nay color is always from 0 to 255

%create a mask to identify all of the white pixels
%account for some tolerance to include imperfections
white_mask = red > 252 & green > 252 & blue > 252;
%identifying the pixels where red green and blue are greater than the tolerance of 180

%to apply a 2d mask on a 3d image, we must convert our mask matrix into a 3d image matrix
%to create a 3d matrix, concatenate
white_layer = cat(3, white_mask, white_mask, white_mask);
%taking the same image and making it 3 layers
%the above command builds a 3d matrix; "cat" concatenates data

tiedye = imread('tiedye.jpg');

figure(2)
image(tiedye);

%to combine the images of the tiedye backgroun and the puppy, the images must be the same size, in this case, 1600x1200

%we must resize one of the images
%imresize

tiedye_resize = imresize(tiedye,[row, col]);

figure(3)
image(tiedye_resize);

%applying 3d mask on both puppy image as well as resized tiedye image
ImageMatrix(white_layer) = tiedye_resize(white_layer);
%only works if both images are the same size

figure(4)
image(ImageMatrix);

%export image
imwrite(ImageMatrix,'NewImage.png');
%don't forget file extensions

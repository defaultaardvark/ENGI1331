%% Ravi Namuduri 1543511 ENGI 1331 TTh 2:30-4

%problem 1

clc
clear
close all

crystal = imread('crystals.jpeg');

red = crystal(:,:,1);
green = crystal(:,:,2);
blue = crystal(:,:,3);

intensity = 0.2989*red + 0.5870*green + 0.1140*blue;

h_sobel = [-1 -2 -1; 0 0 0; 1 2 1];
v_sobel = [-1 0 1; -2 0 2; -1 0 1];

Horizontal = conv2(double(intensity), double(h_sobel));
Vertical = conv2(double(intensity), double(v_sobel));

figure

subplot(2, 2, 1);
image(crystal);

subplot(2, 2, 2);
image(Horizontal);

subplot(2, 2, 3);
image((Horizontal.^2 + Vertical.^2).^(0.5));

subplot(2, 2, 4);
image(Vertical);

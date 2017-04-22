clc
clear
close all

figure

%eevee
eevee = imread('eevee.jpg');
meadow = imread('meadow.png');

eevee_resize = imresize(eevee,[size(meadow, 1), size(meadow, 2)]);

red = eevee_resize(:,:,1);
green = eevee_resize(:,:,2);
blue = eevee_resize(:,:,3);

green_mask = red < 150 & green > 180 & blue < 150;
green_layer = cat(3, green_mask, green_mask, green_mask);

eevee_resize(green_layer) = meadow(green_layer);

subplot(2,2,1)
image(eevee_resize);

%tepig

tepig = imread('tepig.jpg');
mountain = imread('mountain.jpg');

tepig_resize = imresize(tepig,[size(mountain, 1), size(mountain, 2)]);

red = tepig_resize(:,:,1);
green = tepig_resize(:,:,2);
blue = tepig_resize(:,:,3);

green_mask = red < 150 & green > 180 & blue < 150;
green_layer = cat(3, green_mask, green_mask, green_mask);

tepig_resize(green_layer) = mountain(green_layer);

subplot(2,2,2)
image(tepig_resize)

%pikachu

pikachu = imread('pikachu.jpg');
sun = imread('sun.jpg');

pikachu_resize = imresize(pikachu,[size(sun, 1), size(sun, 2)]);

red = pikachu_resize(:,:,1);
green = pikachu_resize(:,:,2);
blue = pikachu_resize(:,:,3);

green_mask = red < 150 & green > 180 & blue < 150;
green_layer = cat(3, green_mask, green_mask, green_mask);

pikachu_resize(green_layer) = sun(green_layer);

subplot(2,2,3)
image(pikachu_resize)

%ivysaur

ivysaur = imread('ivysaur.jpg');
autumn = imread('autumn.jpg');

ivysaur_resize = imresize(ivysaur,[size(autumn, 1), size(autumn, 2)]);

red = ivysaur_resize(:,:,1);
green = ivysaur_resize(:,:,2);
blue = ivysaur_resize(:,:,3);

green_mask = red < 150 & green > 220 & blue < 150;
green_layer = cat(3, green_mask, green_mask, green_mask);

ivysaur_resize(green_layer) = autumn(green_layer);

subplot(2,2,4)
image(ivysaur_resize)

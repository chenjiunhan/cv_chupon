clear
clc
close all

R = im2double(imread('ball_reflectance.png'));
S = im2double(imread('ball_shading.png'));
I = R .* (S);

figure, imshow(R)
figure, imshow(S)
figure, imshow(I)

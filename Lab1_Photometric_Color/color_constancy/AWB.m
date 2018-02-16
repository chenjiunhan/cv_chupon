clear
clc
close all

im = imread('awb.jpg');
figure, imshow(im);

R = im(:,:,1);
G = im(:,:,2);
B = im(:,:,3);

mean_R = mean(mean(R));
mean_G = mean(mean(G));
mean_B = mean(mean(B));
scale = 128 ./ [mean_R, mean_G, mean_B];

im2 = im2double(im)
R = im2(:,:,1);
G = im2(:,:,2);
B = im2(:,:,3);
im2(:,:,1) = scale(1) * R;
im2(:,:,2) = scale(2) * G;
im2(:,:,3) = scale(3) * B;
figure, imshow(im2);
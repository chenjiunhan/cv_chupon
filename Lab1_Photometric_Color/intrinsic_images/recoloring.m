clear
clc
close all

R = imread('ball_reflectance.png');
S = imread('ball_shading.png');

R_R = R(:,:,1);
R_G = R(:,:,2);
R_B = R(:,:,3);

R_green = R;
R_R_green = R_green(:,:,1);
R_G_green = R_green(:,:,2);
R_B_green = R_green(:,:,3);

R_magenta = R;
R_R_magenta = R_magenta(:,:,1);
R_G_magenta = R_magenta(:,:,2);
R_B_magenta = R_magenta(:,:,3);

brown_color = R(200, 200, :);

brown_color_pixel = R_R == brown_color(1) & R_G == brown_color(2) & R_B == brown_color(3);

green = zeros(3, 'uint8');
green(2) = 255;

magenta = zeros(3, 'uint8');
magenta(1) = 255;
magenta(3) = 255;

R_R_green(brown_color_pixel) = green(1);
R_G_green(brown_color_pixel) = green(2);
R_B_green(brown_color_pixel) = green(3);

R_green(:,:,1) = R_R_green;
R_green(:,:,2) = R_G_green;
R_green(:,:,3) = R_B_green;

R_R_magenta(brown_color_pixel) = magenta(1);
R_G_magenta(brown_color_pixel) = magenta(2);
R_B_magenta(brown_color_pixel) = magenta(3);

R_magenta(:,:,1) = R_R_magenta;
R_magenta(:,:,2) = R_G_magenta;
R_magenta(:,:,3) = R_B_magenta;

R = im2double(R);
S = im2double(S);
I = R .* (S);

figure, imshow(R);
figure, imshow(S);
figure, imshow(I);

R_green = im2double(R_green);
I_green = R_green .* (S);

figure, imshow(R_green);
figure, imshow(S);
figure, imshow(I_green);

R_magenta = im2double(R_magenta);
I_magenta = R_magenta .* (S);

figure, imshow(R_magenta);
figure, imshow(S);
figure, imshow(I_magenta);

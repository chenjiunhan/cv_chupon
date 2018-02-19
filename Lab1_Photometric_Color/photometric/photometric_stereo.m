close all
clear all
clc
 
disp('Part 1: Photometric Stereo')

% obtain many images in a fixed view under different illumination
disp('Loading images...')
image_dir = './SphereGray5/';   % TODO: get the path of the script
%image_ext = '*.png';

[image_stack, scriptV] = load_syn_images(image_dir);
[h, w, n] = size(image_stack);
fprintf('Finish loading %d images.\n\n', n);

% compute the surface gradient from the stack of imgs and light source mat
disp('Computing surface albedo and normal map...')
[albedo, normals] = estimate_alb_nrm(image_stack, scriptV);


%% integrability check: is (dp / dy  -  dq / dx) ^ 2 small everywhere?
disp('Integrability checking')
[p, q, SE] = check_integrability(normals);

threshold = 0.005;
SE(SE <= threshold) = NaN; % for good visualization
fprintf('Number of outliers: %d\n\n', sum(sum(SE > threshold)));

%% compute the surface height
height_map = construct_surface( p, q );

%% Display
show_results(albedo, normals, SE);
show_model(albedo, height_map);
%% 
%image_dir = './SphereColor/';
image_dir = './MonkeyColor/';

[image_stack1, scriptV1] = load_syn_images(image_dir, 1);
[image_stack2, scriptV2] = load_syn_images(image_dir, 2);
[image_stack3, scriptV3] = load_syn_images(image_dir, 3);

[h, w, n] = size(image_stack);
fprintf('Finish loading %d images.\n\n', n);

% compute the surface gradient from the stack of imgs and light source mat
disp('Computing surface albedo and normal map...')
[albedo1, normals1] = estimate_alb_nrm(image_stack1, scriptV1);
[albedo2, normals2] = estimate_alb_nrm(image_stack2, scriptV2);
[albedo3, normals3] = estimate_alb_nrm(image_stack3, scriptV3);
normals = (normals1 + normals2 + normals3) ./ sqrt(normals1 .* normals1 + normals2 .* normals2 + normals3 .* normals3);
[albedo_h, albedo_w] = size(albedo1);
albedo = zeros(albedo_h,albedo_w,3);
albedo(:,:,1) = albedo1;
albedo(:,:,2) = albedo2;
albedo(:,:,3) = albedo3;

%% integrability check: is (dp / dy  -  dq / dx) ^ 2 small everywhere?
disp('Integrability checking')
[p, q, SE] = check_integrability(normals);

threshold = 0.005;
SE(SE <= threshold) = NaN; % for good visualization
fprintf('Number of outliers: %d\n\n', sum(sum(SE > threshold)));

%% compute the surface height
height_map = construct_surface( p, q, 'column' );

show_results(albedo, normals, SE);
show_model(albedo, height_map);

%% Face
[image_stack, scriptV] = load_face_images('./yaleB02/');
[h, w, n] = size(image_stack);
fprintf('Finish loading %d images.\n\n', n);
disp('Computing surface albedo and normal map...')
[albedo, normals] = estimate_alb_nrm(image_stack, scriptV);

%% integrability check: is (dp / dy  -  dq / dx) ^ 2 small everywhere?
disp('Integrability checking')
[p, q, SE] = check_integrability(normals);

threshold = 0.005;
SE(SE <= threshold) = NaN; % for good visualization
fprintf('Number of outliers: %d\n\n', sum(sum(SE > threshold)));

%% compute the surface height
height_map = construct_surface( p, q, 'column' );

show_results(albedo, normals, SE);
show_model(albedo, height_map);


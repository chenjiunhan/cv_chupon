function [output_image] = rgb2normedrgb(input_image)
% converts an RGB image into normalized rgb
    [h, w, ~] = size(input_image);
    output_image = zeros(h, w, 3);
    
    R = input_image(:,:,1);
    G = input_image(:,:,2);
    B = input_image(:,:,3);
    
    S = R + G + B;
    
    output_image = input_image ./ S;
        
    imshow(output_image);


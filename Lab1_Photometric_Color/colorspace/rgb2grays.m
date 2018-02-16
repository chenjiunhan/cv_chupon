function [output_image] = rgb2grays(input_image)
% converts an RGB into grayscale by using 4 different methods
    [h, w, ~] = size(input_image);
    output_image1 = zeros(h, w);
    output_image2 = zeros(h, w);
    output_image3 = zeros(h, w);
    output_image4 = zeros(h, w);
    
    R = input_image(:,:,1);
    G = input_image(:,:,2);
    B = input_image(:,:,3);        
    
    
        
    
% ligtness method
    output_image1 = (max(input_image,[],3) + min(input_image,[],3)) / 2;
    imshow(output_image1);
% average method
    output_image2 = R + G + B / 3;
    imshow(output_image2);
% luminosity method
    output_image3 = 0.21 * R + 0.72 * G + 0.07 * B;
    imshow(output_image3);
% built-in MATLAB function 
    output_image4 = rgb2gray(input_image);
    imshow(output_image4);
    
    output_image = [output_image1, output_image2, output_image3, output_image4];
end


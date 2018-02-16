function [output_image] = rgb2opponent(input_image)
% converts an RGB image into opponent color space
    [h, w, ~] = size(input_image);
    output_image = zeros(h, w, 3);
%     for row = 1:h
%         for col = 1:w
%             R = input_image(row, col, 1);
%             G = input_image(row, col, 2);
%             B = input_image(row, col, 3);
%             output_image(row, col, 1) = (R - G) / sqrt(2);
%             output_image(row, col, 2) = (R + G - 2 * B) / sqrt(6);
%             output_image(row, col, 3) = (R + G + B) / sqrt(3);
%         end
%     end    
%     imshow(output_image);
    R = input_image(:,:,1);
    G = input_image(:,:,2);
    B = input_image(:,:,3);
    output_image(:,:,1) = (R - G) / sqrt(2);
    output_image(:,:,2) = (R + G - 2 * B) / sqrt(6);
    output_image(:,:,3) = (R + G + B) / sqrt(3);
    imshow(output_image);
end


function [ albedo, normal ] = estimate_alb_nrm( image_stack, scriptV, shadow_trick)
%COMPUTE_SURFACE_GRADIENT compute the gradient of the surface
%   image_stack : the images of the desired surface stacked up on the 3rd
%   dimension
%   scriptV : matrix V (in the algorithm) of source and camera information
%   shadow_trick: (true/false) whether or not to use shadow trick in solving
%   	linear equations
%   albedo : the surface albedo
%   normal : the surface normal


[h, w, ~] = size(image_stack);
if nargin == 2
    shadow_trick = true;
end

% create arrays for 
%   albedo (1 channel)
%   normal (3 channels)
albedo = zeros(h, w, 1);
normal = zeros(h, w, 3);

% =========================================================================
% YOUR CODE GOES HERE
% for each point in the image array
%   stack image values into a vector i
%   construct the diagonal matrix scriptI
%   solve scriptI * scriptV * g = scriptI * i to obtain g for this point
%   albedo at this point is |g|
%   normal at this point is g / |g|



for row = 1:h
    for col = 1:w        
        i = reshape(image_stack(row,col,:),[],1);        
        
        if all(i(:) == 0)
            albedo_xy = 0;
            normal_xy = zeros(3, 1);
        else            
            scriptI = diag(i);
            g = linsolve(scriptI * scriptV, scriptI * i);
            norm_g = norm(g);
                        
            if norm_g == 0 || sum(isnan(g)) > 0 || isnan(norm_g)
                albedo_xy = 0;
                normal_xy = zeros(3, 1);                
            else
                albedo_xy = norm_g;
                normal_xy = g / norm_g;                
            end                        
        end
               
        albedo(row,col) = albedo_xy;
        normal(row,col,:) = normal_xy;
    end
end

% =========================================================================

end


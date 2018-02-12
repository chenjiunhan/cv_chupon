function [ p, q, SE ] = check_integrability( normals )
%CHECK_INTEGRABILITY check the surface gradient is acceptable
%   normals: normal image
%   p : df / dx
%   q : df / dy
%   SE : Squared Errors of the 2 second derivatives

% initalization
p = zeros(size(normals));
q = zeros(size(normals));
SE = zeros(size(normals));

% ========================================================================
% YOUR CODE GOES HERE
% Compute p and q, where
% p measures value of df / dx
% q measures value of df / dy

p = normals(:,:,1) ./ normals(:,:,3);
q = normals(:,:,2) ./ normals(:,:,3);

% ========================================================================



p(isnan(p)) = 0;
q(isnan(q)) = 0;



% ========================================================================
% YOUR CODE GOES HERE
% approximate second derivate by neighbor difference
% and compute the Squared Errors SE of the 2 second derivatives SE

p_zero = [p;zeros(1, size(p, 2))];
q_zero = [q, zeros(size(q, 1), 1)];
dp_dy = diff(p_zero, 1, 1);
dq_dx = diff(q_zero, 1, 2);

% [~, dp_dy] = imgradient(p)
% [dq_dx, ~] = imgradient(q)

SE = (dp_dy - dq_dx) .^ 2;
% ========================================================================




end

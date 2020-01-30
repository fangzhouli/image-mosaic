% Compute the homography parameters
% 
% Input:
%   t1, t2  2-by-N matrices, N >= 4
% Output:
%   H       3-by-3 homography matrix

function H = computeH(t1, t2)

[~, n] = size(t1);

% Initialize A: 2n x 9 
A = zeros(2 * n, 9);

% Fill in A
for i = 1 : n
    x = t1(1, i);  % x_n 
    y = t1(2, i);  % y_n
    x_ = t2(1, i); % x_n'
    y_ = t2(2, i); % y_n'

    % row indices for the pairs
    r2 = 2 * i;
    r1 = r2 - 1;

    A(r1, :) = [x, y, 1, 0, 0, 0, -x_ * x, -x_ * y, -x_];
    A(r2, :) = [0, 0, 0, x, y, 1, -y_ * x, -y_ * y, -y_];
end

% Eigenvector with the smallest eigenvalue
[ev, ~] =  eigs(A' * A, 1, 0);

H = reshape(ev, 3, 3)';
  
end
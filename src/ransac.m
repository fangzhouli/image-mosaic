% Implementation of RANSAC
%
% Input:
%   t1, t2  2*N correspondences with noise, N >= 4
%   n       the amount of iterations
%   k       the minimum amount of sample
%   ep      the width of inliers
% Output:
%   H       3*3 homography matrix
function best_H = ransac(t1, t2, n, k, ep)

[~, l] = size(t1);

max_fit = 0;
best_H = zeros(3);
for i = 1:n
    fit = 0;
    samp = randsample(l, k);
    nt1 = t1(:, samp);
    nt2 = t2(:, samp);
    H = computeH(nt1, nt2);
    for j = 1:l
        w = H * [t1(1, j), t1(2, j), 1]';
        nx = w(1) / w(3);
        ny = w(2) / w(3);
        x = t2(1, j);
        y = t2(2, j);
        r = sqrt((x - nx)^2 + (y - ny)^2);
        if r <= ep
            fit = fit + 1;
        end
    end
    if fit > max_fit
        max_fit = fit;
        best_H = H;
    end
end
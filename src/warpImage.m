% Warping the image according to homography
% 
% Input:
%   inputIm, refIm   M-N-3 matrices
%   H                3-3   homography matrix
% Output:
%   warpIm, mergeIm  M-N-3 matrices
function [warpIm, mergeIm] = warpImage(inputIm, refIm, H)

% Initialization
[M, N, ~] = size(inputIm);

% Compute warpIm dimension
% Vectors to store the corresponding coordinates for corners of inputIm
cornerX = zeros(1,5); 
cornerY = zeros(1,5);

[cornerX(1), cornerY(1)] = correCoords(1, 1, H);
[cornerX(2), cornerY(2)] = correCoords(1, M, H);
[cornerX(3), cornerY(3)] = correCoords(N, 1, H);
[cornerX(4), cornerY(4)] = correCoords(N, M, H);

shiftY = ceil(abs(min(cornerY)));
shiftX = ceil(abs(min(cornerX)));

[nr, nc, ~] = size(refIm);

nrow = max([ceil(abs(max(cornerY) - min(cornerY))), nr]);
ncol = max([ceil(abs(max(cornerX) - min(cornerX))), nc]);

warpIm = zeros(nrow, ncol, 3, 'uint8');

H_inv = H \ eye(3);

% Inverse warping
for i = 1:ncol
    for j = 1:nrow
        w = H_inv * [i-shiftX, j-shiftY, 1]';
        % Corresponding points in the source image
        x = w(1) / w(3);
        y = w(2) / w(3);
        % Getting bounding box and bilinear interpolation
        if x > 1 && y > 1 && x < N && y < M
            warpIm(j, i, :) = bilinear_interpolation(y, x, inputIm);
        end
    end
end

figure;
imshow(warpIm);

[M, N, ~] = size(refIm);
mergeIm = warpIm;

% Merge
for i = 1:M
    for j = 1:N
        [a, b, ~] = size(mergeIm);
        i_sft = i+shiftY;
        j_sft = j+shiftX;
        % Write if the current pixel does not exist or is black
        if (i_sft > a || j_sft > b) || ~sum(mergeIm(i_sft, j_sft, :))
            mergeIm(i_sft, j_sft, :) = refIm(i, j, :);
        end
    end
end
figure;
imshow(mergeIm);

% Helper function for corresponding coordinates computation
function [cx, cy] = correCoords(x, y, H)
    
w = H * [x, y, 1]';
% Corresponding points in the source image
cx = w(1) / w(3);
cy = w(2) / w(3);

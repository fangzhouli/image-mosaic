% Use this script to manually get the coordicates of correspondences by
%   simply clicking images
% 
% Input:
%   n  minimal number of samples
function V = get_correspondences(img, n)

imshow(img);
V = ginput(n)';

function value = bilinear_interpolation(x, y, im)

[~, ~, K] = size(im);

if floor(x) == ceil(x) && floor(y) == ceil(y)
    top = floor(x);
    bottom = floor(x) + 1;
    left = floor(y);
    right = floor(y) + 1;
elseif floor(x) == ceil(x)
    top = floor(x);
    bottom = floor(x) + 1;
    left = floor(y);
    right = ceil(y);
elseif floor(y) == ceil(y)
    top = floor(x);
    bottom = ceil(x);
    left = floor(y);
    right = floor(y) + 1;
else
    top = floor(x);
    bottom = ceil(x);
    left = floor(y);
    right = ceil(y);
end

a = x - top;
b = y - left;
value = [0, 0, 0];
for i = 1:K
    value(i) = im(top, left, i) * (1 - a) * (1 - b) + im(top, right, i) * (1 - a) * b + im(bottom, left, i) * a * (1 - b) + im(bottom, right, i) * a * b;
end
value = uint8(value);
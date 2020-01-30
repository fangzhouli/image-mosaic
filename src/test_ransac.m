clear;

load ../dat/cc1;
load ../dat/cc2;
cc1 = [cc1, [100.0, 200.0]', [2.0, 30.0]'];
cc2 = [cc2, [30.0, 70.0]', [12.0, 50.0]'];
im1 = imread('../img/input/crop1.jpg');
im2 = imread('../img/input/crop2.jpg');

H = ransac(cc1, cc2, 10000, 4, 3);
warpImage(im1, im2, H);

H = computeH(cc1, cc2);
warpImage(im1, im2, H);
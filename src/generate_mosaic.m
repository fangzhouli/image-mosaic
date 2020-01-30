close all;

load ../dat/cc1
load ../dat/cc2
crop1 = imread('../img/input/crop1.jpg');
crop2 = imread('../img/input/crop2.jpg');
H_crop = computeH(cc1, cc2);
[warpIm, mergeIm] = warpImage(crop1, crop2, H_crop);
imwrite(warpIm, '../img/output/crop_warp.jpg')
imwrite(mergeIm, '../img/output/crop_merge.jpg')

load ../dat/points
wdc1 = imread('../img/input/wdc1.jpg');
wdc2 = imread('../img/input/wdc2.jpg');
H_wdc = computeH(points1, points2);
[warpIm, mergeIm] = warpImage(wdc1, wdc2, H_wdc);
imwrite(warpIm, '../img/output/wdc_warp.jpg')
imwrite(mergeIm, '../img/output/wdc_merge.jpg')

load
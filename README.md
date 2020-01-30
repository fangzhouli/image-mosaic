# Image Mosaic Algorithm Implementation

## Description

This is a course project of ECS170 Computer Vision [1] taught by Prof. Yong Jae Lee at UC Davis. In this project, me and [Timothy Zhang](https://github.com/3tz) implemented image mosaic algorithm by applying image warping, homography, and RANSAC techniques.

## Testing

In order to reproduce our results, you can run the scripts in src directory,
```
generate_mosaic % shows examples of mosaic
test_ransac     % compares RANSAC and non-RANSAC mosaic
```

## Results

### Input Images

|![crop1](img/input/crop1.jpg)|![crop2](img/input/crop2.jpg)|
|:---:|:---:|
|Will-be-warped image|Reference image|

### Transforming

|![crop_warp](img/output/crop_warp.jpg)|![crop2](img/output/crop_merge.jpg)|
|:---:|:---:|
|Warped image|Merged image|

### RANSAC

|![crop_with](img/output/crop_with_ransac.jpg)|![crop2](img/output/crop_without_ransac.jpg)|
|:---:|:---:|
|RANSAC|Non-RANSAC|

## Credits

Special thanks to my project partner, [Timothy Zhang](https://github.com/3tz)

## Reference

- [1] https://www.cs.ucdavis.edu/blog/ecs-174-introduction-to-computer-vision/
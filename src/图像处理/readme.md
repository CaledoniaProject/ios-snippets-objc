### 圆角 UIImageView

```
imageView.layer.cornerRadius  = imageView.frame.size.width / 2;
imageView.layer.masksToBounds = YES;
```

### 指定颜色和大小

```
- (UIImage *)imageWithColor:(UIColor *)color imageSize:(CGSize)imageSize
{
    UIImage *result;
    
    UIGraphicsBeginImageContext(imageSize);
    [color setFill];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return result;
}
```

### 检查图像是否存在

```
UIImage *image = [UIImage imageNamed:@"girl_1"];

if (image) {
    // 存在
}
```

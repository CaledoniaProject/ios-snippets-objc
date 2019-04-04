用法，

首先要自定义背景图偏移量，通过继承 UILabel 并修改 `drawTextInRect` 来实现，

然后设置整体大小，这个要和图片的大小一致，

```
_genderLabel = [[GenderLabel alloc] initWithFrame:CGRectMake(8, 220, 27, 12)];
```

最后修改一下背景图、字体，

```
_genderLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"boy"]];
_genderLabel.text = @"23";
_genderLabel.font = [UIFont systemFontOfSize:9];
_genderLabel.textColor = [UIColor whiteColor];
```



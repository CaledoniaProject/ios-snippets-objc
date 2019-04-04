### 说明

先生成一个假的 tabBarItem，然后再用一个按钮覆盖他的位置即可

```
// center button
UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
UIImage *buttonImage = [[UIImage imageNamed:@"tab-publish"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
[button setBackgroundImage:buttonImage forState:UIControlStateNormal];
[button setBackgroundImage:buttonImage forState:UIControlStateHighlighted];
[button addTarget:self action:@selector(centerButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
if (heightDifference < 0)
{
    button.center = self.tabBar.center;
}
else
{
    CGPoint center = self.tabBar.center;
    center.y = center.y - heightDifference/2.0;
    button.center = center;
}
    
[self.view addSubview:button];
```
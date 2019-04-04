### hidesBottomBarWhenPushed 阴影 bug

快速解决方案，很不好的方案

```
- (void)viewWillAppear:(BOOL)animated {
    [UIView animateWithDuration:0.35f animations:^{
        [self.tabBarController.tabBar setHidden:YES];
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [UIView animateWithDuration:0.35f animations:^{
        [self.tabBarController.tabBar setHidden:NO];
    }];
}
```
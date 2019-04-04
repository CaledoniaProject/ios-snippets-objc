### 自定义 title 控件

```
self.navigationItem.titleView = [UiView new];
```

### 修改 title 颜色

```
[self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
```

### 修改 navigationBar 背景色/图片

在 `viewDidLoad` 里面，

```
UINavigationBar *navigationBar = self.navigationController.navigationBar;
navigationBar.translucent = NO;
    
UIImage *image = [UIImage imageNamed: @"bg_black.png"];
[navigationBar setBackgroundImage:image forBarMetrics: UIBarMetricsDefault];
self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
```

注意，如果不关闭透明，会发现 `Carrier` 那一块横条颜色不一致，[详情看这里](http://stackoverflow.com/questions/22844253/uinavigationbar-background-color-not-the-exact-uicolor-i-set-it-to)

### 还原默认的 navigationBar shadow

```
-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}
```

### 透明 navigationBar

清空颜色，清空边框

```
[self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
[self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
```

### 隐藏状态栏

修改 Info.plist，添加 `View controller-based status bar appearance`，设置为 false

然后在你的 ViewController 里面，增加，

```
- (BOOL)prefersStatusBarHidden
{
    return true;
}
```

如果需要动态调整，先修改上面函数的值（可以返回一个变量），然后调用，

```
[self setNeedsStatusBarAppearanceUpdate];
```



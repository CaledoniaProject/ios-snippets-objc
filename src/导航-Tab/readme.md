### 只显示图标的 Tab Bar

在 storyboard 里找到每一个 UITabBarItem，修改 Image Insets

根据图标自身的大小，e.g 修改 `top` 的值为 6px，`bottom` 为 -6px 即可

[点这里看详情](http://stackoverflow.com/questions/26494130/remove-tab-bar-item-text-show-only-image)

### 无视 UITab 的 tintColor

将 renderingMode 改为 `UIImageRenderingModeAlwaysOriginal` 即可，

```
UITabBarItem *item = self.tabBar.items[2];
item.image = [UIImage imageWithColor:[UIColor yellowColor] size:CGSizeMake(20, 20)];
item.image = [item.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
```

### 修改颜色以及背景图

属性说明，

1. tintColor 是字或者图标的颜色
2. barTintColor 是默认背景色
3. selectionIndicatorImage 是选中后的背景图

测试代码，首先继承 UITabBarController，然后在 viewDidLoad 里修改，

```
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取 tabBar 大小
    float height = self.tabBar.frame.size.height;
    float width  = self.tabBar.frame.size.width;
    unsigned long count = [self.tabBar items].count;
    
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:0.13 green:0.13 blue:0.13 alpha:1.00]];
    [[UITabBar appearance] setSelectionIndicatorImage:
     [self imageWithColor:[UIColor blackColor]
                imageSize:CGSizeMake(width / count, height)]];
}
```


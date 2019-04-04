### 只用 UITabBar，不绑定 View Controller

获取用户点击了哪个按钮，

```
- (void)tabBar:(UITabBar *)theTabBar didSelectItem:(UITabBarItem *)item {
    NSUInteger indexOfTab = [[theTabBar items] indexOfObject:item];
    NSLog(@"Tab index = %u", (int)indexOfTab);
    
//    [self.tabBar setSelectedItem:nil];
}
```
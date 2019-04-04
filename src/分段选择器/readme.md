### 带颜色，圆角的 UISegmentedControl


```
_segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"收到 38", @"送出 59"]];
_segmentedControl.selectedSegmentIndex = 0;
_segmentedControl.layer.cornerRadius = _segmentedControl.frame.size.height / 2;
_segmentedControl.layer.masksToBounds = YES;
_segmentedControl.layer.borderWidth = 1.0f;
_segmentedControl.layer.borderColor = [UIColor darkGrayColor].CGColor;
_segmentedControl.tintColor = [UIColor darkGrayColor];
```

### 修改项

貌似没有直接导出函数，可以自己实现一个，

```
- (void)setItems:(NSArray *)data
{
    [_segmentedControl removeAllSegments];
    for (NSString *item in data)
    {
        [_segmentedControl insertSegmentWithTitle:item atIndex:[data count] animated:NO];
    }
    [_segmentedControl setSelectedSegmentIndex:0];
}
```
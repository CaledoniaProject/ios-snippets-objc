### 限制最大滚动范围

设定一个 contentOffset 的最大值即可

```
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    float max = 40;
    
    if (scrollView.contentOffset.y < -max) {
        scrollView.contentOffset = CGPointMake(0, -max);
    }

//    NSLog(@"scroll %lf", scrollView.contentOffset.y);
}
```
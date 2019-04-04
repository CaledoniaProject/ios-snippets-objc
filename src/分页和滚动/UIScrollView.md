### 基本用法

关键点，

1. srollView.contentSize 必须等于 scrollView 的实际高度
2. 关闭 automaticallyAdjustsScrollViewInsets

[第二个问题具体看这里](http://stackoverflow.com/questions/5095713/disabling-vertical-scrolling-in-uiscrollview)

代码样例，

```
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    float viewHeight = self.scrollView.frame.size.height;
    float viewWidth  = self.view.frame.size.width;
    
    NSInteger numberOfViews = 3;
    for (int i = 0; i < numberOfViews; i++)
    {
        CGFloat xOrigin = i * self.view.frame.size.width;
        UIView *view    = [[UIView alloc] initWithFrame:CGRectMake(xOrigin, 0, viewWidth, viewHeight)];

        view.backgroundColor = [UIColor colorWithRed:0.5/i green:0.5 blue:0.5 alpha:1];
        [self.scrollView addSubview:view];
    }
    
    self.scrollView.contentSize = CGSizeMake(viewWidth * numberOfViews, viewHeight);
    // debug purpose
    self.scrollView.backgroundColor = [UIColor blackColor];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
    NSLog(@"end at %d", page);
}
```


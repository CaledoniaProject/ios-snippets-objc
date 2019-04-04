### 设置系统字体

可以修改大小、加粗等等

```
[aLabel setFont: [UIFont boldSystemFontOfSize:20.0]];
[aLabel setFont: [UIFont systemFontOfSize:13.0]];
```

### 为任意 UIView 添加点击事件

对于 UILabel、UIImageView，必须允许交互

```
UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(statusLabelTapped:)];

self.statusLabel.userInteractionEnabled = YES;
[self.statusLabel addGestureRecognizer:tapGesture];
```

然后添加那个 selector,

```
- (void) statusLabelTapped:(id)sender {
    ...
}
```

如果要搜索的话，貌似只能遍历全部的 subview，然后对 view.Id 进行比较

### UIView 点击事件 - 方法2

```
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch");
}
```

常见用法，跳出 UISearchBar，

```
[self.searchBar resignFirstResponder];
```

### NSAttributedText 方式修改字体和颜色

```
self.navigationController.navigationBar.titleTextAttributes = @{
    NSForegroundColorAttributeName: 
       [UIColor colorWithHue:0.02 saturation:0.71 brightness:0.84 alpha:1],
    NSFontAttributeName:
       [UIFont systemFontWithSize:13.0]
};
```

### UIView 边框颜色

```
self.view.layer.borderColor = [UIColor lightGreyColor];
self.view.layer.borderWidth = 1.0f;
```

### 为 UIView 设置 "id"

```
[image setAccessibilityIdentifier:@"file name"];
```

或者，

```
button.tag = "xxx";
```

### 实现自定义的 init 函数（storyboard）

storyboard 可能会调用其他的 init 函数，所以都要定义出来，

```
- (void)initializationCodeMethod
{
    // 我的自定义函数
}

-(id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])){
        [self initializationCodeMethod];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])){
        [self initializationCodeMethod];
    }
    return self;
}
```






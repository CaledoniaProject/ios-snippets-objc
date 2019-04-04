### 多列选择器

可以同时选择多个属性，比如日期

需要实现 `UIPickerViewDelegate, UIPickerViewDataSource` 两个协议

首先生成一个 UIPickerView，然后我们把它绑定到一个 UITextField 上看效果，

```
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    
    self.textField.inputView = pickerView;
}
```

实现代理函数，

```
// 每列分别有多少选择
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return 5;
        case 1:
            return 3;
    }
    return 2;
}

// 有多少列
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return  3;
}

// 每列都显示什么
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"Value %ld", row];
}

// 当用户选择了内容
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"picked %ld of column %ld", row, component);
}

```
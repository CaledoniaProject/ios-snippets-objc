### 获取日期

读取 date 属性，

```
_datePicker.date
```

### 只显示日期选择器

```
_datePicker.datePickerMode = UIDatePickerModeDate;
```

### 日期修改时间


```
[_datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];

...

- (void) dateChanged:(id)sender{
    // handle date changes
}
```



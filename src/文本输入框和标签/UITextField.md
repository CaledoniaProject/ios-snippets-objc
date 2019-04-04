### 设置编辑的内边距

继承 `UITextField`，

```
// placeholder position
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 10, 10);
}

// text position
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 10, 10);
}
```

### 文本变化监控

e.g 实时搜索，

```
[textField addTarget:self 
              action:@selector(textFieldDidChange:) 
    forControlEvents:UIControlEventEditingChanged];
```

### 自定义回车键

比如改为“发送”


```
_textField.returnKeyType = UIReturnKeySend;
```

### 显示清空按钮

```
_textField.clearButtonMode = UITextFieldViewModeAlways;
```
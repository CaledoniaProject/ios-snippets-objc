### 用户点击 Done，自动关闭键盘

给对应的 UITextField 设置好 delegate，然后添加函数，

```
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
```




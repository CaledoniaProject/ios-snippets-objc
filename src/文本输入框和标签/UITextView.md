### 支持 Placeholder

安装这个 pod，

```
pod 'UITextView+Placeholder', '~> 1.2'
```

然后，

```
_textView.placeholder = _placeholder;
_textView.placeholderColor = [UIColor lightGrayColor];
```

### 限制长度

比如限制为 maxLength，需要实现 delegate，

```
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    return textView.text.length + text.length - range.length <= _maxLength;
}
```




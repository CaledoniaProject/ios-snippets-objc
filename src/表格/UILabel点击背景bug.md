### 点击 UITableViewCell 后，UILabel 背景色消失

在自定义的 UITableViewCell 里，实现这两个函数，并修改 UILabel 的背景色，

这里用的是 `_countLabel`

```
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    UIColor *backgroundColor = _countLabel.backgroundColor;
    [super setHighlighted:highlighted animated:animated];
    _countLabel.backgroundColor = backgroundColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    UIColor *backgroundColor = _countLabel.backgroundColor;
    [super setSelected:selected animated:animated];
    _countLabel.backgroundColor = backgroundColor;
}
```



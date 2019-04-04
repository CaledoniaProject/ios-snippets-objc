### 基本约束

和边界绑定、限制大小等等，

```
[self.genderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(self.genderLabel.mas_bottom).offset(5);
    make.left.equalTo(self.mainImage.mas_left);
    make.width.equalTo(@27);
    make.height.equalTo(@12);
}];
```


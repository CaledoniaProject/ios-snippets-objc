### 手动添加点击事件

通常是添加 touch up inside 事件

```
[loginBtn addTarget:self action:@selector(onRegisterBtn:)
   forControlEvents:UIControlEventTouchUpInside];
```




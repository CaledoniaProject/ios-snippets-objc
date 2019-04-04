### 手动从 storyboard 中初始化 View Controller

需要在 storyboard 中，给对应的 view controller 指定一个 id，

```
UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
ViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"MyViewController"];
```




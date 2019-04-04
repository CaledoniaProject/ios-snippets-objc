### 切换 RootViewController

比如登陆和主页面切换，


```
UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"QQLoginViewController"];
[[UIApplication sharedApplication].keyWindow setRootViewController:vc];
```



### 存储和读取自定义设置

```
NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
[userDefaults setValue:@"myValue" forKey: @"key123"];
[userDefaults synchronize];
    
NSLog(@"read %@", [userDefaults objectForKey: @"key123"]);
```
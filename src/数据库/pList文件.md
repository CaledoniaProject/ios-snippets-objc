### 从 plist 中初始化

```
NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"CityData" ofType:@"plist"];
NSArray *data = [NSArray arrayWithContentsOfFile:plistPath];
```  
### 从 NSDate 获取年月日

```
NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:_datePicker.date];

NSLog(@"%ld", [components year]);
```

### 格式化 Unix 时间戳（秒）

```
NSInteger ts = 1465297522;

NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
[dateFormat setDateFormat:@"YYYY-MM-dd"];

NSDate *date = [NSDate dateWithTimeIntervalSince1970:ts];
NSString *str = [dateFormat stringFromDate:date];
```



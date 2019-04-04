### 定义数据库

```
@property sqlite3 *db;
```

### 打开数据库

```
- (void)viewDidLoad {
    ...
    if (sqlite3_open([dbPath UTF8String], &_db) != SQLITE_OK) {
        NSLog(@"Failed to open database!");
    }
    ...
}
```

### 查询

直接生成hash数组，这个函数并不通用

```
- (NSMutableArray *)query:(NSString *)sql values:(NSArray *)values
{
    sqlite3_stmt *stmt;
    NSMutableArray *ret = [NSMutableArray new];
    
    if (sqlite3_prepare_v2(self.db, [sql UTF8String], -1, &stmt, nil) == SQLITE_OK)
    {
        for (int i = 0; i < [values count]; ++ i)
        {
            // sqlite bind 从 1 开始
            NSString *value = [NSString stringWithFormat:@"%%%@%%", [values objectAtIndex:i]];
            sqlite3_bind_text(stmt, i + 1, [value UTF8String], -1, SQLITE_TRANSIENT);
        }
        
        // 将结果保存成字典，然后插入数组，这里假设都是 text
        while (sqlite3_step(stmt) == SQLITE_ROW)
        {
            NSMutableDictionary *dict = [NSMutableDictionary new];
            int column_count = sqlite3_column_count(stmt);
            for (int i = 0; i < column_count; ++ i)
            {
                // 因为知道是 text 类型
                char *key = (char *) sqlite3_column_name(stmt, i);
                char *val = (char *) sqlite3_column_text(stmt, i);
                
                [dict setValue:[NSString stringWithUTF8String:val]
                        forKey:[NSString stringWithUTF8String:key]];
            }
            
            [ret addObject:dict];
        }
    }
    
    return ret;
}
```

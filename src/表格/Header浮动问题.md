### 防止 Section Header 黏贴在屏幕顶部

将 style 改为 `UITableViewStyleGrouped` 即可

或者据说使用 footer 也可以，因为 footer 不滚动（未测试）

注意，在这种模式下，footer 的高度不能是 0，所以可以写个 0.01 之类的值，

```
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}
```

### 去掉 header shadow 的问题

将 separator 改成 `UITableViewCellSeparatorStyleSingleLine` 

或者用代码，

```
_tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
```
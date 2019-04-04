### UITableView footer 不会收到点击事件

因为 footer 的 frame 默认是0，所以在 footer 里面的都收不到点击事件

即使是用 _tableView.tableFooterView = xxx 的形式，也一样

需要手动设置一个高度或者frame，并至少包含到需要接收点击事件的控件

```
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0)
    {
        return _loginView;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return [_loginView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
}
```



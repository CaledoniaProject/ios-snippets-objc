### 删除footer以及最后一个cell的边框

```
self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 1)];
```

### 刷新数据

```
[self.tableView reloadData];
```

### 修改默认的行 border

storyboard 中定位到 prototype cell，在 `Table View Cell` 下面有个 `separator`，改为 `Custom insets`，并全部设置为 0，即可获得全长度的 bottom border

### Footer 或者 Header 颜色和 SuperView 的颜色不一致？

将 section 之间的 view 颜色改成透明的，

```
- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
{
    view.tintColor = [UIColor clearColor];
}
```

### 自定义右侧控件

常用于头像、开关等

frame 需要手动设定

```
if (indexPath.section == 0 && indexPath.row == 0) {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"avatar_17"]];
    imageView.frame = CGRectMake(0, 0, 40, 40);
    ...
    cell.accessoryView = imageView;
}
```


### 手动获取指定 Cell

首先生成 NSIndexPath，然后调用表格相关函数

```
NSIndexPath *indexPath = [NSIndexPath indexPathForRow:rand() % 9
                                                inSection:0];
UserAvatarViewCell *cell = (UserAvatarViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
[self rotateImage:cell.imageView];
```





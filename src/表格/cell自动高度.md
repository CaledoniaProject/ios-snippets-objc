### UITableViewCell 自动高度

首先要有一个估计的高度，

```
_tableView.rowHeight = UITableViewAutomaticDimension;
_tableView.estimatedRowHeight = 100;
```

然后在 cell 里，增加足够的 constraints，上下必须都顶头，否则会有warning

```
[topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
   ...
   make.top.equal(self.contentView.mas_top).offset(8);
   ...
}]

...

[bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
   make.bottom.equal(self.contentView.mas_bottom).offset(-8);
}]
```

### UICollectionView in UITableViewCell

如果cell里面有一个collectionView，那么，

1. 关闭 collectionView 滚动和bounce
2. 为 collectionView 设置一个 height constraint，并在修改内容后更新这个限制


```
int rows = ceil([_avatars count] / ITEMS_PER_ROW);
float screen_width = [[UIScreen mainScreen] bounds].size.width;
float estimatedHeight = screen_width / 3 * rows;
    
[_collectionView reloadData];
[_collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
    make.edges.equalTo(self.contentView);
    make.height.greaterThanOrEqualTo([NSNumber numberWithFloat:estimatedHeight]).priorityHigh();
}];
```

为了避免冲突，我们直接把高度这个constraint设置为最高优先级







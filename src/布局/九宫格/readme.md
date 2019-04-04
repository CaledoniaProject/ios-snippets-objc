### UICollectionView 九宫格布局

1. 复制 GridViewLayout 两个文件到项目目录，添加进去
2. 添加一个 UIViewController，继承 UICollectionViewController，不要创建 xib
3. 在 storyboard 中拖拽一个 UICollectionViewController，设置好 Class Name，以及布局的 Class Name
4. 为 prototype cell 新建一个 class，不要创建 xib
5. 开始编辑 prototype cell，并修改它的 `Reuse Identifier`

最后添加数据源相关函数，

```
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 12;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"avatarCell";

    AvatarViewCell *avatarCell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [avatarCell.avatarImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"girls_%ld.jpg", indexPath.row + 1]]];
    
    ...
    
    return avatarCell;
}
```

#### 注意事项

如果 GridViewLayout 的 minimumSpacing 设置为 0，会出现bug
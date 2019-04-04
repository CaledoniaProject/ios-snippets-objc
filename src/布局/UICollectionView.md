### 基本用法

查看九宫格里面的 readme

### 没有 storyboard 怎么实现 reuseable cell

注册一下 class 即可，

```
[_collectionView registerClass:UserImageViewCell.class forCellWithReuseIdentifier:@"UserImageViewCell"];
```

### 自定义 header

UICollectionView 不支持自定义 header，需要用 supplementary elemen，

```
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader)
    {
        UserBaseHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"userBaseHeader" forIndexPath:indexPath];
        header.imageView.image = [UIImage imageNamed:@"avatar_28"];
        header.usernameLabel.text = @"樂樂Baby";
        return header;
    }
    
    return nil;
}
```

注意：如果在 xcode 把 layout 设置为自定义的话，是不能开启 header 和 footer 的，修改 layout 需要用代码修改


### 修改 header 大小

```
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
{
    return CGSizeMake(self.collectionView.frame.size.width, 180);
}
```

### 单选 - 勾选效果

在自定义cell里实现一个函数，

```
- (void)setSelected:(BOOL)selected
{
    if (selected)
    {
        [self.checkImage setHidden:NO];
        self.contentView.backgroundColor = [UIColor colorWithRed:0.89 green:0.89 blue:0.89 alpha:1.00];
    }
    else
    {
        [self.checkImage setHidden:YES];
        self.contentView.backgroundColor = [UIColor clearColor];
    }
}
```

然后在 collectionView delegate 里实现，

```
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MiniGiftCell *cell = (MiniGiftCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell setSelected:YES];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MiniGiftCell *cell = (MiniGiftCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell setSelected:NO];
}
```






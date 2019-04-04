### 类似微信的配置

先安装 `TBActionSheet` 这个 pod

```
- (void)actionSheet:(TBActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"click button:%ld",(long)buttonIndex);
}

- (void)actionSheet:(TBActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"willDismiss");
}

- (void)actionSheet:(TBActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"didDismiss");
}

- (void) moreAction:(id)sender {
    TBActionSheet *actionSheet = [[TBActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:@"举报"
                                                    otherButtonTitles:nil, nil];
    actionSheet.sheetWidth = self.contentView.frame.size.width;
    actionSheet.rectCornerRadius = 0;
    actionSheet.offsetY = 0;
    actionSheet.backgroundTransparentEnabled = NO;
    
    [actionSheet show];
}
```
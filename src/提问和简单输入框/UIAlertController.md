## 用于代替 ActionSheet 方式

```
UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
[actionSheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
}]];
        
[actionSheet addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
}]];
        
[actionSheet addAction:[UIAlertAction actionWithTitle:@"相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
}]];
       
[self presentViewController:actionSheet animated:YES completion:nil];
```

### Alert 方式

```    
UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"相机或者相册不可用" message:nil preferredStyle:UIAlertControllerStyleAlert];
 
[alertView addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil]];
[self presentViewController:alertView animated:YES completion:nil];
```



- (void) openSettings
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
}

- (void)getAvatar:(UIImagePickerControllerSourceType)sourceType
{
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:nil];
    
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusDenied ||
        authStatus == AVAuthorizationStatusRestricted) {
        
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"未开启相机或者相册权限"
                                                                           message:nil
                                                                    preferredStyle:UIAlertControllerStyleAlert];
        
        [alertView addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [alertView addAction:[UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self openSettings];
        }]];
        [self presentViewController:alertView animated:YES completion:nil];
        
        return;
    }
    
    // 检查相机是否可用
    if (! [UIImagePickerController isSourceTypeAvailable: sourceType]) {
        UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"相机或者相册不可用"
                                                                           message:nil
                                                                    preferredStyle:UIAlertControllerStyleAlert];
        
        [alertView addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alertView animated:YES completion:nil];
        
        return;
    }
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = sourceType;
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.avatar = [info valueForKey:UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    [self.tableView reloadData];
}



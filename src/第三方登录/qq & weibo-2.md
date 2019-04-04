### qq & weibo 代码接入

注意，这个腾讯的sdk不是官方的，官方的没法在64位下用，不知道为啥

```
pod 'WeiboSDK', :git => 'https://github.com/sinaweibosdk/weibo_ios_sdk.git'
pod 'TencentOpenApiSDK'
```

打开 xcode，选中你的 target，右侧打开 Build Phrases，向下翻找到 `Link Binary With Libraries`，添加 

```
libsqlite3
SystemConfiguration.framework
CoreMotion.framework
CoreTelephony.framework
```

打开 AppDelegate.h，添加 delegate,

```
#import "WeiboSDK.h"
#import <TencentOpenAPI/TencentOAuth.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate, WeiboSDKDelegate>
```

在 didFinishLanuching，

```
[WeiboSDK registerApp:@"123456789"];
```

修改 openURL，

```
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [WeiboSDK handleOpenURL:url delegate:self] || [TencentOAuth HandleOpenURL:url];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
{
    return [WeiboSDK handleOpenURL:url delegate:self] || [TencentOAuth HandleOpenURL:url];
}
```

在你的 login 控制器里，触发登录事件，

```
- (void)loginWithQQ:(id)sender
{
    NSLog(@"login with qq");
    
    _tencentOAuth = [[TencentOAuth alloc] initWithAppId:@"1105490148" andDelegate:self];
    [_tencentOAuth authorize:[NSArray arrayWithObjects:kOPEN_PERMISSION_GET_INFO, kOPEN_PERMISSION_GET_USER_INFO, kOPEN_PERMISSION_GET_SIMPLE_USER_INFO, nil]];
}

- (void)loginWithWeibo:(id)sender
{
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = @"http://";
    request.scope = @"all";
    
    [WeiboSDK sendRequest:request];
}
```

登录成功的代理方法，

```
- (void)tencentDidLogin
{
    NSLog(@"登陆成功");
    NSLog(@"access_token = %@", _tencentOAuth.accessToken);
    
    [_tencentOAuth getUserInfo];
}

- (void)tencentDidNotNetWork
{
    NSLog(@"QQ登陆: 网络链接失败");
}

- (void)tencentDidNotLogin:(BOOL)cancelled
{
    if (cancelled)
    {
        NSLog(@"QQ登陆: 用户取消");
    }
    else
    {
        NSLog(@"QQ 登陆失败");
    }
}

- (void)getUserInfoResponse:(APIResponse *)response
{
    NSLog(@"nick   = %@", response.jsonResponse[@"nickname"]);
    NSLog(@"gender = %@", response.jsonResponse[@"gender"]);
    NSLog(@"openid = %@", [_tencentOAuth getUserOpenID]);
}
```





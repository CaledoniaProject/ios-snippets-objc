### 加载非 https url 的问题

iOS 9 开始，禁止加载非 https 的 url，如果要开启，需要添加相关权限

找到 `App Transport Security Settings (NSAppTransportSecurity)`，添加一个 `NSAllowsArbitraryLoads` 权限，

### 加载 url

注意: webview 自带进度条

```
[self.webView loadRequest:
	[[NSURLRequest alloc] initWithURL:
		[NSURL URLWithString:@"http://www.baidu.com"]
	]
];
```



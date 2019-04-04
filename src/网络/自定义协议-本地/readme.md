### 自定义协议


```
@implementation FakeProtocol

+ (BOOL)canInitWithRequest:(NSURLRequest *)request
{
    return [[[request URL] scheme] isEqualToString:@"secure"];
}

+ (NSURLRequest*)canonicalRequestForRequest:(NSURLRequest*)theRequest
{
    return theRequest;
}

- (void)startLoading
{
    NSURLRequest *request = [self request];
    
    NSLog(@"URL %@", [[request URL] absoluteString]);
    
    NSData *data = [@"<script>alert(123)</script>" dataUsingEncoding:NSUnicodeStringEncoding];
    [self mockRequest:request mimeType:@"text/html" data:data];
}

- (void)stopLoading
{
    NSLog(@"Did stop loading");
}

+ (BOOL)request:(NSURLRequest*)request contains:(NSString*)domain 
{
    NSString *str = [[request URL] absoluteString];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@", domain];
    return [pred evaluateWithObject:str];
}

-(void) mockRequest:(NSURLRequest*)request mimeType:(NSString*)mimeType data:(NSData*)data {
    id client = [self client];
    
    NSHTTPURLResponse *response = [[NSHTTPURLResponse alloc] initWithURL:[request URL] MIMEType:mimeType expectedContentLength:-1 textEncodingName:nil];
    
    [client URLProtocol:self didReceiveResponse:response
     cacheStoragePolicy:NSURLCacheStorageNotAllowed];
    [client URLProtocol:self didLoadData:data];
    [client URLProtocolDidFinishLoading:self];
}

@end
```

### 测试代码

如要加载 `secure://123` 这个url，

首先要注册  FakeProtocol 协议

```
[NSURLProtocol registerClass:[FakeProtocol class]];

[self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"secure://123"]]];
```
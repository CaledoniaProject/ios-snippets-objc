//
//  WebViewController.h
//  qiqi-tab
//
//  Created by Aaron on 5/29/16.
//  Copyright © 2016 whatever. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface WebViewController : UIViewController <WKNavigationDelegate>
@property (strong, nonatomic) WKWebView *webView;

- (void)loadUrl:(NSString *)url;
@end

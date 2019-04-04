//
//  TabBarController.m
//  qiqi
//
//  Created by Aaron on 6/15/16.
//  Copyright © 2016 whatever. All rights reserved.
//

#import "TabBarController.h"
#import "UIImage+ImageWithColor.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // bg
    [self.tabBar setValue:@(YES) forKeyPath:@"_hidesShadow"];
    
    self.tabBar.translucent = NO;
    self.tabBar.tintColor = [UIColor whiteColor];
    self.tabBar.barTintColor = [UIColor colorWithRed:0.17 green:0.17 blue:0.18 alpha:1.00];
    
    // items
    UITabBarItem *homeItem = [[UITabBarItem alloc] initWithTitle:@"主页"
                                                           image:[UIImage imageNamed:@"tab-home"]
                                                   selectedImage:[UIImage imageNamed:@"tab-home-selected"]];
    UITabBarItem *meItem = [[UITabBarItem alloc] initWithTitle:@"我的"
                                                         image:[UIImage imageNamed:@"tab-me"]
                                                 selectedImage:[UIImage imageNamed:@"tab-me-published"]];
    UITabBarItem *middleItem = [[UITabBarItem alloc] init];

    // center button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *buttonImage = [[UIImage imageNamed:@"tab-publish"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:buttonImage forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(centerButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0)
        button.center = self.tabBar.center;
    else
    {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        button.center = center;
    }
    
    [self.view addSubview:button];
    
    // view controllers
    UIViewController *controller1 = [[UIViewController alloc] init];
    controller1.view.backgroundColor = [UIColor redColor];
    [controller1 setTabBarItem:homeItem];
    
    UIViewController *controller2 = [[UIViewController alloc] init];
    controller2.view.backgroundColor = [UIColor yellowColor];
    [controller2 setTabBarItem:middleItem];
    
    UIViewController *controller3 = [[UIViewController alloc] init];
    controller3.view.backgroundColor = [UIColor blueColor];
    [controller3 setTabBarItem:meItem];
    
    [self setViewControllers:@[controller1, controller2, controller3]];
}

- (void)centerButtonTapped:(id)sender
{
    NSLog(@"present something");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

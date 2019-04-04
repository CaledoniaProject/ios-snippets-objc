//
//  GenderLabel.m
//  qiqisimple
//
//  Created by Aaron on 5/22/16.
//  Copyright © 2016 whatever. All rights reserved.
//

#import "GenderLabel.h"

@implementation GenderLabel

- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = {1, 13, 0, 0};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end

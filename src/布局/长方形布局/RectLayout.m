//
//  RectLayout.m
//  qiqi-tab
//
//  Created by Aaron on 6/2/16.
//  Copyright © 2016 whatever. All rights reserved.
//

#import "RectLayout.h"

@implementation RectLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.itemsPerRow = 3;
        self.itemHeight  = 100;
        self.minimumInteritemSpacing = 1;
        self.minimumLineSpacing      = 1;
    }
    return self;
}

- (void) prepareLayout
{
    [super prepareLayout];
    
    CGSize newSize   = self.itemSize;
    newSize.height   = _itemHeight;
    
    int totalSpacing = self.minimumInteritemSpacing * (_itemsPerRow - 1);
    newSize.width    = (self.collectionView.bounds.size.width - totalSpacing) / _itemsPerRow;
    
    self.itemSize = newSize;
}

@end

#import "GridViewLayout.h"

@interface GridViewLayout ()

@end

@implementation GridViewLayout

- (void) prepareLayout
{
    [super prepareLayout];
    
    self.minimumInteritemSpacing = 1;
    self.minimumLineSpacing      = 1;
    
    CGSize newSize   = self.itemSize;
    
    int itemsPerRow  = 3;
    int totalSpacing = self.minimumInteritemSpacing * (itemsPerRow - 1);
    newSize.width    = (self.collectionView.bounds.size.width - totalSpacing) / itemsPerRow;
    
    if (self.itemSize.height > 0)
    {
        newSize.height = newSize.width / (self.itemSize.height / self.itemSize.width);
    }
    
    self.itemSize = newSize;
}

@end

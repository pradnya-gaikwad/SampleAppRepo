#import "TCollectionViewCell.h"



@implementation TCollectionViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)downloadImageFromURL:(NSString *)inImageURL
{
    dispatch_queue_t q = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    
    dispatch_async(q, ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:inImageURL]];
        UIImage *image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.imgView setImage:image];
            [self.indicator stopAnimating];
        });
    });

}

@end

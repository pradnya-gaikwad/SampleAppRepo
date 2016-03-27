#import <UIKit/UIKit.h>

@interface TCollectionViewCell : UICollectionViewCell

@property ( nonatomic, strong ) NSString *imgURl;

@property ( nonatomic, strong ) IBOutlet UIImageView *imgView;
@property ( nonatomic, strong ) IBOutlet UIActivityIndicatorView *indicator;

- (void)downloadImageFromURL:(NSString *)inImageURL;

@end

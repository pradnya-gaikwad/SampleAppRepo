#import <UIKit/UIKit.h>

@interface TImageTableViewCell : UITableViewCell

@property ( nonatomic, strong ) IBOutlet UIImageView *imgView;
@property ( nonatomic, strong ) IBOutlet UILabel *lblTitle;
@property ( nonatomic, retain ) IBOutlet UILabel *lblSubTitle;


@end

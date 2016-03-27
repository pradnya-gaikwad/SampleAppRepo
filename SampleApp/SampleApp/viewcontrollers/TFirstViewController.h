#import <UIKit/UIKit.h>


typedef enum TCellType {
    TCellTypeMainView = 0,
    TCellTypeModalView,
    TCellTypeBulbImage,
    TCellTypeCalendar,
    TCellTypeImageTitleSubtitle,
} TCellType;


@interface TFirstViewController : UIViewController
{
    NSString *selectedDate;
}
@property ( nonatomic, strong ) IBOutlet UITableView *tblView;

#pragma mark -
#pragma mark Method Groups
#pragma mark

@end


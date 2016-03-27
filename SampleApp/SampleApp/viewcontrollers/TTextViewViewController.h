#import <UIKit/UIKit.h>

@interface TTextViewViewController : UIViewController<UIScrollViewDelegate>
{
    NSMutableArray *arrImages;
    BOOL pageControlUsed;

}


@property ( nonatomic, strong ) IBOutlet UIPageControl *pageCtrl;
@property ( nonatomic, strong ) IBOutlet UIScrollView *scrollView;
@property ( nonatomic, strong ) IBOutlet UITextView *txtView;


@end

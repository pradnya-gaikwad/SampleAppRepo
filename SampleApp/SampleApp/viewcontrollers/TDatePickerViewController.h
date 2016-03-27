#import <UIKit/UIKit.h>

@protocol TDatePickerViewDelegate
-(void)datePickerDelegate:(NSString *)inDate;
@end

@interface TDatePickerViewController : UIViewController
{
}

@property ( nonatomic, strong ) IBOutlet UIDatePicker *datePicker;
@property ( nonatomic, strong ) NSDate *dateValue;
@property ( nonatomic, strong ) IBOutlet UILabel *lblDateSelected;
@property ( nonatomic, strong ) IBOutlet UIBarButtonItem *btnDone;
@property ( nonatomic, strong ) IBOutlet UIBarButtonItem *btnCancel;


@property (assign) id delegate;
@end

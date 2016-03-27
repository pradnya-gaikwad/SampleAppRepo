#import "TDatePickerViewController.h"

@implementation TDatePickerViewController

#pragma mark -
#pragma mark Private methods
#pragma mark -

// -----------------------------------------------------------------------------

- (NSString *)dateStringFromDate:(NSDate *)inDate
{
    NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
    [dateformate setDateFormat:@"MM/dd/yyyy"]; // Date formater
    NSString *date = [dateformate stringFromDate:inDate];
    
    return date;
}

#pragma mark -
#pragma mark Initialization & Dealloc
#pragma mark

// -----------------------------------------------------------------------------

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// -----------------------------------------------------------------------------

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Date";
    [self.navigationItem setRightBarButtonItem:self.btnDone];
    [self.navigationItem setLeftBarButtonItem:self.btnCancel];
    
    // Set the date
    self.lblDateSelected.text = [self dateStringFromDate:self.datePicker.date];
}

// -----------------------------------------------------------------------------

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

// -----------------------------------------------------------------------------

-( IBAction)actionDone:(id)sender
{
    if ( self.delegate && [self.delegate respondsToSelector:@selector(datePickerDelegate:)]){
        [self.delegate datePickerDelegate:[self dateStringFromDate:self.datePicker.date]];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

// -----------------------------------------------------------------------------

- (IBAction)actionCancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
 
}

// -----------------------------------------------------------------------------

- (IBAction)dateChanged:(id)sender
{
    NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
    [dateformate setDateFormat:@"MM/dd/yyyy"]; // Date formater
    NSString *date = [dateformate stringFromDate:self.datePicker.date];
    self.lblDateSelected.text = date;
}

@end

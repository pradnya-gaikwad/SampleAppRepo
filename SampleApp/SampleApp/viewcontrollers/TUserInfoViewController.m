#import "TUserInfoViewController.h"

@implementation TUserInfoViewController

#pragma mark -
#pragma mark Initialization & Dealloc
#pragma mark

// -----------------------------------------------------------------------------
// initWithNibName: bundle:
//
// This initializer ignores both arguments passed to it.

- (id)initWithNibName:(NSString *)inNibNameOrNil bundle:(NSBundle *)inNibBundleOrNil
{
    // Call super with correct nib name
    if (self = [super initWithNibName:@"TUserInfoView" bundle:nil])
    {
        // Custom initialization
    }
    return self;
}

// -----------------------------------------------------------------------------
// dealloc

- (void)dealloc
{
    // Call super
}

#pragma mark -
#pragma mark Standard Overrides
#pragma mark

// -----------------------------------------------------------------------------
// viewDidLoad

- (void)viewDidLoad
{
    // Call super
    [super viewDidLoad];
    [self.navigationItem setTitle:@"User Info"];
    [self.navigationItem setRightBarButtonItem:self.btnDone];
    [self.navigationItem setLeftBarButtonItem:self.btnCancel];
}

// -----------------------------------------------------------------------------
// viewWillAppear:

- (void)viewWillAppear:(BOOL)inAnimated
{
    // Call super
    [super viewWillAppear:inAnimated];
}

// -----------------------------------------------------------------------------
// viewWillDisappear:

- (void)viewWillDisappear:(BOOL)inAnimated
{
    // Call super
    [super viewWillDisappear:inAnimated];
}

// -----------------------------------------------------------------------------

- (IBAction)actionDone:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end


#import "TFirstViewController.h"
#import "TDisclosureInfoButtonCell.h"
#import "TBulbImageCell.h"
#import "TDatePickerCellTableViewCell.h"
#import "TImageTableViewCell.h"
#import "TCollectionViewController.h"
#import "TDatePickerViewController.h"
#import "TUserInfoViewController.h"

@implementation TFirstViewController

#pragma mark -
#pragma mark Private Methods
#pragma mark

// -----------------------------------------------------------------------------

- (IBAction)presentViewModally:(id)sender
{
    TUserInfoViewController *viewCon = [[TUserInfoViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *navCon = [[UINavigationController alloc] initWithRootViewController:viewCon];
    [self.navigationController presentViewController:navCon animated:YES completion:nil];
}

// -----------------------------------------------------------------------------

- (IBAction)pickDate:(id)sender
{
    TDatePickerViewController *viewCon = [[TDatePickerViewController alloc] initWithNibName:nil bundle:nil];
    viewCon.delegate = self;
    [self.navigationController pushViewController:viewCon animated:YES];
}

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
    if (self = [super initWithNibName:@"TFirstView" bundle:nil])
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
    [self.navigationItem setTitle:@"Main View"];
    // Call super
    [super viewDidLoad];
    self.tblView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
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
// numberOfSectionsInTableView:

- (NSInteger)numberOfSectionsInTableView:(UITableView *)inTableView
{
    NSInteger count = 1;
	return count;
}


// -----------------------------------------------------------------------------
// tableView: numberOfRowsInSection:

- (NSInteger)tableView:(UITableView *)inTableView
numberOfRowsInSection:(NSInteger)inSection
{
    NSInteger count = 5;
    
    // Return
    return count;
}


// -----------------------------------------------------------------------------
// tableView: cellForRowAtIndexPath:

- (UITableViewCell *)tableView:(UITableView *)inTableView
		 cellForRowAtIndexPath:(NSIndexPath *)inIndexPath
{
	static NSString *cellIdentifier = @"CellIdentifier";
	
    // Intialize cell
	UITableViewCell *cell = (UITableViewCell *)[inTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if ( cell == nil ) 
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
									  reuseIdentifier:cellIdentifier];
    }
	
    
    // Design cell accordingly
    switch ( inIndexPath.row ) {
        case TCellTypeMainView:
            // Set up cell
            cell.textLabel.text = @"Push View";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case TCellTypeModalView:
        {
            NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"TDisclosureInfoButtonCell" owner:self options:nil];
            TDisclosureInfoButtonCell *tempCell = (TDisclosureInfoButtonCell *)[nibs objectAtIndex:0];
            tempCell.lblTitle.text = @"Modal View";
            [tempCell.btnInfo addTarget:self action:@selector(presentViewModally:) forControlEvents:UIControlEventTouchUpInside];
            cell = tempCell;
            break;
        }
        case TCellTypeBulbImage:
        {
            NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"TBulbImageCell" owner:self options:nil];
            TBulbImageCell *tempCell = (TBulbImageCell *)[nibs objectAtIndex:0];
            cell = tempCell;
            break;
        }
        case TCellTypeCalendar:
        {
            NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"TDatePickerCellTableViewCell" owner:self options:nil];
            TDatePickerCellTableViewCell *tempCell = (TDatePickerCellTableViewCell *)[nibs objectAtIndex:0];
            [tempCell.btnDate addTarget:self action:@selector(pickDate:) forControlEvents:UIControlEventTouchUpInside];
            
            if ( selectedDate != nil ){
                tempCell.txtDate.text = selectedDate;
            }
            cell = tempCell;
            break;
        }
        case TCellTypeImageTitleSubtitle:
        {
            NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"TImageTableViewCell" owner:self options:nil];
            TImageTableViewCell *tempCell = (TImageTableViewCell *)[nibs objectAtIndex:0];
            
            [tempCell.imgView setImage:[UIImage imageNamed:@"NoImage.png"]];
            [tempCell.lblTitle setText:@"Pradnya Gaikwad"];
            [tempCell.lblSubTitle setText:@"iOS developer"];
            cell = tempCell;
            break;
        }
    }
		
	// Return
	return cell;
}

// -----------------------------------------------------------------------------
// didSelectRowAtIndexPath

- (void)tableView:(UITableView *)inTableView didSelectRowAtIndexPath:(NSIndexPath *)inIndexPath
{
	// Deselect row
    [inTableView deselectRowAtIndexPath:inIndexPath animated:YES];
    switch (inIndexPath.row)
    {
        case TCellTypeMainView:
        {
            TCollectionViewController *con = [[TCollectionViewController alloc] initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:con animated:YES];
            break;
        }
        case TCellTypeModalView:
        {
            break;
        }
        case TCellTypeCalendar:
        {
            TDatePickerViewController *viewCon = [[TDatePickerViewController alloc] initWithNibName:nil bundle:nil];
            viewCon.delegate = self;
            [self.navigationController pushViewController:viewCon animated:YES];
            break;
        }

    }
}

// -----------------------------------------------------------------------------

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    // Set height to cell accordingly
    CGFloat height = 44.0;
    if ( indexPath.row == TCellTypeImageTitleSubtitle ) {
        height = 80.0;
    }
    return height;
}

#pragma mark -
#pragma mark DatePickercontroller delegate
#pragma mark -

// -----------------------------------------------------------------------------

-(void)datePickerDelegate:(NSString *)inDate
{
    selectedDate = inDate;
    [self.tblView reloadData];
}

@end


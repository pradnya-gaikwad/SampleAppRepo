
#import "TTextViewViewController.h"

@interface TTextViewViewController ()

@end

@implementation TTextViewViewController

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
    if (self = [super initWithNibName:@"TTextViewView" bundle:nil])
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
    [self.navigationItem setTitle:@"Text View & Scroll View"];
    
    // Call super
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.navigationController.navigationBar.translucent = NO;
    
    pageControlUsed = NO;
    
    // Set delegate of scrollview
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    
    // Add imageview in scrollview
    arrImages = [NSMutableArray arrayWithObjects:@"image1.jpg",@"image2.jpg",@"image3.jpg", nil];
    for ( int i = 0; i < [arrImages count]; i++) {
        
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
        
        UIImageView *subView = [[UIImageView alloc]initWithFrame:frame];
        [subView setImage:[UIImage imageNamed:[arrImages objectAtIndex:i]]];
        
        // Add imageview
         [self.scrollView addSubview:subView];
    }
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * [arrImages count],0);
    self.pageCtrl.currentPage = 0;
    self.pageCtrl.numberOfPages = [arrImages count];
    
    
    NSString *str = [NSString stringWithFormat:@"Address:\n%@ \n\n Phone No:\n%d\n\n Emails:\n%@\n",@"www.google.com",1234567890,@"pradnya_ps@yahoo.co.in"];
    self.txtView.text = str;
    
    // Detect links, phone no and email addresses
    self.txtView.dataDetectorTypes = UIDataDetectorTypeAll;
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


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (!pageControlUsed)
    {
        CGFloat pageWidth = self.scrollView.frame.size.width;
        int page = floor((self.scrollView.contentOffset.x - pageWidth / 2 ) / pageWidth) + 1;
        self.pageCtrl.currentPage = page;
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
}

// valueChanged event
- (IBAction)changePage:(id)sender {
    
//    CGRect frame;
//    frame.origin.x = self.scrollView.frame.size.width * self.pageCtrl.currentPage;
//    frame.origin.y = 0;
//    frame.size = self.scrollView.frame.size;
//    [self.scrollView scrollRectToVisible:frame animated:YES];
//    pageControlUsed = YES;
    
}



@end

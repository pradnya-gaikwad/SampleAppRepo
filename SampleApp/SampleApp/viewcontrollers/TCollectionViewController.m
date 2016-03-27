#import "TCollectionViewController.h"
#import "TCollectionViewCell.h"

@implementation TCollectionViewController

#pragma mark -
#pragma mark Private Methods
#pragma mark

// -----------------------------------------------------------------------------
// updateNavigationBarAnimated:

- (void)updateNavigationBarAnimated:(BOOL)animated
{
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
    if (self = [super initWithNibName:@"TCollectionView" bundle:nil])
    {
        NSString *imageString = @"http://dummyimage.com/100.png/09f/fff";
        images = [NSArray arrayWithObjects:imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,imageString,nil];
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
    
    [self.navigationItem setTitle:@"List"];
    
    // Register nib
    [self.collectionView registerNib:[UINib nibWithNibName:@"TCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
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

#pragma mark -
#pragma mark Collection View methods
#pragma mark -

// -----------------------------------------------------------------------------


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [images count];
}

// -----------------------------------------------------------------------------

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    NSString *identifier = @"Cell";
    TCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    // Downlaod the image
    [cell downloadImageFromURL:[images objectAtIndex:indexPath.item]];
        
    return cell;
}

@end


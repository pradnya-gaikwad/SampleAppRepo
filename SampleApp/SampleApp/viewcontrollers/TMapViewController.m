#import "TMapViewController.h"

@implementation TMapViewController

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
    if (self = [super initWithNibName:@"TMapView" bundle:nil])
    {
        // Custom initialization
    }
    return self;
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
    
    // Title
    [self.navigationItem setTitle:@"Map"];
    
    // Configure location
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager requestWhenInUseAuthorization];
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

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    // Remove previous annotation
    for (id <MKAnnotation> annotation in self.mapView.annotations){
        [self.mapView removeAnnotation:annotation];
    }
    
    // Region
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 250, 250);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    // Create annotation oin
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    point.title = [NSString stringWithFormat:@"Longitude : %4f",userLocation.coordinate.longitude];
    point.subtitle = [NSString stringWithFormat:@"Latitude : %4f",userLocation.coordinate.longitude];
    
    [self.mapView addAnnotation:point];
}


@end


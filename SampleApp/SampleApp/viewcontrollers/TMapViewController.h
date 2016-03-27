#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface TMapViewController : UIViewController<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}

@property ( nonatomic, strong ) IBOutlet MKMapView *mapView;

#pragma mark -
#pragma mark Method Groups
#pragma mark

@end

#import <UIKit/UIKit.h>
#import "TFirstViewController.h"
#import "TMapViewController.h"
#import "TTextViewViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    TFirstViewController *firstViewController;
    TMapViewController   *mapViewController;
    TTextViewViewController *textViewController;
    
}

@property (strong, nonatomic) UIWindow *window;
@property ( strong, nonatomic ) UITabBarController *tabbarController;


@end


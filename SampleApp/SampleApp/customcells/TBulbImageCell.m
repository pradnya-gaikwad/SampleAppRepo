#import "TBulbImageCell.h"

@implementation TBulbImageCell

// -----------------------------------------------------------------------------

- (void)awakeFromNib
{
    // Initialization code
}

// -----------------------------------------------------------------------------

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// -----------------------------------------------------------------------------

- (IBAction)toggleBulb:(id)sender
{
    BOOL isON = [self.btnSwitch isOn];
    
    if ( !isON)
        [self.imgBulb setImage:[UIImage imageNamed:@"bulbOff.png"]];
    else
        [self.imgBulb setImage:[UIImage imageNamed:@"bulbON.png"]];

}

@end

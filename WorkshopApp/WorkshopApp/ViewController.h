//
//  ViewController.h
//  WorkshopApp
//
//  Created by Elliot on 10/10/15.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UIImageView* ballView;
}

@property (weak, nonatomic) IBOutlet UISlider* speedSlider;
@property (weak, nonatomic) IBOutlet UISwitch* movementSwitch;
@property (weak, nonatomic) IBOutlet UIButton* centerButton;

- (IBAction)centerTheBall: (id)sender;

@end


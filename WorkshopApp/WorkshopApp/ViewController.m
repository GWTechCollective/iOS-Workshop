//
//  ViewController.m
//  WorkshopApp
//
//  Created by Elliot on 10/10/15.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize speedSlider;
@synthesize movementSwitch;
@synthesize centerButton;


// ------------------------------------------------------------
// viewDidLoad
//
// Called when the view is finished being loaded into memory.
// This is where you setup things you need for this view, so
// in this case, we're setting up our ball image.
// ------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // load the ball image, creating and positioning a view for it
    UIImage* ball = [UIImage imageNamed: @"Ball.png"];
    ballView = [[UIImageView alloc] initWithImage: ball];
    [[self view] addSubview: ballView];
    [ballView setFrame: CGRectMake(100, 100, 60, 60)];
}


// ------------------------------------------------------------
// didReceiveMemoryWarning
//
// Called when the iPhone/iPad this app is running on is low on
// memory and needs to free up some space. Here is where you can
// release objects and other resources that can be recreated
// later.
// ------------------------------------------------------------
- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


// ------------------------------------------------------------
// touchesBegan:withEvent:
//
// Called when the user touches the screen (or the mouse clicks
// on the simulator).
// ------------------------------------------------------------
- (void) touchesBegan: (NSSet<UITouch*>*)touches withEvent: (UIEvent*)event
{
    // only move the ball if the switch is set to on
    if (movementSwitch.on)
    {
        // get the location of where the user touched the screen
        UITouch* touch = [[event allTouches] anyObject];
        CGPoint location = [touch locationInView: touch.view];
        
        // this function animates whatever we put in the curly braces
        // set the animation speed to be the value of the slider
        // set the delay to 0 so the animation starts immediately
        //
        // the options parameter lets us specify how we want the animation to occur,
        // so in this case, the "ease out" means that as the animation is ending,
        // instead of immediately stopping, it slows down and comes to a stop gradually. Cmd + click
        // on "UIViewAnimationOptionCurveEaseOut" to see what other animation options there are.
        //
        // the completion parameter allows us to specify if we want anything to happen
        // when the animation finishes. Since we don't have anything that we want to
        // happen, we can just pass in nil. (nil is equivalent to NULL in other languages (such
        // as Java), but is slightly different in that you can call functions on nil and your
        // app won't crash)
        [UIView animateWithDuration: speedSlider.value
                              delay: 0.0f
                            options: UIViewAnimationOptionCurveEaseOut
                         animations: ^(void)
                            {
                                // move the ball to the touch location
                                [ballView setCenter: location];
                            }
                         completion: nil];
    }
   
}


// ------------------------------------------------------------
// touchesMoved:withEvent:
//
// Called when the user has already touched the screen and is
// now moving his/her finger around (or when the mouse is
// clicked and is now being moved around in the simulator).
// This is how you can implement touch and drag gestures.
// ------------------------------------------------------------
- (void) touchesMoved: (NSSet<UITouch*>*)touches withEvent: (UIEvent*)event
{
    // only move the ball if the movement switch is on
    if (movementSwitch.on)
    {
        // get the location of where the user has moved his/her finger to
        UITouch* touch = [[event allTouches] anyObject];
        CGPoint location = [touch locationInView: self.view];
        
        // animations cancel each other, so if the user continuously
        // moves his/her finger around, animations will keep occurring and
        // canceling the previous animation, meaning that the ball will
        // always be moving to the most recently touched location.
        [UIView animateWithDuration: speedSlider.value
                              delay: 0.0f
                            options: UIViewAnimationOptionCurveEaseOut
                         animations: ^(void)
                            {
                                [ballView setCenter: location];
                            }
                         completion: nil];
    }
}


// ------------------------------------------------------------
// centerTheBall
//
// Centers the ball in the middle of the screen. The "IB" in
// "IBAction" stands for "Interface Builder", which is sometimes
// what the storyboard is called. Being an IBAction means that
// this function is called from some user interface element
// in the storyboard. IBActions do not have return values. The
// sender parameter is the object that called this function
// (which means that multiple objects in the storyboard can call
// this function if needed), and id is any object type.
// ------------------------------------------------------------
- (IBAction) centerTheBall: (id)sender
{
    [ballView.layer removeAllAnimations];
    CGSize viewSize = self.view.frame.size;
    [ballView setCenter: CGPointMake(viewSize.width / 2, viewSize.height / 2)];
}

@end


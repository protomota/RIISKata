-----------------------------------------------------------------------------
CREATE SIMPLE UTILITY APPLICATION
-----------------------------------------------------------------------------

The following application is a demo for building a simple utility application with unit tests.

Project can be found here: https://github.com/braddunlap/RIISKata

1.) We are going to create a simple view project. We will be configuring all the views ourselves.
	- Create a new "Empty Application" project.
	- Name the project "RIISKata"
	- company identifier "com.riis"
	- Device Family - iPhone
	- Check "Include Unit Tests"
	- Save to the Desktop
	- This should have created a project with an AppDelegate and unit test configured

2.) Now we are going to create 2 view controllers one for our back and one for our front.
	- Create a UIViewController called "MainViewController" (deselect "Targeted for iPad" and select "With XIB for user interface")
	- Create a UIViewController called "FlipsideViewController" (deselect "Targeted for iPad" and select "With XIB for user interface")


3.) Create MainViewController View
	- Drag a Round Rect Button to the top left hand corner of the view, change the type to "Info Light"
	- Change the background to something else (optional)
	- Save

4.) Create FlipsideViewController View
	- Drag a "Navigation Bar" over the to view. Title it "The Flip Side"
	- Drag a "Bar Button Item" over to the Navigation Bar that we just created. Label it "Done"
	- Save

5.) In AppDelegate create the MainViewController instance

// ADD TO THE HEADER
@class MainViewController; // this is user instead of #import to avoid compiler problems if we try to import a reference to AppDelegate in MainViewController 
@property (strong, nonatomic) MainViewController *mainViewController;

// ADD TO THE IMPLEMENTATION
@sythesize mainViewController = _mainViewController;
[_mainViewController release];
	
self.mainViewController = [[[MainViewController alloc] init] autorelease];
self.window.rootViewController = self.mainViewController;

6.) Go to FlipViewController to create our delegate
	
// ADD TO THE HEADER
@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

// ADD TO THE IMPLEMENTATION
@synthesize delegate = _delegate;

- (IBAction)done:(id)sender {
    [self.delegate flipsideViewControllerDidFinish:self];
}

7.) Go to MainViewController to set up as the delegate

// ADD TO THE HEADER
<FlipsideViewControllerDelegate>

- (IBAction)showInfo:(id)sender;

// ADD TO THE IMPLEMENTATION
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender {    
    FlipsideViewController *controller = [[[FlipsideViewController alloc] init] autorelease];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
}


8.) Build and Run.


-----------------------------------------------------------------------------
UNIT TESTS
-----------------------------------------------------------------------------

1.) Create a new Class called Model
	- Add to both targets

// ADD TO THE HEADER
+ (BOOL)validModel;

// ADD TO THE IMPLEMENTATION
+ (BOOL)validModel {
    return YES;
}

2.) Go to RIISKataTests

// ADD TO THE IMPLEMENTATION
#import "Model.h"

- (void)testForValidModel {
    BOOL pass = [Model validModel];
    STAssertTrue(pass, @"The Model is Invalid!");
}


3.) Go to Product Menu and choose Test, the test should pass.

4.) Go to Model

// IN THE IMPLEMENTATION
change return YES to return NO

5.) Go to Product Menu and choose Test, the test should fail. Unit tests are working.


-----------------------------------------------------------------------------

Jenkins

1.) Prepare our project.
	- Open the target RIISKataTest
	- search for "test host"
	- clear those values
	- otherwise Jenkins will fail since it cannot run application unit tests.

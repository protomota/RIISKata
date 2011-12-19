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

1.) Add Images to the Project.
	- Create a folder called "Resources"
	- Note, the image that is named "Default.png" by default will be the background launch image of our application.
	
2.) Now we are going to create 2 view controllers one for our back and one for our front.
	- Create a UIViewController called "MainViewController" (deselect "Targeted for iPad" and select "With XIB for user interface")
	- Create a UIViewController called "SettingsViewController" (deselect "Targeted for iPad" and select "With XIB for user interface")


4.) Create MainViewController View
	- Drag an Image View to our main view
	- Set the image to our default image. 
	- Under the Editor menu, choose "Size to Fit Content"
	- Drag a Round Rect Button to the center of the window.
	- Set the button type to Custom
	- Set the button image for the Default state to "bigButton_UP.png"
	- Set the button image for the Highlite state to "bigButton_DOWN.png"
	- Under the Editor menu, choose "Size to Fit Content"
	- Drag a Round Rect Button to the top left hand corner of the view, change the type to "Info Light"
	- Save

5.) Create SettingsViewController View
	- Drag a "Navigation Bar" over the to view. Title it "The Flip Side"
	- Drag a "Bar Button Item" over to the Navigation Bar that we just created. Label it "Done"
	- Save

6.) In AppDelegate create the MainViewController instance

// ADD TO THE HEADER
@class MainViewController; // this is user instead of #import to avoid compiler problems if we try to import a reference to AppDelegate in MainViewController 
@property (strong, nonatomic) MainViewController *mainViewController;

// ADD TO THE IMPLEMENTATION
@sythesize mainViewController = _mainViewController;
[_mainViewController release];
	
self.mainViewController = [[[MainViewController alloc] init] autorelease];
self.window.rootViewController = self.mainViewController;

7.) Go to FlipViewController to create our delegate
	
// ADD TO THE HEADER
@class SettingsViewController;

@protocol SettingsViewControllerDelegate
- (void)settingsViewControllerDidFinish:(SettingsViewController *)controller;
@end

// ADD TO THE IMPLEMENTATION
@synthesize delegate = _delegate;

- (IBAction)done:(id)sender {
    [self.delegate settingsViewControllerDidFinish:self];
}

8.) Go to MainViewController to set up as the delegate

// ADD TO THE HEADER
<SettingsViewControllerDelegate>

- (IBAction)showInfo:(id)sender;
- (IBAction)ground:(id)sender;

// ADD TO THE IMPLEMENTATION
- (void)settingsViewControllerDidFinish:(SettingsViewController *)controller {
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender {    
    SettingsViewController *controller = [[[SettingsViewController alloc] init] autorelease];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
}

- (IBAction)ground:(id)sender {    
    UIAlertView *alert = [[UIAlertView alloc] 
                          initWithTitle:@"You're Grounded!"
                          message:nil
                          delegate:self 
                          cancelButtonTitle:@"OK" 
                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

9.) Connect the interface outlets


10.) Build and Run.


The application is complete.
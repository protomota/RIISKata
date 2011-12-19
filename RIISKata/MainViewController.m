//
//  MainViewController.m
//  RIISKata
//
//  Created by Brad Dunlap on 12/19/11.
//  Copyright (c) 2011 RIIS. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

#pragma mark - Flipside View

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

@end

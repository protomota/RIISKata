//
//  FlipsideViewController.m
//  RIISKata
//
//  Created by Brad Dunlap on 12/19/11.
//  Copyright (c) 2011 RIIS. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController

@synthesize delegate = _delegate;

- (IBAction)done:(id)sender {
    [self.delegate settingsViewControllerDidFinish:self];
}

@end

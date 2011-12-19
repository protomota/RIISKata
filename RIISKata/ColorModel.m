//
//  TestObj.m
//  RIISKata
//
//  Created by Brad Dunlap on 12/19/11.
//  Copyright (c) 2011 RIIS. All rights reserved.
//

#import "ColorModel.h"
#import "AppDelegate.h"
#import "MainViewController.h"

@implementation ColorModel

+ (BOOL)testForPurpleColor {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    return appDelegate.mainViewController.view.backgroundColor == [UIColor purpleColor];
}

@end

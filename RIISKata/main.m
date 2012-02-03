//
//  main.m
//  RIISKata
//
//  Created by Brad Dunlap on 12/19/11.
//  Copyright (c) 2011 RIIS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

#ifdef FRANK
#include "FrankServer.h"
static FrankServer *sFrankServer;
#endif

int main(int argc, char *argv[])
{
    @autoreleasepool {
        
#ifdef FRANK
        sFrankServer = [[FrankServer alloc] initWithDefaultBundle];
        [sFrankServer startServer];
#endif
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

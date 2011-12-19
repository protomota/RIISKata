//
//  RIISKataTests.m
//  RIISKataTests
//
//  Created by Brad Dunlap on 12/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "RIISKataTests.h"
#import "ColorModel.h"

@implementation RIISKataTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testForPurpleColor {
    BOOL pass = [ColorModel testForPurpleColor];
    STAssertTrue(pass, @"The the color HAS to be PURPLE!");
}

@end

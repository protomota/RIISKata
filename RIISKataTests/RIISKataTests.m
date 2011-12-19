//
//  RIISKataTests.m
//  RIISKataTests
//
//  Created by Brad Dunlap on 12/19/11.
//  Copyright (c) 2011 RIIS. All rights reserved.
//

#import "RIISKataTests.h"
#import "Model.h"

@implementation RIISKataTests

- (void)setUp {
    [super setUp];
    // Set-up code here.
}

- (void)tearDown {
    // Tear-down code here.
    [super tearDown];
}

- (void)testForPurpleColor {
    BOOL pass = [Model validObject];
    STAssertTrue(pass, @"The Model Object is Invalid!");
}

@end

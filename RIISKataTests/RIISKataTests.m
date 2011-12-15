//
//  RIISKataTests.m
//  RIISKataTests
//
//  Created by Brad Dunlap on 12/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "RIISKataTests.h"

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

- (void)testMath
{    
    STAssertTrue((1+1)==2, @"Compiler isn't feeling well today :-(" );
}

- (void)testExample
{
    STFail(@"Unit tests are not implemented yet in RIISKataTests");
}


@end

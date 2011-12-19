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
	
	
	
2.) Set up Jenkins. We have all the plugins installed: XCode, and Git

3.) 

git@github.com:braddunlap/RIISKata.git

*/master

RIISKata

iphonesimulator5.0

Debug



// ADD BUILD STEP - run command to output the uses a ruby script from Christian Hedin that converts the XCode OCUnit output to JUnit XML format that Jenkins understands. 

xcodebuild -target RIISKataTests -configuration Debug -sdk iphonesimulator5.0 | /usr/local/bin/ocunit2junit.rb

// SELECT - Publish JUnit Tests
Test report XMLs: test-reports/*.xml
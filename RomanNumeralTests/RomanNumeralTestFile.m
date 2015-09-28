//
//  RomanNumeralTestFile.m
//  RomanNumeral
//
//  Created by Swagatika on 9/28/15.
//  Copyright (c) 2015 swagatika. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface RomanNumeralTestFile : XCTestCase{

ViewController  *viewControllerOB;
}
@end

@implementation RomanNumeralTestFile

- (void)setUp {
    [super setUp];
    NSLog(@"%@ setUp", self.name);
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main"
                                                            bundle: nil];
   viewControllerOB = [mainStoryBoard   instantiateViewControllerWithIdentifier:@"ViewController"];
   [viewControllerOB viewDidLoad];
   XCTAssertNotNil(viewControllerOB, @"Cannot create ViewController instance");
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    NSLog(@"%@ tearDown", self.name);
}
- (void)testRomanNumeralMatched {
    NSLog(@"%@ start", self.name);   // self.name is the name of the test-case method.

    XCTAssertEqual([viewControllerOB romanToDecimal:@"I"],1,@"Equal");
    XCTAssertEqual([viewControllerOB romanToDecimal:@"II"],2,@"Equal");
    XCTAssertEqual([viewControllerOB romanToDecimal:@"lXXXiX"],89,@"Equal");
    XCTAssertEqual([viewControllerOB romanToDecimal:@"lXXvIiI"],78,@"Equal");
    NSLog(@"%@ end", self.name);
}
-(void)testRomanNotValid{
    NSLog(@"%@ start", self.name);   // self.name is the name of the test-case method.
    XCTAssert(![viewControllerOB isValidForRoman:@"HHHHHHH"]);
    XCTAssert(![viewControllerOB isValidForRoman:@"M56*%@"]);
    NSLog(@"%@ end", self.name);
}
- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

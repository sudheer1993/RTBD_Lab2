//
//  Lab2Tests.m
//  Lab2Tests
//
//  Created by Gourishetty, Sudheer (UMKC-Student) on 9/9/15.
//  Copyright (c) 2015 Gourishetty, Sudheer (UMKC-Student). All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface Lab2Tests : XCTestCase

@end

@implementation Lab2Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
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

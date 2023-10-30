//
//  TestAppTests.m
//  TestAppTests
//
//  Created by 蓝天祐 on 2023/10/27.
//

#import <XCTest/XCTest.h>
#import <objc/runtime.h>
#import "TestCaseCollector.h"

@interface TestAppDemoTests : XCTestCase

@end

@implementation TestAppDemoTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    
    // 收集用例信息
    NSString *className = NSStringFromClass([self class]); // 当前测试方法所在的类名
    NSString *methodName = NSStringFromSelector(_cmd); // 当前测试方法名
    NSString *caseDesc = @"测试用例描述"; // 用例描述
    NSString *caseLevel = @"P0"; // 用例等级
    NSString *modName = @"iOS自动化测试"; // 用例模块名
    NSString *subModuleCNName = @"子模块名"; // 子模块名
    NSString *caseOwner = @"tianyou.lan"; // 用例负责人
    NSString *caseType = @"移动端测试"; // 用例类型
    NSArray *caseTags = @[@"回归测试"]; // 用例标签
    NSNumber *dataReport = @1; // 是否上报用例: 1-上报; 0-不上报
    [[[TestCaseCollector alloc] init] collectClassName:className methodName:methodName caseDesc:caseDesc caseLevel:caseLevel subModuleCNName:subModuleCNName caseOwner:caseOwner caseTags:caseTags caseType:caseType modName:modName dataReport:dataReport];
    
    // 执行测试用例
    NSLog(@"执行测试用例");
}

- (void)testExampleForShort {
    
    // 收集用例信息
    [[[TestCaseCollector alloc] init] collectClassName:NSStringFromClass([self class])
                                            methodName:NSStringFromSelector(_cmd)
                                              caseDesc:@"测试用例描述" // 用例描述
                                             caseOwner:@"tianyou.lan" // 用例负责人
                                       subModuleCNName:@"子模块名" // 子模块名
    ];
    
    // 执行测试用例
    NSLog(@"执行测试用例");
}

@end

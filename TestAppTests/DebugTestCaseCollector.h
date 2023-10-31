//
//  DebugTestCaseCollector.h
//  TestAppTests
//
//  Created by 蓝天祐 on 2023/10/30.
//

#ifndef DebugTestCaseCollector_h
#define DebugTestCaseCollector_h

#import <Foundation/Foundation.h>

@interface DebugTestCaseCollector : NSObject

@property (nonatomic, strong) NSString *methodName;
@property (nonatomic, strong) NSString *className;
@property (nonatomic, strong) NSString *targetName;
@property (nonatomic, strong) NSString *caseType;
@property (nonatomic, strong) NSString *caseDesc;
@property (nonatomic, strong) NSString *caseLevel;
@property (nonatomic, strong) NSString *caseOwner;
@property (nonatomic, strong) NSArray *caseTags;
@property (nonatomic, strong) NSString *modName;
@property (nonatomic, strong) NSString *subModuleCNName;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSNumber *dataReport;
@property (nonatomic, strong) NSMutableDictionary *customFields;
@property (nonatomic, strong) NSString *caseInfoJsonPath;

- (void)collectClassName:(NSString *)className
              methodName:(NSString *)methodName
                caseDesc:(NSString *)caseDesc
               caseLevel:(NSString *)caseLevel
         subModuleCNName:(NSString *)subModuleCNName
               caseOwner:(NSString *)caseOwner
                caseTags:(NSArray *)caseTags
                caseType:(NSString *)caseType
                 modName:(NSString *)modName
              dataReport:(NSNumber *)dataReport;
- (void)collectClassName:(NSString *)className
              methodName:(NSString *)methodName
                caseDesc:(NSString *)caseDesc
               caseOwner:(NSString *)caseOwner
         subModuleCNName:(NSString *)subModuleCNName;
- (void)addCustomField:(NSString *)field forKey:(NSString *)key;
- (void)saveCasesInfo;
- (NSString *)getCurrentTestTargetName;
- (void)updateCaseField:(id)name withValue:(NSString *)value;

@end

#endif /* DebugTestCaseCollector_h */

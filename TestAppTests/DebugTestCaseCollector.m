//
//  DebugTestCaseCollector.m
//  TestAppTests
//
//  Created by 蓝天祐 on 2023/10/30.
//

#import <Foundation/Foundation.h>
#import "DebugTestCaseCollector.h"

@implementation DebugTestCaseCollector

- (instancetype)init {
    self = [super init];
    if (self) {
        _customFields = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)collectClassName:(NSString *)className
              methodName:(NSString *)methodName
                caseDesc:(NSString *)caseDesc
               caseOwner:(NSString *)caseOwner
         subModuleCNName:(NSString *)subModuleCNName {
    
    // 设置默认值
    NSString *caseLevel = @"P0";
    NSArray *caseTags = [NSArray arrayWithObjects:@"冒烟测试", nil];
    NSString *caseType = @"移动端测试";
    NSNumber *dataReport = @1;
    NSString *modName = @"iOS自动化测试";
    
    // 收集用例信息
    [self collectClassName:className
                methodName:methodName
                  caseDesc:caseDesc
                 caseLevel:caseLevel
           subModuleCNName:subModuleCNName
                 caseOwner:caseOwner
                  caseTags:caseTags
                  caseType:caseType
                   modName:modName
                dataReport:dataReport];
}

- (void)collectClassName:(NSString *)className
              methodName:(NSString *)methodName
                caseDesc:(NSString *)caseDesc
               caseLevel:(NSString *)caseLevel
         subModuleCNName:(NSString *)subModuleCNName
               caseOwner:(NSString *)caseOwner
                caseTags:(NSArray *)caseTags
                caseType:(NSString *)caseType
                 modName:(NSString *)modName
              dataReport:(NSNumber *)dataReport {
    
    // 保存用例信息
    if (self) {
        _className = className; // 测试方法所在的类名
        _methodName = methodName; // 测试方法名
        _targetName = [self getCurrentTestCaseTargetName]; // 用例所在的 target 名
        _caseDesc = caseDesc; // 用例描述
        _caseLevel = caseLevel; // 用例等级
        _modName = modName; // 用例模块名
        _subModuleCNName = subModuleCNName; // 子模块名
        _caseOwner = caseOwner; // 用例负责人
        _caseTags = caseTags; // 用例标签
        _caseType = caseType; // 用例类型
        _dataReport = dataReport; // 是否上报用例: 1-上报; 0-不上报
        _customFields = [NSMutableDictionary dictionary];
    }
    
    // 设置保存路径
    NSString *tempDirectoryPath = NSTemporaryDirectory();
    NSString *filePath = [tempDirectoryPath stringByAppendingPathComponent:@"test_cases_info.json"];
    
    // 保存数据到文件
    [self saveDataToFile:filePath];
}

- (void)saveDataToFile:(NSString *)filePath {
    
    // 打印文件保存路径
    NSLog(@"Save data to file: %@", filePath);
    
    // 检查文件是否存在
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        // 如果文件不存在则创建空的 JSON 文件
        NSDictionary *emptyDictionary = [NSDictionary dictionary];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:emptyDictionary
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&error];
        if (!jsonData) {
            NSLog(@"Error creating empty JSON data: %@", error);
            return;
        }
        BOOL success = [jsonData writeToFile:filePath atomically:YES];
        if (!success) {
            NSLog(@"Error creating JSON file.");
            return;
        }
    }
    
    // 读取 JSON 文件数据
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    if (!jsonData) {
        NSLog(@"Error reading JSON file.");
        return;
    }
    
    // 检查文件是否为空
    NSError *error;
    NSMutableDictionary *jsonDictionary;
    if (jsonData.length == 0) {
        // 如果文件为空则创建一个空的 NSMutableDictionary 对象
        jsonDictionary = [NSMutableDictionary dictionary];
    } else {
        // 解析 JSON 数据并设置解析选项为允许片段
        jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                         options:NSJSONReadingAllowFragments
                                                           error:&error];
        if (!jsonDictionary) {
            NSLog(@"Error parsing JSON data: %@", error);
            return;
        }
    }
    
    // 更新 JSON 数据
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setObject:self.modName forKey:@"modName"];
    [data setObject:self.subModuleCNName forKey:@"subModuleCNName"];
    [data setObject:@"iOS" forKey:@"os"];
    [data setObject:self.targetName forKey:@"targetName"];
    [data setObject:self.className forKey:@"className"];
    [data setObject:self.methodName forKey:@"methodName"];
    [data setObject:self.caseDesc forKey:@"caseDesc"];
    [data setObject:self.caseLevel forKey:@"caseLevel"];
    [data setObject:self.caseOwner forKey:@"caseOwner"];
    [data setObject:self.caseType forKey:@"caseType"];
    [data setObject:self.caseTags forKey:@"caseTags"];
    [data setObject:self.dataReport forKey:@"dataReport"];
    NSMutableString *source = [NSMutableString stringWithString:self.modName];
    if (self.subModuleCNName.length > 0) {
        [source appendString:@"."];
        [source appendString:self.subModuleCNName];
    }
    self.source = source;
    [data setObject:self.source forKey:@"source"];
    NSString *key = [NSString stringWithFormat:@"%@.%@.%@", _targetName, _className, _methodName];
    NSMutableDictionary *mjsonDictionary = [jsonDictionary mutableCopy];
    [mjsonDictionary setObject:data forKey:key];
    
    // 将更新后的 JSON 数据写入文件
    NSData *updatedJsonData = [NSJSONSerialization dataWithJSONObject:mjsonDictionary
                                                              options:NSJSONWritingPrettyPrinted
                                                                error:&error];
    if (!updatedJsonData) {
        NSLog(@"Error creating updated JSON data: %@", error);
        return;
    }
    BOOL success = [updatedJsonData writeToFile:filePath atomically:YES];
    if (!success) {
        NSLog(@"Error writing updated JSON data to file.");
    }
}

- (void)addCustomField:(NSString *)field forKey:(NSString *)key {
    
    // 设置自定义键值
    [self.customFields setObject:field forKey:key];
}

- (NSString *)extractTargetName:(NSString *)inputString {
    
    /** 合并多余空格
     3 TestAppTests 0x0000000102d71544 -[TestAppDemoTests testExampleForShort] + 136
     **/
    NSString *mergedString = [inputString stringByReplacingOccurrencesOfString:@"\\s+"
                                                                    withString:@" "
                                                                       options:NSRegularExpressionSearch range:NSMakeRange(0, inputString.length)];
    
    // 以空格分隔字符串
    NSArray *components = [mergedString componentsSeparatedByString:@" "];
    
    // 取第二位为 target 名
    if (components.count >= 2) {
        return components[1];
    } else {
        NSLog(@"Input string does not contain enough elements.");
        return nil;
    }
}

- (NSString *)getCurrentTestCaseTargetName {
    NSArray *callStackSymbols = [NSThread callStackSymbols];
    for (NSString *symbol in callStackSymbols) {
        NSLog(@"symbol: %@", symbol);
        NSString *key = [NSString stringWithFormat:@"-[%@ %@]", _className, _methodName];
        if ([symbol containsString:key]) {
            NSString *targetName = [self extractTargetName: symbol];
            return targetName;
        }
    }
    return nil;
}

@end

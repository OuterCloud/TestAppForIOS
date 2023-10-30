# TestAppForIOS

该项目用来说明如何在 objective-c 项目中使用 TestCaseCollector 库

## 使用步骤

1. 修改 Podfile, 针对需要安装 TestCollector 的 target 添加如下内容(详见 Podfile):

```
pod 'TestCaseCollector', '0.0.1'
```

2. 修改测试方法所在的 .m 文件, 引用 TestCaseCollector:

```objective-c
#import "TestCaseCollector.h"
```

3. 修改测试方法, 在测试方法的开头添加以下代码行以收集用例信息:

```objective-c
[[[TestCaseCollector alloc] init] collectClassName:NSStringFromClass([self class])
                                        methodName:NSStringFromSelector(_cmd)
                                          caseDesc:@"用例描述" // 用例描述
                                         caseOwner:@"tianyou.lan" // 用例负责人
                                   subModuleCNName:@"子模块名" // 子模块名
];
```

## 查看收集到的用例信息

运行测试并查看收集到的用例信息(在控制台中可以看到 test_cases_info.json 文件路径), 以本项目为例, 生成的 test_cases_info.json 文件内容如下:

```json
{
  "TestAppUnitTests.TestAppUnitTests.testExampleForShort" : {
    "modName" : "iOS自动化测试",
    "dataReport" : 1,
    "caseTags" : [
      "冒烟测试"
    ],
    "methodName" : "testExampleForShort",
    "className" : "TestAppUnitTests",
    "subModuleCNName" : "子模块名",
    "caseLevel" : "P0",
    "os" : "iOS",
    "source" : "iOS自动化测试.子模块名",
    "caseOwner" : "tianyou.lan",
    "caseDesc" : "测试用例描述",
    "targetName" : "TestAppUnitTests",
    "caseType" : "移动端测试"
  },
  "TestAppTests.TestAppDemoTests.testExample" : {
    "modName" : "iOS自动化测试",
    "dataReport" : 1,
    "caseTags" : [
      "回归测试"
    ],
    "methodName" : "testExample",
    "className" : "TestAppDemoTests",
    "subModuleCNName" : "子模块名",
    "caseLevel" : "P0",
    "os" : "iOS",
    "source" : "iOS自动化测试.子模块名",
    "caseOwner" : "tianyou.lan",
    "caseDesc" : "测试用例描述",
    "targetName" : "TestAppTests",
    "caseType" : "移动端测试"
  },
  "TestAppTests.TestAppDemoTests.testExampleForShort" : {
    "modName" : "iOS自动化测试",
    "dataReport" : 1,
    "caseTags" : [
      "冒烟测试"
    ],
    "methodName" : "testExampleForShort",
    "className" : "TestAppDemoTests",
    "subModuleCNName" : "子模块名",
    "caseLevel" : "P0",
    "os" : "iOS",
    "source" : "iOS自动化测试.子模块名",
    "caseOwner" : "tianyou.lan",
    "caseDesc" : "测试用例描述",
    "targetName" : "TestAppTests",
    "caseType" : "移动端测试"
  },
  "TestAppUnitTests.TestAppUnitTests.testExample" : {
    "modName" : "iOS自动化测试",
    "dataReport" : 1,
    "caseTags" : [
      "回归测试"
    ],
    "methodName" : "testExample",
    "className" : "TestAppUnitTests",
    "subModuleCNName" : "子模块名",
    "caseLevel" : "P0",
    "os" : "iOS",
    "source" : "iOS自动化测试.子模块名",
    "caseOwner" : "tianyou.lan",
    "caseDesc" : "测试用例描述",
    "targetName" : "TestAppUnitTests",
    "caseType" : "移动端测试"
  }
}
```

# TestAppForIOS

该项目用来说明如何在 objective-c 项目中使用 TestCaseCollector 库

## 使用步骤

1. 修改 Podfile, 针对需要安装 TestCollector 的 target 添加如下内容(详见 Podfile):

```
pod 'TestCaseCollector', '0.0.3'
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
    "sub_module_cn_name" : "子模块名",
    "class_name" : "TestAppUnitTests",
    "mod_name" : "iOS自动化测试",
    "case_tags" : [
      "冒烟测试"
    ],
    "source" : "iOS自动化测试.子模块名",
    "os" : "iOS",
    "method_name" : "testExampleForShort",
    "case_level" : "P0",
    "target_name" : "TestAppUnitTests",
    "case_type" : "客户端测试",
    "case_owner" : "tianyou.lan",
    "data_report" : 1,
    "case_desc" : "测试用例描述"
  },
  "TestAppTests.TestAppDemoTests.testDebug" : {
    "sub_module_cn_name" : "子模块名",
    "class_name" : "TestAppDemoTests",
    "mod_name" : "iOS自动化测试",
    "case_tags" : [
      "冒烟测试"
    ],
    "source" : "iOS自动化测试.子模块名",
    "os" : "iOS",
    "method_name" : "testDebug",
    "case_level" : "P1",
    "target_name" : "TestAppTests",
    "case_type" : "客户端测试",
    "case_owner" : "tianyou.lan",
    "data_report" : "0",
    "case_desc" : "测试用例描述"
  },
  "TestAppTests.TestAppDemoTests.testExample" : {
    "sub_module_cn_name" : "子模块名",
    "class_name" : "TestAppDemoTests",
    "mod_name" : "iOS自动化测试",
    "case_tags" : [
      "回归测试"
    ],
    "source" : "iOS自动化测试.子模块名",
    "os" : "iOS",
    "method_name" : "testExample",
    "case_level" : "P0",
    "target_name" : "TestAppTests",
    "case_type" : "客户端测试",
    "case_owner" : "tianyou.lan",
    "data_report" : 1,
    "case_desc" : "测试用例描述"
  },
  "TestAppTests.TestAppDemoTests.testExampleForShort" : {
    "sub_module_cn_name" : "子模块名",
    "class_name" : "TestAppDemoTests",
    "mod_name" : "iOS自动化测试",
    "case_tags" : [
      "冒烟测试"
    ],
    "source" : "iOS自动化测试.子模块名",
    "os" : "iOS",
    "method_name" : "testExampleForShort",
    "case_level" : "P0",
    "target_name" : "TestAppTests",
    "case_type" : "客户端测试",
    "case_owner" : "tianyou.lan",
    "data_report" : 1,
    "case_desc" : "测试用例描述"
  },
  "TestAppUnitTests.TestAppUnitTests.testExample" : {
    "sub_module_cn_name" : "子模块名",
    "class_name" : "TestAppUnitTests",
    "mod_name" : "iOS自动化测试",
    "case_tags" : [
      "回归测试"
    ],
    "source" : "iOS自动化测试.子模块名",
    "os" : "iOS",
    "method_name" : "testExample",
    "case_level" : "P0",
    "target_name" : "TestAppUnitTests",
    "case_type" : "客户端测试",
    "case_owner" : "tianyou.lan",
    "data_report" : 1,
    "case_desc" : "测试用例描述"
  }
}
```

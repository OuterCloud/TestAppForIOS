//
//  ViewController.m
//  TestApp
//
//  Created by 蓝天祐 on 2023/10/27.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置 Label 的初始文字
    self.myLabel.text = @"Hello, World!";
}

- (IBAction)button1Tapped:(id)sender {
    // 当 Button1 被点击时,更新 Label 的文字
    self.myLabel.text = @"Button1 Tapped!";
}

- (IBAction)button2Tapped:(id)sender {
    // 当 Button2 被点击时,更新 Label 的文字
    self.myLabel.text = @"Button2 Tapped!";
}

- (IBAction)button3Tapped:(id)sender {
    // 当 Button3 被点击时,更新 Label 的文字
    self.myLabel.text = @"Button3 Tapped!";
}

@end

//
//  ViewController.h
//  TestApp
//
//  Created by 蓝天祐 on 2023/10/27.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;

- (IBAction)button1Tapped:(id)sender;
- (IBAction)button2Tapped:(id)sender;
@end


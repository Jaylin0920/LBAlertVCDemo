//
//  ViewController.m
//  LBAlertJustifyLeftDemo
//
//  Created by JiBaoBao on 17/5/27.
//  Copyright © 2017年 JiBaoBao. All rights reserved.
//

#import "ViewController.h"
#import "LBAlertVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)showLBAlertVC:(UIButton *)sender {
NSString *message = @"        你的银子”将支持快速取出（最快5秒到账），随时用钱随时提现，大大提高您的用钱效率。\n        现支持快速升级为“金子”（一键转购，预估“5日内”确认）。\n1.\n2.";
[[LBAlertVC sharedInstance] showAlertVCWithTitle:@"金子来了"
                                         message:message
                                messageAlignment:NSTextAlignmentLeft
                                      leftBtnStr:@"暂不升级"
                                    leftBtnStyle:UIAlertActionStyleDefault
                                    leftBtnColor:[UIColor greenColor]
                                     rightBtnStr:@"我要升级"
                                    leftBtnStyle:UIAlertActionStyleDestructive
                                   rightBtnColor:nil
                                           leftB:^{
                                               NSLog(@"leftBtn click");
                                           }
                                          rightB:^{
                                              NSLog(@"rightBtn click");
                                          }];
}

@end

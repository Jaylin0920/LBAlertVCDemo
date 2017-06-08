//
//  LBAlertVC2.m
//  LBAlertJustifyLeftDemo
//
//  Created by JiBaoBao on 17/5/31.
//  Copyright © 2017年 JiBaoBao. All rights reserved.
//


#import "LBAlertVC2.h"

@interface LBAlertVC2 ()

@end

@implementation LBAlertVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = [NSString stringWithFormat:@"%@",[self class]];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSString *messageStr = [NSString stringWithFormat:@"        我是第一行。\n\t我是第二行，我是第二行，我是第二行，我是第二行，我是第二行，我是第二行。"];
    NSString *titleStr = @"我是标题";
    [self lb_showAlertViewWithTitle:titleStr message:messageStr];
}


#pragma mark - LBAlertVC2

- (void)lb_showAlertViewWithTitle:(NSString *)titleStr message:(NSString *)messageStr{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleAlert];
    [self lb_setAlertVCTitleAndMessage:alertController title:titleStr message:messageStr];
    [self lb_setAlertVCConetentAlignmentLeft:alertController];
    UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:@"左按钮" style:UIAlertActionStyleDefault handler:nil];
    [self lb_setAlertVCActionColor:cancelButton color:[UIColor greenColor]];
    UIAlertAction *destructiveButton = [UIAlertAction actionWithTitle:@"右按钮" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了右按钮");
    }];
    [alertController addAction:cancelButton];
    [alertController addAction:destructiveButton];
    alertController.view.tintColor = [UIColor blueColor];
    [self presentViewController:alertController animated:YES completion:nil];
}

//设置 alertVC 内容左对齐
- (void)lb_setAlertVCConetentAlignmentLeft:(UIAlertController *)alertController{
    UIView *messageParentView = [self lb_getParentViewOfTitleAndMessageFromView:alertController.view];
    if (messageParentView && messageParentView.subviews.count > 1) {
        UILabel *messageLb = messageParentView.subviews[1];
        messageLb.backgroundColor = [UIColor yellowColor];
        messageLb.textAlignment = NSTextAlignmentLeft;
//        messageLb.font = [UIFont systemFontOfSize:60.f]; //无效
//        messageLb.textColor = [UIColor greenColor]; //无效
    }
}

//设置 alertVC 标题/内容
- (void)lb_setAlertVCTitleAndMessage:(UIAlertController *)alertController title:(NSString *)titleStr message:(NSString *)messageStr{
    //修改title
    NSMutableAttributedString *alertControllerStr = [[NSMutableAttributedString alloc] initWithString:titleStr];
    [alertControllerStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 2)];
    [alertControllerStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11] range:NSMakeRange(0, 2)];
    [alertController setValue:alertControllerStr forKey:@"attributedTitle"];
    
    
    //修改message (无效)
    NSMutableAttributedString *alertControllerMessageStr = [[NSMutableAttributedString alloc] initWithString:@"提示内容"];
    [alertControllerMessageStr addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(0, 4)];
    [alertControllerMessageStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:26] range:NSMakeRange(0, 4)];
    if ([alertController valueForKey:@"attributedMessage"]) {
        [alertController setValue:alertControllerMessageStr forKey:@"attributedMessage"];
    }
}

//设置 alertVC 按钮颜色
- (void)lb_setAlertVCActionColor:(UIAlertAction *)alertAction color:(UIColor *)color{
    [alertAction setValue:color forKey:@"titleTextColor"];
}

- (UIView *)lb_getParentViewOfTitleAndMessageFromView:(UIView *)view {
    for (UIView *subView in view.subviews) {
        if ([subView isKindOfClass:[UILabel class]]) {
            return view;
        }else{
            UIView *resultV = [self lb_getParentViewOfTitleAndMessageFromView:subView];
            if (resultV) return resultV;
        }
    }
    return nil;
}

@end

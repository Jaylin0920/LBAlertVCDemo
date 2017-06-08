//
//  LBAlertVC.m
//  LBAlertJustifyLeftDemo
//
//  Created by JiBaoBao on 17/6/8.
//  Copyright © 2017年 JiBaoBao. All rights reserved.
//

#import "LBAlertVC.h"
#import "LBUtil.h"

@interface LBAlertVC ()

@property (nonatomic, strong) UIAlertController *alert;
@property (nonatomic, copy) LeftBlock leftBlock;
@property (nonatomic, copy) RightBlock rightBlock;
@property (nonatomic, strong) NSString *titleStr;
@property (nonatomic, strong) NSString *messageStr;
@property (nonatomic, strong) NSString *leftStr;
@property (nonatomic, strong) NSString *rightStr;
@property (nonatomic, assign) UIAlertActionStyle leftStyle;
@property (nonatomic, assign) UIAlertActionStyle rightStyle;
@property (nonatomic, strong) UIColor *leftColor;
@property (nonatomic, strong) UIColor *rightColor;

@end

@implementation LBAlertVC

+ (LBAlertVC *)sharedInstance{
    static LBAlertVC *sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[LBAlertVC alloc] init];
    });
    return sharedManager;
}

- (void)showAlertVCWithTitle:(NSString *)titleStr
                     message:(NSString *)messageStr
            messageAlignment:(NSTextAlignment )messageAlignment
                  leftBtnStr:(NSString *)leftStr
                leftBtnStyle:(UIAlertActionStyle)leftStyle
                leftBtnColor:(UIColor *)leftColor
                 rightBtnStr:(NSString *)rightStr
                leftBtnStyle:(UIAlertActionStyle)rightStyle
               rightBtnColor:(UIColor *)rightColor
                       leftB:(LeftBlock)leftBlock
                      rightB:(RightBlock)rightBlock{
    self.leftBlock=leftBlock;
    self.rightBlock=rightBlock;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleAlert];
    [self lb_setAlertVCConetentAlignmentLeft:alertController messageAlignment:messageAlignment];
    if (leftStr) {
        UIAlertAction *leftBtn = [UIAlertAction actionWithTitle:leftStr style:leftStyle? :UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (self.leftBlock) {
                self.leftBlock(self);
            }
        }];
        if (leftColor) [leftBtn setValue:leftColor forKey:@"titleTextColor"];
        [alertController addAction:leftBtn];
    }
    if (rightStr) {
        UIAlertAction *rightBtn = [UIAlertAction actionWithTitle:rightStr style:rightStyle? :UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (self.rightBlock) {
                self.rightBlock(self);
            }
        }];
        if (rightColor) [rightBtn setValue:rightColor forKey:@"titleTextColor"];
        [alertController addAction:rightBtn];
    }
    [[LBUtil getCurrentViewController] presentViewController:alertController animated:YES completion:nil];
}

// set AlertVC-message TextAlignment
- (void)lb_setAlertVCConetentAlignmentLeft:(UIAlertController *)alertController messageAlignment:(NSTextAlignment )messageAlignment{
    UIView *messageParentView = [self getParentViewOfTitleAndMessageFromView:alertController.view];
    if (messageParentView && messageParentView.subviews.count > 1) {
        UILabel *messageLb = messageParentView.subviews[1];
        messageLb.textAlignment = messageAlignment;
    }
}

// get AlertVC-title/message ParentView
- (UIView *)getParentViewOfTitleAndMessageFromView:(UIView *)view {
    for (UIView *subView in view.subviews) {
        if ([subView isKindOfClass:[UILabel class]]) {
            return view;
        }else{
            UIView *resultV = [self getParentViewOfTitleAndMessageFromView:subView];
            if (resultV) return resultV;
        }
    }
    return nil;
}

@end

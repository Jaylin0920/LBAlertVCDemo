//
//  LBAlertVC.h
//  LBAlertJustifyLeftDemo
//
//  Created by JiBaoBao on 17/6/8.
//  Copyright © 2017年 JiBaoBao. All rights reserved.
//

/**
 *  类注释：alertVC封装
 *
 *  支持：(1)更改内容对齐方式
 *       (2)左/右按钮的内容、颜色、样式更改；
 *       (3)一个/两个按钮
 *       (4)block、delegate两种调用方法
 *  限制：不支持两个以上按钮
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol LBAlertVCDelegate <NSObject>
- (void)lbAlertVC:(UIAlertController *)alertVC buttonIndex:(NSInteger)buttonIndex;
@end

typedef void(^LeftBlock)();
typedef void(^RightBlock)();

@interface LBAlertVC : NSObject

/**
 *  增加tag - 多个调用时方便区分
 *
 *  UIAlertView 继承自UIView，支持tag
 *  UIAlertController 继承自UIViewController，不支持tag
 */
@property (nonatomic, assign) NSInteger tag;

+ (LBAlertVC *)sharedInstance;


/**
 *  弹出alertVC - 一个按钮样式 (仅支持block)
 */
- (void)showAlertVC_OneWithTitle:(NSString *)titleStr
                         message:(NSString *)messageStr
                messageAlignment:(NSTextAlignment )messageAlignment
                      leftBtnStr:(NSString *)leftStr
                       leftBlock:(LeftBlock)leftBlock;

/**
 *  弹出alertVC - 两个按钮样式 (仅支持block)
 */
- (void)showAlertVC_BaseWithTitle:(NSString *)titleStr
                          message:(NSString *)messageStr
                 messageAlignment:(NSTextAlignment )messageAlignment
                       leftBtnStr:(NSString *)leftStr
                      rightBtnStr:(NSString *)rightStr
                        leftBlock:(LeftBlock)leftBlock
                       rightBlock:(RightBlock)rightBlock;

/**
 *  弹出alertVC - 两个按钮样式 (仅支持delegate)
 */
- (void)showAlertVC_WithDelegate_BaseWithTitle:(NSString *)titleStr
                                       message:(NSString *)messageStr
                              messageAlignment:(NSTextAlignment )messageAlignment
                                    leftBtnStr:(NSString *)leftStr
                                   rightBtnStr:(NSString *)rightStr
                                      delegate:(id /**<LBAlertVCDelegate>*/)delegate;

/**
 弹出alertVC - 高定制版
 (支持Block、Delegate)
 
 @param titleStr 标题
 @param messageStr 内容
 @param messageAlignment 内容对齐方式 (默认:居左)
 @param leftStr 左按钮内容 (不设置，则只有一个按钮)
 @param leftStyle 左按钮样式 (默认:UIAlertActionStyleDefault)
 @param leftColor 左按钮颜色 (默认:系统颜色)
 @param rightStr 右按钮内容
 @param rightStyle 右按钮样式
 @param rightColor 右按钮颜色
 @param leftBlock 右按钮Block
 @param rightBlock 右按钮Block
 @param delegate 支持代理 (适用于：多页面共用同一封装方法时，这个方法是类方法，弹窗交给封装方法展示，点击事件交给原页面，此时block无法在类方法中灵活回调，代理在原页面调用更为灵活)
        (建议，block或者delegate选择一个使用；推荐block，内存增加的更少)

 @return
 */
- (void)showAlertVCWithTitle:(NSString *)titleStr
                     message:(NSString *)messageStr
            messageAlignment:(NSTextAlignment )messageAlignment
                  leftBtnStr:(NSString *)leftStr
                leftBtnStyle:(UIAlertActionStyle)leftStyle
                leftBtnColor:(UIColor *)leftColor
                 rightBtnStr:(NSString *)rightStr
                leftBtnStyle:(UIAlertActionStyle)rightStyle
               rightBtnColor:(UIColor *)rightColor
                   leftBlock:(LeftBlock)leftBlock
                  rightBlock:(RightBlock)rightBlock
                    delegate:(id /**<LBAlertVCDelegate>*/)delegate;


@end

//
//  LBAlertVC.h
//  LBAlertJustifyLeftDemo
//
//  Created by JiBaoBao on 17/6/8.
//  Copyright © 2017年 JiBaoBao. All rights reserved.
//

/**
 *  类注释：alertVC封装
 *  （支持：更改内容对齐方式；左/右按钮的内容、颜色、样式更改；一个/两个按钮）
 *  （限制：不支持两个以上按钮）
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^LeftBlock)();
typedef void(^RightBlock)();
@interface LBAlertVC : NSObject

+ (LBAlertVC *)sharedInstance;

/**
 弹出alertVC
 
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

 @return <#void#>
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
                       leftB:(LeftBlock)leftBlock
                      rightB:(RightBlock)rightBlock;


@end

//
//  LBUtil.m
//  LBAlertJustifyLeftDemo
//
//  Created by JiBaoBao on 17/6/8.
//  Copyright © 2017年 JiBaoBao. All rights reserved.
//

#import "LBUtil.h"

@implementation LBUtil

//如：UITabbarController——>UINavigationController——>UIViewController——>presentViewController——>UINavigationController——>UIViewController.
//这种流程的情景下，单单是getCurrentViewController方法就无法正确获取当前屏幕上的ViewController了。
//于是我补充了getTopViewController:这个方法。
//获取当前屏幕显示的viewcontroller
+(UIViewController *)getCurrentViewController{
    UIViewController *result = nil;
    UIWindow * window = [self getMainWindow];
    UIView *frontView = [[window subviews] lastObject];
    
    id nextResponder = [frontView nextResponder];
    while ([nextResponder nextResponder]) {
        nextResponder = [nextResponder nextResponder];
    }
    
    if ([nextResponder isKindOfClass:[UIViewController class]]) result = nextResponder;
    else result = window.rootViewController;
    return [self getTopViewController:result];
}

+ (UIWindow *)getMainWindow {
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows){
            if (tmpWin.windowLevel == UIWindowLevelNormal){
                window = tmpWin;
                break;
            }
        }
    }
    return window;
}

+(UIViewController *)getTopViewController:(UIViewController *)viewController {
    if ([viewController isKindOfClass:[UITabBarController class]]) {
        return [self getTopViewController:[(UITabBarController *)viewController selectedViewController]];
    } else if ([viewController isKindOfClass:[UINavigationController class]]) {
        return [self getTopViewController:[(UINavigationController *)viewController topViewController]];
    } else if (viewController.presentedViewController) {
        return [self getTopViewController:viewController.presentedViewController];
    } else {
        return viewController;
    }
}

@end

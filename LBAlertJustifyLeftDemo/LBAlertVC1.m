//
//  LBAlertVC1.m
//  LBAlertJustifyLeftDemo
//
//  Created by JiBaoBao on 17/5/31.
//  Copyright © 2017年 JiBaoBao. All rights reserved.
//

#import "LBAlertVC1.h"
#import <objc/runtime.h>

@interface LBAlertVC1 ()
@property (nonatomic, strong) UIAlertController *alert;
@end

@implementation LBAlertVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = [NSString stringWithFormat:@"%@",[self class]];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self showAlertViewWithChange:YES];
}


#pragma mark - LBAlertVC1

- (void)showAlertViewWithChange:(BOOL)isChange {
    _alert = [UIAlertController alertControllerWithTitle:@"title"
                                                 message:@"this is a ale史蒂夫i 哦额就让我颇具惹我哭了认可了嗯弗兰克；摩免费rt"
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                         }];
    UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:@"destructive"
                                                                style:UIAlertActionStyleDestructive
                                                              handler:^(UIAlertAction * _Nonnull action) {
                                                              }];
    [_alert addAction:cancelAction];
    [_alert addAction:destructiveAction];
    if (isChange) [self runtimeProperty];
    [self presentViewController:_alert animated:YES completion:nil];
}

- (void)runtimeProperty {
    unsigned int count = 0;
    Ivar *property = class_copyIvarList([UIAlertController class], &count);
    for (int i = 0; i < count; i++) {
        Ivar var = property[i];
        const char *name = ivar_getName(var);
        const char *type = ivar_getTypeEncoding(var);
//        NSLog(@"var= %@ ",var);
//        NSLog(@"name= %s ;   type= %s",name,type);
    }
    
    Ivar message = property[2];
    
    //字体修改
    UIFont *big = [UIFont systemFontOfSize:30];
    UIFont *small = [UIFont systemFontOfSize:18];
    UIColor *red = [UIColor redColor];
    UIColor *blue = [UIColor blueColor];
    //    NSTextAlignment*ali=NSTextAlignmentLeft;
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:@"th尝试 scribe your 是点击拉家带口了发酵，安静的舅舅企鹅全文欧切 adsf。" attributes:@{NSFontAttributeName:big, NSForegroundColorAttributeName:red,}];
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentLeft;//设置对齐方式
    
    [str setAttributes:@{NSFontAttributeName:small} range:NSMakeRange(0, 2)];
    [str setAttributes:@{NSForegroundColorAttributeName:blue} range:NSMakeRange(0, 4)];
    [str setAttributes:@{NSParagraphStyleAttributeName:paragraph} range:NSMakeRange(0, 4)];
    //最后把message内容替换掉
    object_setIvar(_alert, message, str);
    //    object_setIvar(_alert, message, paragraph);
}


@end

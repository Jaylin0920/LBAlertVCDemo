# 系统AlertVC文字居左 
</br>


## 两种解决方案
1.runtime方法
>alert可定制性更强

2.修改alertVC的subviews 
>支持：message居左；按钮变色等；

>限制：message文字大小、message颜色定制

</br>


## 采用方法二的简单封装

<b>LBAlertVC</b> 

1.一键调用示例

 ```
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
 ```

2.效果示例
 
![Snip20170608_97.png](https://ooo.0o0.ooo/2017/06/08/593973a8daa93.png)



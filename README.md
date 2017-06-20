## Theme
系统AlertVC文字居左 

</br>


## 两种解决方案
1.runtime方法
>alert可定制性更强

2.修改alertVC的subviews 
>支持：message居左；按钮变色等；

>限制：message文字大小、message颜色定制

</br>


## 采用方法2的简单封装 - LBAlertVC

<b> 1.简易版 - 只支持一个按钮 </b> 

 ```
 [[LBAlertVC sharedInstance] showAlertVC_OneWithTitle:@"我是标题"
                                             message:@"我是message"
                                    messageAlignment:NSTextAlignmentLeft
                                          leftBtnStr:@"左按钮"
                                           leftBlock:^{
                                               NSLog(@"one - leftBtn click");
}];
 ```


<b> 2.基础版 - 支持两个按钮 </b> 

 ```
 [[LBAlertVC  sharedInstance]showAlertVC_BaseWithTitle:@"我是标题"
                                              message:@"我是message"
                                     messageAlignment:NSTextAlignmentLeft
                                           leftBtnStr:@"左按钮"
                                          rightBtnStr:@"我是右按钮"
                                            leftBlock:^{
                                                NSLog(@"base - leftBtn click");
                                            } rightBlock:^{
                                                NSLog(@"base - rightBtn click");
}];
 ```

<b> 3.高定制版 - 支持多元素定制 </b> 

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

<b> 4.效果示例 </b> 
 
![Snip20170608_97.png](https://ooo.0o0.ooo/2017/06/08/593973a8daa93.png)



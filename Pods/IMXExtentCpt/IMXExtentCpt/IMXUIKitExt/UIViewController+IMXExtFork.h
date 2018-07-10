//
//  UIViewController+IMXExtFork.h
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/15.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (IMXExtFork)

+ (UIViewController *)imx_CurrentViewCtrl;
+ (UIWindow *)imx_window;
+ (void)changeStatusBarBackgroundColor:(UIColor *)color;
@end

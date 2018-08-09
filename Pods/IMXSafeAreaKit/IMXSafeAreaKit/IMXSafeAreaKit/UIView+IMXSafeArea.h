//
//  UIView+IMXSafeArea.h
//  IMXBaseCpt
//
//  Created by zhoupanpan on 2017/12/1.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 简单获取安全区域。
 注意获取的时机
 */
@interface UIView (IMXSafeArea)
- (UIEdgeInsets)imx_safeArea;
- (CGFloat)imx_safeTop;
- (CGFloat)imx_safeBottom;
- (CGFloat)imx_safeLeft;
- (CGFloat)imx_safeRight;
@end

//
//  UIView+IMXSafeArea.m
//  IMXBaseCpt
//
//  Created by zhoupanpan on 2017/12/1.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import "UIView+IMXSafeArea.h"

@implementation UIView (IMXSafeArea)

- (UIEdgeInsets)imx_safeArea{
    if(@available(iOS 11.0, *)){
        return  self.safeAreaInsets;
    }else{
        return UIEdgeInsetsZero;
    }
}
- (CGFloat)imx_safeTop{
    return [self imx_safeArea].top;
}
- (CGFloat)imx_safeBottom{
    return [self imx_safeArea].bottom;
}
- (CGFloat)imx_safeLeft{
    return [self imx_safeArea].left;
}
- (CGFloat)imx_safeRight{
   return [self imx_safeArea].right;
}
@end

//
//  UIColor+IMXColorKit.h
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/1.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (IMXColorKit)
//0x38569
+ (UIColor *)imxColorWithHex:(int)rgb;
+ (UIColor *)imxColorWithHex:(int)rgb alpha:(CGFloat)alpha;
+ (UIColor *)imxColorWithR:(CGFloat)red G:(CGFloat)green  B:(CGFloat)blue  A:(CGFloat)alpha;
+ (UIColor *)imxRandomColor;
//TODO:常用色值定义
#define BRT_BLUE_COLOR [UIColor ]
@end

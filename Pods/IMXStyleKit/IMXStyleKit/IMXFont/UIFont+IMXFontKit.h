//
//  UIFont+IMXFontKit.h
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/15.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (IMXFontKit)
#pragma mark ======  font size  ======
+ (CGFloat)imx_fontSize_T1;
+ (CGFloat)imx_fontSize_T2;
+ (CGFloat)imx_fontSize_T3;
+ (CGFloat)imx_fontSize_T4;
+ (CGFloat)imx_fontSize_T5;
+ (CGFloat)imx_fontSize_T6;
+ (CGFloat)imx_fontSize_T7;
#pragma mark ======  system font  ======
+ (UIFont *)imx_font_T1;
+ (UIFont *)imx_font_T2;
+ (UIFont *)imx_font_T3;
+ (UIFont *)imx_font_T4;
+ (UIFont *)imx_font_T5;
+ (UIFont *)imx_font_T6;
+ (UIFont *)imx_font_T7;
+ (UIFont *)imx_font:(CGFloat)size;
#pragma mark ======  system bold font  ======
+ (UIFont *)imx_boldFont_T1;
+ (UIFont *)imx_boldFont_T2;
+ (UIFont *)imx_boldFont:(CGFloat)size;
#pragma mark ======  system thin font  ======
+ (UIFont *)imx_thinFont_T1;
+ (UIFont *)imx_thinFont:(CGFloat)size;
#pragma mark ======  helveticaNeue font  ======
+ (UIFont *)imx_helNeueFont:(CGFloat)size;
+ (UIFont *)imx_boldHelNeueFont:(CGFloat)size;
+ (UIFont *)imx_thinHelNeueFont:(CGFloat)size;
#pragma mark ======  original  ======
+ (UIFont *)imx_fontWithName:(NSString *)name size:(CGFloat)size;
@end

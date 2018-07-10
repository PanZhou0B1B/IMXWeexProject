//
//  IMXIconfont.h
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/1.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IMXIconfont : NSObject
//can override in subClass
+ (UIFont *)mainIconFontWithSize:(CGFloat)size;
//code ~ @"0xe832"
+ (NSString *)stringWithCode:(NSString *)code;
+ (UILabel *)labelWithCode:(NSString *)code tintColor:(UIColor *)color fontSize:(CGFloat)size;
+ (UIButton *)buttonWithCode:(NSString *)code tintColor:(UIColor *)color fontSize:(CGFloat)size;
+ (UIImage *)imageWithCode:(NSString *)code tintColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)imageWithCode:(NSString *)code tintColor:(UIColor *)color size:(CGSize)size fontSize:(CGFloat)fontSize;
@end

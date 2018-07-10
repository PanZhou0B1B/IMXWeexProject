//
//  NSString+IMXFormatCheck.h
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/1.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (IMXFormatCheck)
#pragma mark ======  string retSize  ======
- (CGSize)imxSizeWithFixWidth:(float)width font:(UIFont *)font;
- (CGSize)imxSizeWithFixHeight:(float)height font:(UIFont *)font;
+ (CGSize)imxSizeOfString:(NSString *)text withWidth:(float)width font:(UIFont *)font;
+ (CGSize)imxSizeOfString:(NSString *)text withHeight:(float)height font:(UIFont *)font;
//字符串加中划线
- (NSAttributedString *)attributeWithUnderLineStyleSingle;
@end

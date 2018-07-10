//
//  NSAttributedString+IMXHighlightKit.h
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/16.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (IMXHighlightKit)
+ (instancetype)imx_attributeStringWithString:(NSString *)string highlight:(NSString *)highlight highlightColor:(UIColor *)highlightColor;
+ (instancetype)imx_attributeStringWithString:(NSString *)string highlight:(NSString *)highlight highlightColor:(UIColor *)highlightColor highlightFont:(UIFont*)font;
- (NSAttributedString *)imx_attributedStringWithHighlight:(NSString *)highlight highlightColor:(UIColor *)highlightColor;
+ (instancetype)imx_attributeStringWithString:(NSString *)string highlight:(NSString *)highlight normals:(NSDictionary *)attrnDic highlights:(NSDictionary *)attrDic;
@end

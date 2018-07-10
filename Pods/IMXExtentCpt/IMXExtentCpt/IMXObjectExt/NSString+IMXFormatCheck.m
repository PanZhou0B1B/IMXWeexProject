//
//  NSString+IMXFormatCheck.m
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/1.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import "NSString+IMXFormatCheck.h"

@implementation NSString (IMXFormatCheck)

#pragma mark ======  string retSize  ======
- (CGSize)imxSizeWithFixWidth:(float)width font:(UIFont *)font {
    CGSize size = CGSizeMake(width, MAXFLOAT);
    NSDictionary *tdic = @{NSFontAttributeName: font};
    size = [self boundingRectWithSize:size
                              options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                           attributes:tdic
                              context:nil].size;
    return size;
}
- (CGSize)imxSizeWithFixHeight:(float)height font:(UIFont *)font{
    CGSize size = CGSizeMake(MAXFLOAT,height);
    NSDictionary *tdic = @{NSFontAttributeName: font};
    size = [self boundingRectWithSize:size
                              options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                           attributes:tdic
                              context:nil].size;
    return size;
}
+ (CGSize)imxSizeOfString:(NSString *)text withWidth:(float)width font:(UIFont *)font {
    CGSize size = CGSizeMake(width, MAXFLOAT);
    NSDictionary *tdic = @{NSFontAttributeName: font};
    size = [text boundingRectWithSize:size
                              options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                           attributes:tdic
                              context:nil].size;
    return size;
}
+ (CGSize)imxSizeOfString:(NSString *)text withHeight:(float)height font:(UIFont *)font {
    CGSize size = CGSizeMake(MAXFLOAT, height);
    if (!font) {
        return CGSizeZero;
    }
    NSDictionary *tdic = @{NSFontAttributeName: font};
    size = [text boundingRectWithSize:size
                              options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                           attributes:tdic
                              context:nil].size;
    return size;
}
//字符串加中划线
- (NSAttributedString *)attributeWithUnderLineStyleSingle{
    
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:self attributes:attribtDic];
    
    return attribtStr;
    
}
@end

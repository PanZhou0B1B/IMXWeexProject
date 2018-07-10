//
//  NSAttributedString+IMXHighlightKit.m
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/16.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import "NSAttributedString+IMXHighlightKit.h"

@implementation NSAttributedString (IMXHighlightKit)
+ (instancetype)imx_attributeStringWithString:(NSString *)string highlight:(NSString *)highlight highlightColor:(UIColor *)highlightColor{
    NSArray* results = [[[NSRegularExpression alloc] initWithPattern:highlight options:0 error:nil] matchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    NSMutableAttributedString *attribText = [[NSMutableAttributedString alloc] initWithString:string];
    [attribText beginEditing];
    for(NSTextCheckingResult *result in results)
    {
        [attribText addAttribute:NSForegroundColorAttributeName value:highlightColor range:result.range];
    }
    [attribText endEditing];
    return attribText;
}
+ (instancetype)imx_attributeStringWithString:(NSString *)string highlight:(NSString *)highlight highlightColor:(UIColor *)highlightColor highlightFont:(UIFont*)font{
    if(!highlight || !string){
        return nil;
    }
    NSArray* results = [[[NSRegularExpression alloc] initWithPattern:highlight options:0 error:nil] matchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    NSMutableAttributedString *attribText = [[NSMutableAttributedString alloc] initWithString:string];
    [attribText beginEditing];
    for(NSTextCheckingResult *result in results)
    {
        [attribText addAttribute:NSForegroundColorAttributeName value:highlightColor range:result.range];
        [attribText addAttribute:NSFontAttributeName value:font range:result.range];
    }
    [attribText endEditing];
    return attribText;
}
- (NSAttributedString *)imx_attributedStringWithHighlight:(NSString *)highlight highlightColor:(UIColor *)highlightColor
{
    NSArray* results = [[[NSRegularExpression alloc] initWithPattern:highlight options:0 error:nil] matchesInString:self.string options:0 range:NSMakeRange(0, self.string.length)];
    
    NSMutableAttributedString *attribText = [[NSMutableAttributedString alloc] initWithAttributedString:self];
    [attribText beginEditing];
    for(NSTextCheckingResult *result in results)
    {
        [attribText addAttribute:NSForegroundColorAttributeName value:highlightColor range:result.range];
    }
    [attribText endEditing];
    return attribText;
}
+ (instancetype)imx_attributeStringWithString:(NSString *)string highlight:(NSString *)highlight normals:(NSDictionary *)attrnDic highlights:(NSDictionary *)attrDic{
    if(!highlight){
        return nil;
    }
    NSArray* results = [[[NSRegularExpression alloc] initWithPattern:highlight options:NSRegularExpressionCaseInsensitive | NSRegularExpressionAllowCommentsAndWhitespace error:nil] matchesInString:string options:0 range:NSMakeRange(0, string.length)];
    
    NSMutableAttributedString *attribText = [[NSMutableAttributedString alloc] initWithString:string attributes:attrnDic];
    
    [attribText beginEditing];
    for(NSTextCheckingResult *result in results)
    {
        [attribText addAttributes:attrDic range:result.range];
    }
    [attribText endEditing];
    return attribText;
}

@end

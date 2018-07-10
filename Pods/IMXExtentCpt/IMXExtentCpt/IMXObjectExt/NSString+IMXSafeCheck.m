//
//  NSString+IMXSafeCheck.m
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/1.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import "NSString+IMXSafeCheck.h"

#define IMX_CONVERT_USING(strtowhat) {\
char buf[24];\
if ([self getCString:buf maxLength:24 encoding:NSASCIIStringEncoding]) \
return strtowhat(buf, NULL, 10);\
} \
return strtowhat([self UTF8String], NULL, 10);

@implementation NSString (IMXSafeCheck)
#pragma mark ======  simple check  ======
+ (BOOL)imxStringIsEmpty:(NSString *)string
{
    if (!string || ![string isKindOfClass:[NSString class]] ||string.length == 0)
    {
        return YES;
    }
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0;
}
- (BOOL)imxIsNotEmpty{
    return (self.length > 0);
}

- (BOOL)imxIsEmpty
{
    return (self.length == 0);
}

- (NSString *)imxTrim
{
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}
- (NSString *)imxTrimPunctuation
{
    NSCharacterSet *set = [NSCharacterSet punctuationCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}
- (NSInteger)imxBitLength
{
    const char * unicodeStr = [self cStringUsingEncoding:NSUnicodeStringEncoding];
    NSUInteger unicodeLen = [self lengthOfBytesUsingEncoding:NSUnicodeStringEncoding];
    
    int retVal = 0;
    for (int i = 0; i < unicodeLen; i++) {
        if (*unicodeStr) ++retVal;
        unicodeStr++;
    }
    return retVal;
}
+ (NSString *)imxSpaceString:(NSString *)oriString{
    return oriString.length > 0 ? oriString : @"";
}
+ (NSString *)imxRetString:(NSString *)oriString bydefault:(NSString *)defaultValue{
    return oriString.length > 0 ? oriString : defaultValue;
}
#pragma mark ======  to char  ======
- (char)imxCharValue
{
    const char *str = [self UTF8String];
    return str[0];
}

- (unsigned char)imxUnsignedCharValue
{
    const char *str = [self UTF8String];
    return (unsigned char)str[0];
}
#pragma mark ======  to BOOL  ======
- (BOOL)imxBoolValue
{
    if (([self caseInsensitiveCompare:@"YES"] == NSOrderedSame)
        || ([self caseInsensitiveCompare:@"Y"]  == NSOrderedSame)
        || [self isEqualToString:@"1"]
        || ([self caseInsensitiveCompare:@"true"] == NSOrderedSame)
        || ([self caseInsensitiveCompare:@"t"] == NSOrderedSame)){
        return YES;
    }
    else {
        return NO;
    }
}
#pragma mark ======  to Int  ======
- (short)imxShortValue
{
    int i = [self intValue];
    return (short)i;
}

- (unsigned short)imxUnsignedShortValue
{
    return (unsigned short)[self imxUnsignedLongValue];
}

- (unsigned int)imxUnsignedIntValue
{
    return (unsigned int)[self imxUnsignedLongValue];
}
- (long)imxLongValue
{
    IMX_CONVERT_USING(strtol);
}
- (unsigned long)imxUnsignedLongValue
{
    IMX_CONVERT_USING(strtoul);
}
- (unsigned long long)imxUnsignedLongLongValue
{
    IMX_CONVERT_USING(strtoull);
}
#pragma mark ======  to NSInteger  ======
- (NSUInteger)imxUnsignedIntegerValue
{
    return (NSUInteger)[self imxUnsignedLongValue];
}
#pragma mark ======  to Number  ======
- (NSNumber *)imxNumberValue
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    return [formatter numberFromString:self];
}
#pragma mark ======  to Array  ======
- (NSArray *)imxArrayValue
{
    return [NSArray arrayWithObject:self];
}
#pragma mark ======  to Dic  ======
- (NSDictionary *)imxDictionaryValue
{
    return [self propertyList];
}
#pragma mark ======  to Data  ======
- (NSData *)imxDataValue
{
    return [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
}
#pragma mark ======  to Decimal  ======
- (NSDecimal)imxDecimalValue
{
    return [[NSDecimalNumber decimalNumberWithString:self] decimalValue];
}
- (NSDecimalNumber *)imxDecimalNumberValue
{
    return [NSDecimalNumber decimalNumberWithString:self];
}
@end

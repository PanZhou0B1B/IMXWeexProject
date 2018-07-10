//
//  NSString+IMXSafeCheck.h
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/1.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <Foundation/Foundation.h>
#define IMX_ChangeEmptyString(string)  [NSString imxSpaceString:string] //如果string不存在返回@""
@interface NSString (IMXSafeCheck)
#pragma mark ======  simple check  ======
//建议使用该方法
+ (BOOL)imxStringIsEmpty:(NSString *)string;
- (BOOL)imxIsNotEmpty;
- (BOOL)imxIsEmpty;
- (NSString *)imxTrim;
- (NSString *)imxTrimPunctuation;
- (NSInteger)imxBitLength;
+ (NSString *)imxSpaceString:(NSString *)oriString;
+ (NSString *)imxRetString:(NSString *)oriString bydefault:(NSString *)defaultValue;
#pragma mark ======  to char  ======
- (char)imxCharValue;
- (unsigned char)imxUnsignedCharValue;
#pragma mark ======  to BOOL  ======
- (BOOL)imxBoolValue;
#pragma mark ======  to Int  ======
- (short)imxShortValue;
- (unsigned short)imxUnsignedShortValue;
- (unsigned int)imxUnsignedIntValue;
- (long)imxLongValue;
- (unsigned long)imxUnsignedLongValue;
- (unsigned long long)imxUnsignedLongLongValue;
#pragma mark ======  to NSInteger  ======
- (NSUInteger)imxUnsignedIntegerValue;
#pragma mark ======  to Number  ======
- (NSNumber *)imxNumberValue;
#pragma mark ======  to Array  ======
- (NSArray *)imxArrayValue;
#pragma mark ======  to Dic  ======
- (NSDictionary *)imxDictionaryValue;
#pragma mark ======  to Data  ======
- (NSData *)imxDataValue;
#pragma mark ======  to Decimal  ======
- (NSDecimal)imxDecimalValue;
- (NSDecimalNumber *)imxDecimalNumberValue;
@end

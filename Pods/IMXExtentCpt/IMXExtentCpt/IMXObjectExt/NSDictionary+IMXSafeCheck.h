//
//  NSDictionary+IMXSafeCheck.h
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/1.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDictionary (IMXSafeCheck)
#pragma mark ======  simple check  ======
- (BOOL)imxIsEmpty;
- (id)imxObjectForKey:(id)aKey;
- (id)imxObjectForKey:(id)key class:(Class)aClass;
- (id)imxObjectForKey:(id)key class:(Class)aClass defaultValue:(id)defaultValue;
#pragma mark ======  to Array  ======
- (NSArray *)imxArrayForKey:(id)key;
- (NSArray *)imxArrayForKey:(id)key defaultValue:(NSArray *)defaultValue;
#pragma mark ======  to Dic  ======
- (NSDictionary *)imxDictionaryForKey:(id)key;
- (NSDictionary *)imxDictionaryForKey:(id)key defaultValue:(NSDictionary *)defaultValue;
#pragma mark ======  to Data  ======
- (NSData *)imxDataForKey:(id)key;
- (NSData *)imxDataForKey:(id)key defaultValue:(NSData *)defaultValue;
#pragma mark ======  to String  ======
- (NSString *)imxStringForKey:(id)key;
- (NSString *)imxStringForKey:(id)key defaultValue:(NSString *)defaultValue;
#pragma mark ======  to Number  ======
- (NSNumber *)imxNumberForKey:(id)key;
- (NSNumber *)imxNumberForKey:(id)key defaultValue:(NSNumber *)defaultValue;
#pragma mark ======  to Char  ======
- (char)imxCharForKey:(id)key;
- (unsigned char)imxUnsignedCharForKey:(id)key;
#pragma mark ======  to Int  ======
- (short)imxShortForKey:(id)key;
- (short)imxShortForKey:(id)key defaultValue:(short)defaultValue;
- (unsigned short)imxUnsignedShortForKey:(id)key;
- (unsigned short)imxUnsignedShortForKey:(id)key defaultValue:(unsigned short)defaultValue;
- (int)imxIntForKey:(id)key;
- (int)imxIntForKey:(id)key defaultValue:(int)defaultValue;
- (unsigned int)imxUnsignedIntForKey:(id)key;
- (unsigned int)imxUnsignedIntForKey:(id)key defaultValue:(unsigned int)defaultValue;
- (long)imxLongForKey:(id)key;
- (long)imxLongForKey:(id)key defaultValue:(long)defaultValue;
- (unsigned long)imxUnsignedLongForKey:(id)key;
- (unsigned long)imxUnsignedLongForKey:(id)key defaultValue:(unsigned long)defaultValue;
- (long long)imxLongLongForKey:(id)key;
- (long long)imxLongLongForKey:(id)key defaultValue:(long long)defaultValue;
- (unsigned long long)imxUnsignedLongLongForKey:(id)key;
- (unsigned long long)imxUnsignedLongLongForKey:(id)key defaultValue:(unsigned long long)defaultValue;
#pragma mark ======  to Float&Double  ======
- (float)imxFloatForKey:(id)key;
- (float)imxFloatForKey:(id)key defaultValue:(float)defaultValue;
- (double)imxDoubleForKey:(id)key;
- (double)imxDoubleForKey:(id)key defaultValue:(double)defaultValue;
#pragma mark ======  to BOOL  ======
- (BOOL)imxBoolForKey:(id)key;
- (BOOL)imxBoolForKey:(id)key defaultValue:(BOOL)defaultValue;
#pragma mark ======  to Integer  ======
- (NSInteger)imxIntegerForKey:(id)key;
- (NSInteger)imxIntegerForKey:(id)key defaultValue:(NSInteger)defaultValue;
- (NSUInteger)imxUnsignedIntegerForKey:(id)key;
- (NSUInteger)imxUnsignedIntegerForKey:(id)key defaultValue:(NSUInteger)defaultValue;
#pragma mark ======  to CG  ======
- (CGPoint)imxPointForKey:(id)key;
- (CGPoint)imxPointForKey:(id)key defaultValue:(CGPoint)defaultValue;
- (CGSize)imxSizeForKey:(id)key;
- (CGSize)imxSizeForKey:(id)key defaultValue:(CGSize)defaultValue;
- (CGRect)imxRectForKey:(id)key;
- (CGRect)imxRectForKey:(id)key defaultValue:(CGRect)defaultValue;
@end
@interface NSMutableDictionary (IMXSafeCheck)
#pragma mark ======  Object set&remove  ======
- (void)imxSetObject:(id)anObject forKey:(id <NSCopying>)aKey;
- (void)imxRemoveObjectForKey:(id)aKey;
#pragma mark ======  obj:Char set  ======
- (void)imxSetChar:(char)value forKey:(id<NSCopying>)key;
- (void)imxSetUnsignedChar:(unsigned char)value forKey:(id<NSCopying>)key;
#pragma mark ======  obj:Int set  ======
- (void)imxSetShort:(short)value forKey:(id<NSCopying>)key;
- (void)imxSetUnsignedShort:(unsigned short)value forKey:(id<NSCopying>)key;
- (void)imxSetInt:(int)value forKey:(id<NSCopying>)key;
- (void)imxSetUnsignedInt:(unsigned int)value forKey:(id<NSCopying>)key;
- (void)imxSetLong:(long)value forKey:(id<NSCopying>)key;
- (void)imxsetUnsignedLong:(unsigned long)value forKey:(id<NSCopying>)key;
- (void)imxSetLongLong:(long long)value forKey:(id<NSCopying>)key;
- (void)imxSetUnsignedLongLong:(unsigned long long)value forKey:(id<NSCopying>)key;
#pragma mark ======  obj:Float&Double set  ======
- (void)imxSetFloat:(float)value forKey:(id<NSCopying>)key;
- (void)imxSetDouble:(double)value forKey:(id<NSCopying>)key;
#pragma mark ======  obj:BOOL set  ======
- (void)imxSetBool:(BOOL)value forKey:(id<NSCopying>)key;
#pragma mark ======  obj:Integer set  ======
- (void)imxsetInteger:(NSInteger)value forKey:(id<NSCopying>)key;
- (void)imxSetUnsignedInteger:(NSUInteger)value forKey:(id<NSCopying>)key;
#pragma mark ======  obj:CG set  ======
- (void)imxSetPointValue:(CGPoint)value forKey:(id<NSCopying>)key;
- (void)imxSetSizeValue:(CGSize)value forKey:(id<NSCopying>)key;
- (void)imxSetRectValue:(CGRect)value forKey:(id<NSCopying>)key;
@end

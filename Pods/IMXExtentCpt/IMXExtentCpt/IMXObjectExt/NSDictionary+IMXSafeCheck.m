//
//  NSDictionary+IMXSafeCheck.m
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/1.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import "NSDictionary+IMXSafeCheck.h"
#import "NSString+IMXSafeCheck.h"

@implementation NSDictionary (IMXSafeCheck)
#pragma mark ======  simple check  ======
- (BOOL)imxIsEmpty
{
    return ([self count] == 0);
}
- (id)imxObjectForKey:(id)aKey
{
    if (aKey == nil) {
        return nil;
    }
    id value = [self objectForKey:aKey];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}

- (id)imxObjectForKey:(id)key class:(Class)aClass
{
    return [self imxObjectForKey:key class:aClass defaultValue:nil];
}

- (id)imxObjectForKey:(id)key class:(Class)aClass defaultValue:(id)defaultValue
{
    id value = [self imxObjectForKey:key];
    if (![value isKindOfClass:aClass]) {
        return defaultValue;
    }
    return value;
}
#pragma mark ======  to Array  ======
- (NSArray *)imxArrayForKey:(id)key
{
    return [self imxArrayForKey:key defaultValue:nil];
}

- (NSArray *)imxArrayForKey:(id)key defaultValue:(NSArray *)defaultValue
{
    return [self imxObjectForKey:key class:[NSArray class] defaultValue:defaultValue];
}
#pragma mark ======  to Dic  ======
- (NSDictionary *)imxDictionaryForKey:(id)key
{
    return [self imxDictionaryForKey:key defaultValue:nil];
}

- (NSDictionary *)imxDictionaryForKey:(id)key defaultValue:(NSDictionary *)defaultValue
{
    return [self imxObjectForKey:key class:[NSDictionary class] defaultValue:defaultValue];
}
#pragma mark ======  to Data  ======
- (NSData *)imxDataForKey:(id)key
{
    return [self imxDataForKey:key defaultValue:nil];
}
- (NSData *)imxDataForKey:(id)key defaultValue:(NSData *)defaultValue
{
    return [self imxObjectForKey:key class:[NSData class] defaultValue:defaultValue];
}
#pragma mark ======  to String  ======
- (NSString *)imxStringForKey:(id)key
{
    return [self imxStringForKey:key defaultValue:nil];
}
- (NSString *)imxStringForKey:(id)key defaultValue:(NSString *)defaultValue
{
    id value = [self imxObjectForKey:key];
    
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value stringValue];
    }
    
    if (![value isKindOfClass:[NSString class]]) {
        return defaultValue;
    }
    return value;
}
#pragma mark ======  to Number  ======
- (NSNumber *)imxNumberForKey:(id)key
{
    return [self imxNumberForKey:key defaultValue:nil];
}

- (NSNumber *)imxNumberForKey:(id)key defaultValue:(NSNumber *)defaultValue
{
    id value = [self imxObjectForKey:key];
    
    if ([value isKindOfClass:[NSString class]]) {
        return [value imxNumberValue];
    }
    if (![value isKindOfClass:[NSNumber class]]) {
        return defaultValue;
    }
    
    return value;
}
#pragma mark ======  to Char  ======
- (char)imxCharForKey:(id)key
{
    id value = [self imxObjectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value charValue];
    }
    else if ([value isKindOfClass:[NSString class]]) {
        return [value imxCharValue];
    }
    else {
        return 0x0;
    }
}

- (unsigned char)imxUnsignedCharForKey:(id)key
{
    id value = [self imxObjectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedCharValue];
    }
    else if ([value isKindOfClass:[NSString class]]) {
        return [value imxUnsignedCharValue];
    }
    else {
        return 0x0;
    }
}
#pragma mark ======  to Int  ======
- (short)imxShortForKey:(id)key
{
    return [self imxShortForKey:key defaultValue:0];
}

- (short)imxShortForKey:(id)key defaultValue:(short)defaultValue
{
    id value = [self imxObjectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value shortValue];
    }
    else if ([value isKindOfClass:[NSString class]]) {
        return [value imxShortValue];
    }
    else {
        return defaultValue;
    }
}
- (unsigned short)imxUnsignedShortForKey:(id)key
{
    return [self imxUnsignedShortForKey:key defaultValue:0];
}

- (unsigned short)imxUnsignedShortForKey:(id)key defaultValue:(unsigned short)defaultValue
{
    id value = [self imxObjectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedShortValue];
    }
    else if ([value isKindOfClass:[NSString class]]) {
        return [value imxUnsignedShortValue];
    }
    else {
        return defaultValue;
    }
}
- (int)imxIntForKey:(id)key
{
    return [self imxIntForKey:key defaultValue:0];
}
- (int)imxIntForKey:(id)key defaultValue:(int)defaultValue
{
    id value = [self imxObjectForKey:key];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value intValue];
    }
    else {
        return defaultValue;
    }
}
- (unsigned int)imxUnsignedIntForKey:(id)key
{
    return [self imxUnsignedIntForKey:key defaultValue:0];
}
- (unsigned int)imxUnsignedIntForKey:(id)key defaultValue:(unsigned int)defaultValue
{
    id value = [self imxObjectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedIntValue];
    }
    else if ([value isKindOfClass:[NSString class]]) {
        return [value imxUnsignedIntValue];
    }
    else {
        return defaultValue;
    }
}
- (long)imxLongForKey:(id)key
{
    return [self imxLongForKey:key defaultValue:0];
}
- (long)imxLongForKey:(id)key defaultValue:(long)defaultValue
{
    id value = [self imxObjectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value longValue];
    }
    else if ([value isKindOfClass:[NSString class]]) {
        return [value imxLongValue];
    }
    else {
        return defaultValue;
    }
}

- (unsigned long)imxUnsignedLongForKey:(id)key
{
    return [self imxUnsignedLongForKey:key defaultValue:0];
}

- (unsigned long)imxUnsignedLongForKey:(id)key defaultValue:(unsigned long)defaultValue
{
    id value = [self imxObjectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedLongValue];
    }
    else if ([value isKindOfClass:[NSString class]]) {
        return [value imxUnsignedLongValue];
    }
    else {
        return defaultValue;
    }
}
- (long long)imxLongLongForKey:(id)key
{
    return [self imxLongLongForKey:key defaultValue:0];
}
- (long long)imxLongLongForKey:(id)key defaultValue:(long long)defaultValue
{
    id value = [self imxObjectForKey:key];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value longLongValue];
    }
    else {
        return defaultValue;
    }
}
- (unsigned long long)imxUnsignedLongLongForKey:(id)key
{
    return [self imxUnsignedLongLongForKey:key defaultValue:0];
}
- (unsigned long long)imxUnsignedLongLongForKey:(id)key defaultValue:(unsigned long long)defaultValue
{
    id value = [self imxObjectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedLongLongValue];
    }
    else if ([value isKindOfClass:[NSString class]]) {
        return [value imxUnsignedLongLongValue];
    }
    else {
        return defaultValue;
    }
}
#pragma mark ======  to Float&Double  ======
- (float)imxFloatForKey:(id)key
{
    return [self imxFloatForKey:key defaultValue:0.0];
}
- (float)imxFloatForKey:(id)key defaultValue:(float)defaultValue
{
    id value = [self imxObjectForKey:key];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        float result = [value floatValue];
        return isnan(result) ? defaultValue : result;
    }
    else {
        return defaultValue;
    }
}
- (double)imxDoubleForKey:(id)key
{
    return [self imxDoubleForKey:key defaultValue:0.0];
}
- (double)imxDoubleForKey:(id)key defaultValue:(double)defaultValue
{
    id value = [self imxObjectForKey:key];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        double result = [value doubleValue];
        return isnan(result) ? defaultValue : result;
    }
    else {
        return defaultValue;
    }
}
#pragma mark ======  to BOOL  ======
- (BOOL)imxBoolForKey:(id)key
{
    return [self imxBoolForKey:key defaultValue:NO];
}
- (BOOL)imxBoolForKey:(id)key defaultValue:(BOOL)defaultValue
{
    id value = [self imxObjectForKey:key];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value boolValue];
    }
    else {
        return defaultValue;
    }
}
#pragma mark ======  to Integer  ======
- (NSInteger)imxIntegerForKey:(id)key
{
    return [self imxIntegerForKey:key defaultValue:0];
}
- (NSInteger)imxIntegerForKey:(id)key defaultValue:(NSInteger)defaultValue
{
    id value = [self imxObjectForKey:key];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value integerValue];
    }
    else {
        return defaultValue;
    }
}
- (NSUInteger)imxUnsignedIntegerForKey:(id)key
{
    return [self imxUnsignedIntegerForKey:key defaultValue:0];
}
- (NSUInteger)imxUnsignedIntegerForKey:(id)key defaultValue:(NSUInteger)defaultValue
{
    id value = [self imxObjectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value unsignedIntegerValue];
    }
    else if ([value isKindOfClass:[NSString class]]) {
        return [value imxUnsignedIntegerValue];
    }
    else {
        return defaultValue;
    }
}
#pragma mark ======  to CG  ======
- (CGPoint)imxPointForKey:(id)key
{
    return [self imxPointForKey:key defaultValue:CGPointZero];
}
- (CGPoint)imxPointForKey:(id)key defaultValue:(CGPoint)defaultValue
{
    id value = [self imxObjectForKey:key];
    if ([value isKindOfClass:[NSString class]] && ![value imxIsEmpty]) {
        return CGPointFromString(value);
    }
    else if ([value isKindOfClass:[NSValue class]]) {
        return [value CGPointValue];
    }
    else {
        return defaultValue;
    }
}
- (CGSize)imxSizeForKey:(id)key
{
    return [self imxSizeForKey:key defaultValue:CGSizeZero];
}
- (CGSize)imxSizeForKey:(id)key defaultValue:(CGSize)defaultValue
{
    id value = [self imxObjectForKey:key];
    if ([value isKindOfClass:[NSString class]] && ![value imxIsEmpty]) {
        return CGSizeFromString(value);
    }
    else if ([value isKindOfClass:[NSValue class]]) {
        return [value CGSizeValue];
    }
    else {
        return defaultValue;
    }
}
- (CGRect)imxRectForKey:(id)key
{
    return [self imxRectForKey:key defaultValue:CGRectZero];
}
- (CGRect)imxRectForKey:(id)key defaultValue:(CGRect)defaultValue
{
    id value = [self imxObjectForKey:key];
    if ([value isKindOfClass:[NSString class]] && ![value imxIsEmpty]) {
        return CGRectFromString(value);
    }
    else if ([value isKindOfClass:[NSValue class]]) {
        return [value CGRectValue];
    }
    else {
        return defaultValue;
    }
}

@end

@implementation NSMutableDictionary (IMXSafeCheck)
#pragma mark ======  Object set&remove  ======
- (void)imxSetObject:(id)anObject forKey:(id <NSCopying>)aKey
{
    if (aKey == nil) {
        return;
    }
    
    if (anObject == nil) {
        return;
    }
    
    [self setObject:anObject forKey:aKey];
}
- (void)imxRemoveObjectForKey:(id)aKey
{
    if (aKey == nil) {
        return;
    }
    
    [self removeObjectForKey:aKey];
}
#pragma mark ======  obj:Char set  ======
- (void)imxSetChar:(char)value forKey:(id<NSCopying>)key
{
    [self imxSetObject:[NSNumber numberWithChar:value] forKey:key];
}
- (void)imxSetUnsignedChar:(unsigned char)value forKey:(id<NSCopying>)key
{
    [self imxSetObject:[NSNumber numberWithUnsignedChar:value] forKey:key];
}
#pragma mark ======  obj:Int set  ======
- (void)imxSetShort:(short)value forKey:(id<NSCopying>)key
{
    [self imxSetObject:[NSNumber numberWithShort:value] forKey:key];
}
- (void)imxSetUnsignedShort:(unsigned short)value forKey:(id<NSCopying>)key
{
    [self imxSetObject:[NSNumber numberWithUnsignedShort:value] forKey:key];
}
- (void)imxSetInt:(int)value forKey:(id<NSCopying>)key
{
    [self imxSetObject:[NSNumber numberWithInt:value] forKey:key];
}
- (void)imxSetUnsignedInt:(unsigned int)value forKey:(id<NSCopying>)key
{
    [self imxSetObject:[NSNumber numberWithUnsignedInt:value] forKey:key];
}
- (void)imxSetLong:(long)value forKey:(id<NSCopying>)key
{
    [self imxSetObject:[NSNumber numberWithLong:value] forKey:key];
}
- (void)imxsetUnsignedLong:(unsigned long)value forKey:(id<NSCopying>)key
{
    [self imxSetObject:[NSNumber numberWithUnsignedLong:value] forKey:key];
}
- (void)imxSetLongLong:(long long)value forKey:(id<NSCopying>)key
{
    [self imxSetObject:[NSNumber numberWithLongLong:value] forKey:key];
}
- (void)imxSetUnsignedLongLong:(unsigned long long)value forKey:(id<NSCopying>)key
{
    [self imxSetObject:[NSNumber numberWithUnsignedLongLong:value] forKey:key];
}
#pragma mark ======  obj:Float&Double set  ======
- (void)imxSetFloat:(float)value forKey:(id<NSCopying>)key
{
    [self imxSetObject:[NSNumber numberWithFloat:value] forKey:key];
}
- (void)imxSetDouble:(double)value forKey:(id<NSCopying>)key
{
    [self imxSetObject:[NSNumber numberWithDouble:value] forKey:key];
}
#pragma mark ======  obj:BOOL set  ======
- (void)imxSetBool:(BOOL)value forKey:(id<NSCopying>)key
{
    [self imxSetObject:[NSNumber numberWithBool:value] forKey:key];
}
#pragma mark ======  obj:Integer set  ======
- (void)imxsetInteger:(NSInteger)value forKey:(id<NSCopying>)key
{
    [self imxSetObject:[NSNumber numberWithInteger:value] forKey:key];
}
- (void)imxSetUnsignedInteger:(NSUInteger)value forKey:(id<NSCopying>)key
{
    [self imxSetObject:[NSNumber numberWithUnsignedInteger:value] forKey:key];
}
#pragma mark ======  obj:CG set  ======
- (void)imxSetPointValue:(CGPoint)value forKey:(id<NSCopying>)key
{
    [self imxSetObject:[NSValue valueWithCGPoint:value] forKey:key];
}
- (void)imxSetSizeValue:(CGSize)value forKey:(id<NSCopying>)key
{
    [self imxSetObject:[NSValue valueWithCGSize:value] forKey:key];
}
- (void)imxSetRectValue:(CGRect)value forKey:(id<NSCopying>)key
{
    [self imxSetObject:[NSValue valueWithCGRect:value] forKey:key];
}
@end

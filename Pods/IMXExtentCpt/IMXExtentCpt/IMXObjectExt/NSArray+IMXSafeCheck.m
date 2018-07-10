//
//  NSArray+IMXSafeCheck.m
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/1.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import "NSArray+IMXSafeCheck.h"
#import "NSString+IMXSafeCheck.h"

@implementation NSArray (IMXSafeCheck)
#pragma mark ======  object check  ======
- (id)imxRandomObject
{
    if ([self count] == 0) {
        return nil;
    }
    return self[arc4random() % [self count]];
}
- (BOOL)imxIsEmpty
{
    return ([self count] == 0);
}

- (id)imxObjectAtIndex:(NSUInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    
    id value = [self objectAtIndex:index];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}

#pragma mark ======  object:Class check  ======
- (id)imxObjectAtIndex:(NSUInteger)index class:(Class)aClass
{
    return [self imxObjectAtIndex:index class:aClass defaultValue:nil];
}

- (id)imxObjectAtIndex:(NSUInteger)index class:(Class)aClass defaultValue:(id)defaultValue
{
    id value = [self imxObjectAtIndex:index];
    if (![value isKindOfClass:aClass]) {
        return defaultValue;
    }
    return value;
}
#pragma mark ======  object:Array check  ======
- (NSArray *)imxArrayAtIndex:(NSUInteger)index
{
    return [self imxArrayAtIndex:index defaultValue:nil];
}

- (NSArray *)imxArrayAtIndex:(NSUInteger)index defaultValue:(NSArray *)defaultValue
{
    return [self imxObjectAtIndex:index class:[NSArray class] defaultValue:defaultValue];
}

#pragma mark ======  object:Dic check  ======
- (NSDictionary *)imxDictionaryAtIndex:(NSUInteger)index
{
    return [self imxDictionaryAtIndex:index defaultValue:nil];
}

- (NSDictionary *)imxDictionaryAtIndex:(NSUInteger)index defaultValue:(NSDictionary *)defaultValue
{
    return [self imxObjectAtIndex:index class:[NSDictionary class] defaultValue:defaultValue];
}
#pragma mark ======  object:Data check  ======
- (NSData *)imxdataAtIndex:(NSUInteger)index
{
    return [self imxDataAtIndex:index defaultValue:nil];
}

- (NSData *)imxDataAtIndex:(NSUInteger)index defaultValue:(NSData *)defaultValue
{
    return [self imxObjectAtIndex:index class:[NSData class] defaultValue:defaultValue];
}
#pragma mark ======  object:String check  ======
- (NSString *)imxStringAtIndex:(NSUInteger)index
{
    return [self imxStringAtIndex:index defaultValue:nil];
}

- (NSString *)imxStringAtIndex:(NSUInteger)index defaultValue:(NSString *)defaultValue
{
    id value = [self imxObjectAtIndex:index];
    
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value stringValue];
    }
    
    if (![value isKindOfClass:[NSString class]]) {
        return defaultValue;
    }
    return value;
}
#pragma mark ======  object:Number check  ======
- (NSNumber *)imxNumberAtIndex:(NSUInteger)index
{
    return [self imxNumberAtIndex:index defaultValue:nil];
}

- (NSNumber *)imxNumberAtIndex:(NSUInteger)index defaultValue:(NSNumber *)defaultValue
{
    id value = [self imxObjectAtIndex:index];
    if ([value isKindOfClass:[NSString class]]) {
        return [value imxNumberValue];
    }
    
    if (![value isKindOfClass:[NSNumber class]]) {
        return defaultValue;
    }
    
    return value;
}
#pragma mark ======  object:Char&UChar check  ======
- (char)imxCharAtIndex:(NSUInteger)index
{
    id value = [self imxObjectAtIndex:index];
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

- (unsigned char)imxUnsignedCharAtIndex:(NSUInteger)index
{
    id value = [self imxObjectAtIndex:index];
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
#pragma mark ======  object:Int check  ======
- (short)imxShortAtIndex:(NSUInteger)index
{
    return [self imxShortAtIndex:index defaultValue:0];
}

- (short)imxShortAtIndex:(NSUInteger)index defaultValue:(short)defaultValue
{
    id value = [self imxObjectAtIndex:index];
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
- (unsigned short)imxUnsignedShortAtIndex:(NSUInteger)index
{
    return [self imxUnsignedShortAtIndex:index defaultValue:0];
}
- (unsigned short)imxUnsignedShortAtIndex:(NSUInteger)index defaultValue:(unsigned short)defaultValue
{
    id value = [self imxObjectAtIndex:index];
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
- (int)imxIntAtIndex:(NSUInteger)index
{
    return [self imxIntAtIndex:index defaultValue:0];
}

- (int)imxIntAtIndex:(NSUInteger)index defaultValue:(int)defaultValue
{
    id value = [self imxObjectAtIndex:index];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value intValue];
    }
    else {
        return defaultValue;
    }
}
- (unsigned int)imxUnsignedIntAtIndex:(NSUInteger)index
{
    return [self imxUnsignedIntAtIndex:index defaultValue:0];
}

- (unsigned int)imxUnsignedIntAtIndex:(NSUInteger)index defaultValue:(unsigned int)defaultValue
{
    id value = [self imxObjectAtIndex:index];
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
- (long)imxLongAtIndex:(NSUInteger)index
{
    return [self imxLongAtIndex:index defaultValue:0];
}
- (long)imxLongAtIndex:(NSUInteger)index defaultValue:(long)defaultValue
{
    id value = [self imxObjectAtIndex:index];
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
- (unsigned long)imxUnsignedLongAtIndex:(NSUInteger)index
{
    return [self imxUnsignedLongAtIndex:index defaultValue:0];
}
- (unsigned long)imxUnsignedLongAtIndex:(NSUInteger)index defaultValue:(unsigned long)defaultValue
{
    id value = [self imxObjectAtIndex:index];
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
- (long long)imxLongLongAtIndex:(NSUInteger)index
{
    return [self imxLongLongAtIndex:index defaultValue:0];
}
- (long long)imxLongLongAtIndex:(NSUInteger)index defaultValue:(long long)defaultValue
{
    id value = [self imxObjectAtIndex:index];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value longLongValue];
    }
    else {
        return defaultValue;
    }
}
- (unsigned long long)imxUnsignedLongLongAtIndex:(NSUInteger)index
{
    return [self imxUnsignedLongLongAtIndex:index defaultValue:0];
}
- (unsigned long long)imxUnsignedLongLongAtIndex:(NSUInteger)index defaultValue:(unsigned long long)defaultValue
{
    id value = [self imxObjectAtIndex:index];
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
#pragma mark ======  object:Float&Double check  ======
- (float)imxFloatAtIndex:(NSUInteger)index
{
    return [self imxFloatAtIndex:index defaultValue:0.0];
}
- (float)imxFloatAtIndex:(NSUInteger)index defaultValue:(float)defaultValue
{
    id value = [self imxObjectAtIndex:index];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        float result = [value floatValue];
        return isnan(result) ? defaultValue : result;
    }
    else {
        return defaultValue;
    }
}
- (double)imxDoubleAtIndex:(NSUInteger)index
{
    return [self imxDoubleAtIndex:index defaultValue:0.0];
}
- (double)imxDoubleAtIndex:(NSUInteger)index defaultValue:(double)defaultValue
{
    id value = [self imxObjectAtIndex:index];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        double result = [value doubleValue];
        return isnan(result) ? defaultValue : result;
    }
    else {
        return defaultValue;
    }
}
#pragma mark ======  object:BOOL check  ======
- (BOOL)imxBoolAtIndex:(NSUInteger)index
{
    return [self imxBoolAtIndex:index defaultValue:NO];
}
- (BOOL)imxBoolAtIndex:(NSUInteger)index defaultValue:(BOOL)defaultValue
{
    id value = [self imxObjectAtIndex:index];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value boolValue];
    }
    else {
        return defaultValue;
    }
}
#pragma mark ======  object:NSInteger check  ======
- (NSInteger)imxIntegerAtIndex:(NSUInteger)index
{
    return [self imxIntegerAtIndex:index defaultValue:0];
}
- (NSInteger)imxIntegerAtIndex:(NSUInteger)index defaultValue:(NSInteger)defaultValue
{
    id value = [self imxObjectAtIndex:index];
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value integerValue];
    }
    else {
        return defaultValue;
    }
}
- (NSUInteger)imxUnsignedIntegerAtIndex:(NSUInteger)index
{
    return [self imxUnsignedIntegerAtIndex:index defaultValue:0];
}
- (NSUInteger)imxUnsignedIntegerAtIndex:(NSUInteger)index defaultValue:(NSUInteger)defaultValue
{
    id value = [self imxObjectAtIndex:index];
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
#pragma mark ======  object:CG check  ======
- (CGPoint)imxPointAtIndex:(NSUInteger)index
{
    return [self imxPointAtIndex:index defaultValue:CGPointZero];
}
- (CGPoint)imxPointAtIndex:(NSUInteger)index defaultValue:(CGPoint)defaultValue
{
    id value = [self imxObjectAtIndex:index];
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
- (CGSize)imxSizeAtIndex:(NSUInteger)index
{
    return [self imxSizeAtIndex:index defaultValue:CGSizeZero];
}
- (CGSize)imxSizeAtIndex:(NSUInteger)index defaultValue:(CGSize)defaultValue
{
    id value = [self imxObjectAtIndex:index];
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
- (CGRect)imxRectAtIndex:(NSUInteger)index
{
    return [self imxRectAtIndex:index defaultValue:CGRectZero];
}
- (CGRect)imxRectAtIndex:(NSUInteger)index defaultValue:(CGRect)defaultValue
{
    id value = [self imxObjectAtIndex:index];
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

@implementation NSMutableArray (IMXSafeCheck)
#pragma mark ======  object Add check  ======
- (void)imxAddObjects:(id)objects, ...
{
    if (objects == nil)
        return;
    
    [self imxAddObject:objects];
    
    id next;
    va_list list;
    
    va_start(list, objects);
    while ((next = va_arg(list, id)) != nil)
    {
        [self imxAddObject:next];
    }
    va_end(list);
}
- (void)imxAddObject:(id)anObject
{
    if (anObject == nil) {
        return;
    }
    [self addObject:anObject];
}
#pragma mark ======  object:Char Add check  ======
- (void)imxaddChar:(char)value
{
    [self imxAddObject:[NSNumber numberWithChar:value]];
}
- (void)imxAddUnsignedChar:(unsigned char)value
{
    [self imxAddObject:[NSNumber numberWithUnsignedChar:value]];
}
#pragma mark ======  object:Int Add check  ======
- (void)imxAddShort:(short)value
{
    [self imxAddObject:[NSNumber numberWithShort:value]];
}
- (void)imxAddUnsignedShort:(unsigned short)value
{
    [self imxAddObject:[NSNumber numberWithUnsignedShort:value]];
}
- (void)imxAddInt:(int)value
{
    [self imxAddObject:[NSNumber numberWithInt:value]];
}
- (void)imxAddUnsignedInt:(unsigned int)value
{
    [self imxAddObject:[NSNumber numberWithUnsignedInt:value]];
}
- (void)imxAddLong:(long)value
{
    [self imxAddObject:[NSNumber numberWithLong:value]];
}
- (void)imxAddUnsignedLong:(unsigned long)value
{
    [self imxAddObject:[NSNumber numberWithUnsignedLong:value]];
}
- (void)imxAddLongLong:(long long)value
{
    [self imxAddObject:[NSNumber numberWithLongLong:value]];
}
- (void)imxAddUnsignedLongLong:(unsigned long long)value
{
    [self imxAddObject:[NSNumber numberWithUnsignedLongLong:value]];
}
#pragma mark ======  object:Float&Double Add check  ======
- (void)imxAddFloat:(float)value
{
    [self imxAddObject:[NSNumber numberWithFloat:value]];
}
- (void)imxAddDouble:(double)value
{
    [self imxAddObject:[NSNumber numberWithDouble:value]];
}
#pragma mark ======  object:BOOL Add check  ======
- (void)imxAddBool:(BOOL)value
{
    [self imxAddObject:[NSNumber numberWithBool:value]];
}
#pragma mark ======  object:NSInteger Add check  ======
- (void)imxAddInteger:(NSInteger)value
{
    [self imxAddObject:[NSNumber numberWithInteger:value]];
}
- (void)imxAddUnsignedInteger:(NSUInteger)value
{
    [self imxAddObject:[NSNumber numberWithUnsignedInteger:value]];
}
#pragma mark ======  object:CG Add check  ======
- (void)imxAddPointValue:(CGPoint)value
{
    [self imxAddObject:[NSValue valueWithCGPoint:value]];
}
- (void)imxAddSizeValue:(CGSize)value
{
    [self imxAddObject:[NSValue valueWithCGSize:value]];
}
- (void)imxAddRectValue:(CGRect)value
{
    [self imxAddObject:[NSValue valueWithCGRect:value]];
}
#pragma mark ======  object Insert check  ======
- (void)imxInsertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject == nil) {
        return;
    }
    if (index > [self count]) {
        return;
    }
    [self insertObject:anObject atIndex:index];
}
#pragma mark ======  object:Char Insert check  ======
- (void)imxInsertChar:(char)value atIndex:(NSUInteger)index
{
    [self imxInsertObject:[NSNumber numberWithChar:value] atIndex:index];
}
- (void)imxInsertUnsignedChar:(unsigned char)value atIndex:(NSUInteger)index
{
    [self imxInsertObject:[NSNumber numberWithUnsignedChar:value] atIndex:index];
}
#pragma mark ======  object:Int Insert check  ======
- (void)imxInsertShort:(short)value atIndex:(NSUInteger)index
{
    [self imxInsertObject:[NSNumber numberWithShort:value] atIndex:index];
}
- (void)imxInsertUnsignedShort:(unsigned short)value atIndex:(NSUInteger)index
{
    [self imxInsertObject:[NSNumber numberWithUnsignedShort:value] atIndex:index];
}
- (void)imxInsertInt:(int)value atIndex:(NSUInteger)index
{
    [self imxInsertObject:[NSNumber numberWithInt:value] atIndex:index];
}
- (void)imxInsertUnsignedInt:(unsigned int)value atIndex:(NSUInteger)index
{
    [self imxInsertObject:[NSNumber numberWithUnsignedInt:value] atIndex:index];
}
- (void)imxInsertLong:(long)value atIndex:(NSUInteger)index
{
    [self imxInsertObject:[NSNumber numberWithLong:value] atIndex:index];
}
- (void)imxInsertUnsignedLong:(unsigned long)value atIndex:(NSUInteger)index
{
    [self imxInsertObject:[NSNumber numberWithUnsignedLong:value] atIndex:index];
}
- (void)imxInsertLongLong:(long long)value atIndex:(NSUInteger)index
{
    [self imxInsertObject:[NSNumber numberWithLongLong:value] atIndex:index];
}
- (void)imxInsertUnsignedLongLong:(unsigned long long)value atIndex:(NSUInteger)index
{
    [self imxInsertObject:[NSNumber numberWithUnsignedLongLong:value] atIndex:index];
}
#pragma mark ======  object:Float&Double Insert check  ======
- (void)imxInsertFloat:(float)value atIndex:(NSUInteger)index
{
    [self imxInsertObject:[NSNumber numberWithFloat:value] atIndex:index];
}
- (void)imxInsertDouble:(double)value atIndex:(NSUInteger)index
{
    [self imxInsertObject:[NSNumber numberWithDouble:value] atIndex:index];
}
#pragma mark ======  object:BOOL Insert check  ======
- (void)imxInsertBool:(BOOL)value atIndex:(NSUInteger)index
{
    [self imxInsertObject:[NSNumber numberWithBool:value] atIndex:index];
}
#pragma mark ======  object:NSInteger Insert check  ======
- (void)imxInsertInteger:(NSInteger)value atIndex:(NSUInteger)index
{
    [self imxInsertObject:[NSNumber numberWithInteger:value] atIndex:index];
}
- (void)imxInsertUnsignedInteger:(NSUInteger)value atIndex:(NSUInteger)index
{
    [self imxInsertObject:[NSNumber numberWithUnsignedInteger:value] atIndex:index];
}
#pragma mark ======  object:CG Insert check  ======
- (void)imxInsertPointValue:(CGPoint)value atIndex:(NSUInteger)index
{
    [self imxInsertObject:[NSValue valueWithCGPoint:value] atIndex:index];
}
- (void)imxInsertSizeValue:(CGSize)value atIndex:(NSUInteger)index
{
    [self imxInsertObject:[NSValue valueWithCGSize:value] atIndex:index];
}
- (void)imxInsertRectValue:(CGRect)value atIndex:(NSUInteger)index
{
    [self imxInsertObject:[NSValue valueWithCGRect:value] atIndex:index];
}
#pragma mark ======  object Replace check  ======
- (void)imxReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (anObject == nil) {
        return;
    }
    
    if (index >= [self count]) {
        return;
    }
    
    [self replaceObjectAtIndex:index withObject:anObject];
}
#pragma mark ======  object:Char Replace check  ======
- (void)imxReplaceCharAtIndex:(NSUInteger)index withChar:(char)value
{
    [self imxReplaceObjectAtIndex:index withObject:[NSNumber numberWithChar:value]];
}
- (void)imxReplaceUnsignedCharAtIndex:(NSUInteger)index withUnsignedChar:(unsigned char)value
{
    [self imxReplaceObjectAtIndex:index withObject:[NSNumber numberWithUnsignedChar:value]];
}
#pragma mark ======  object:Int Replace check  ======
- (void)imxReplaceShortAtIndex:(NSUInteger)index withShort:(short)value
{
    [self imxReplaceObjectAtIndex:index withObject:[NSNumber numberWithShort:value]];
}
- (void)imxReplaceUnsignedShortAtIndex:(NSUInteger)index withUnsignedShort:(unsigned short)value
{
    [self imxReplaceObjectAtIndex:index withObject:[NSNumber numberWithUnsignedShort:value]];
}
- (void)imxReplaceIntAtIndex:(NSUInteger)index withInt:(int)value
{
    [self imxReplaceObjectAtIndex:index withObject:[NSNumber numberWithInt:value]];
}
- (void)imxReplaceUnsignedIntAtIndex:(NSUInteger)index withUnsignedInt:(unsigned int)value
{
    [self imxReplaceObjectAtIndex:index withObject:[NSNumber numberWithUnsignedInt:value]];
}
- (void)imxReplaceLongAtIndex:(NSUInteger)index withLong:(long)value
{
    [self imxReplaceObjectAtIndex:index withObject:[NSNumber numberWithLong:value]];
}
- (void)imxReplaceUnsignedLongAtIndex:(NSUInteger)index withUnsignedLong:(unsigned long)value
{
    [self imxReplaceObjectAtIndex:index withObject:[NSNumber numberWithUnsignedLong:value]];
}
- (void)imxReplaceLongLongAtIndex:(NSUInteger)index withLongLong:(long long)value
{
    [self imxReplaceObjectAtIndex:index withObject:[NSNumber numberWithLongLong:value]];
}
- (void)imxReplaceUnsignedLongLongAtIndex:(NSUInteger)index withUnsignedLongLong:(unsigned long long)value
{
    [self imxReplaceObjectAtIndex:index withObject:[NSNumber numberWithUnsignedLongLong:value]];
}
#pragma mark ======  object:Float&Double Replace check  ======
- (void)imxReplaceFloatAtIndex:(NSUInteger)index withFloat:(float)value
{
    [self imxReplaceObjectAtIndex:index withObject:[NSNumber numberWithFloat:value]];
}
- (void)imxReplaceDoubleAtIndex:(NSUInteger)index withDouble:(double)value
{
    [self imxReplaceObjectAtIndex:index withObject:[NSNumber numberWithDouble:value]];
}
#pragma mark ======  object:BOOL Replace check  ======
- (void)imxReplaceBoolAtIndex:(NSUInteger)index withBool:(BOOL)value
{
    [self imxReplaceObjectAtIndex:index withObject:[NSNumber numberWithBool:value]];
}
#pragma mark ======  object:NSInteger Replace check  ======
- (void)imxReplaceIntegerAtIndex:(NSUInteger)index withInteger:(NSInteger)value
{
    [self imxReplaceObjectAtIndex:index withObject:[NSNumber numberWithInteger:value]];
}
- (void)imxReplaceUnsignedIntegerAtIndex:(NSUInteger)index withUnsignedInteger:(NSUInteger)value
{
    [self imxReplaceObjectAtIndex:index withObject:[NSNumber numberWithUnsignedInteger:value]];
}
#pragma mark ======  object:CG Replace check  ======
- (void)imxReplacePointValueAtIndex:(NSUInteger)index withPointValue:(CGPoint)value
{
    [self imxReplaceObjectAtIndex:index withObject:[NSValue valueWithCGPoint:value]];
}

- (void)imxReplaceSizeValueAtIndex:(NSUInteger)index withSizeValue:(CGSize)value
{
    [self imxReplaceObjectAtIndex:index withObject:[NSValue valueWithCGSize:value]];
}

- (void)imxReplaceRectValueAtIndex:(NSUInteger)index withRectValue:(CGRect)value
{
    [self imxReplaceObjectAtIndex:index withObject:[NSValue valueWithCGRect:value]];
}
@end

//
//  NSArray+IMXSafeCheck.h
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/1.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSArray (IMXSafeCheck)
#pragma mark ======  object check  ======
- (id)imxRandomObject;
- (BOOL)imxIsEmpty;
- (id)imxObjectAtIndex:(NSUInteger)index;
#pragma mark ======  object:Class check  ======
- (id)imxObjectAtIndex:(NSUInteger)index class:(Class)aClass;
- (id)imxObjectAtIndex:(NSUInteger)index class:(Class)aClass defaultValue:(id)defaultValue;
#pragma mark ======  object:Array check  ======
- (NSArray *)imxArrayAtIndex:(NSUInteger)index;
- (NSArray *)imxArrayAtIndex:(NSUInteger)index defaultValue:(NSArray *)defaultValue;
#pragma mark ======  object:Dic check  ======
- (NSDictionary *)imxDictionaryAtIndex:(NSUInteger)index;
- (NSDictionary *)imxDictionaryAtIndex:(NSUInteger)index defaultValue:(NSDictionary *)defaultValue;
#pragma mark ======  object:Data check  ======
- (NSData *)imxdataAtIndex:(NSUInteger)index;
- (NSData *)imxDataAtIndex:(NSUInteger)index defaultValue:(NSData *)defaultValue;
#pragma mark ======  object:String check  ======
- (NSString *)imxStringAtIndex:(NSUInteger)index;
- (NSString *)imxStringAtIndex:(NSUInteger)index defaultValue:(NSString *)defaultValue;
#pragma mark ======  object:Number check  ======
- (NSNumber *)imxNumberAtIndex:(NSUInteger)index;
- (NSNumber *)imxNumberAtIndex:(NSUInteger)index defaultValue:(NSNumber *)defaultValue;
#pragma mark ======  object:Char&UChar check  ======
- (char)imxCharAtIndex:(NSUInteger)index;
- (unsigned char)imxUnsignedCharAtIndex:(NSUInteger)index;
#pragma mark ======  object:Int check  ======
- (short)imxShortAtIndex:(NSUInteger)index;
- (short)imxShortAtIndex:(NSUInteger)index defaultValue:(short)defaultValue;
- (unsigned short)imxUnsignedShortAtIndex:(NSUInteger)index;
- (unsigned short)imxUnsignedShortAtIndex:(NSUInteger)index defaultValue:(unsigned short)defaultValue;
- (int)imxIntAtIndex:(NSUInteger)index;
- (int)imxIntAtIndex:(NSUInteger)index defaultValue:(int)defaultValue;
- (unsigned int)imxUnsignedIntAtIndex:(NSUInteger)index;
- (unsigned int)imxUnsignedIntAtIndex:(NSUInteger)index defaultValue:(unsigned int)defaultValue;
- (long)imxLongAtIndex:(NSUInteger)index;
- (long)imxLongAtIndex:(NSUInteger)index defaultValue:(long)defaultValue;
- (unsigned long)imxUnsignedLongAtIndex:(NSUInteger)index;
- (unsigned long)imxUnsignedLongAtIndex:(NSUInteger)index defaultValue:(unsigned long)defaultValue;
- (long long)imxLongLongAtIndex:(NSUInteger)index;
- (long long)imxLongLongAtIndex:(NSUInteger)index defaultValue:(long long)defaultValue;
- (unsigned long long)imxUnsignedLongLongAtIndex:(NSUInteger)index;
- (unsigned long long)imxUnsignedLongLongAtIndex:(NSUInteger)index defaultValue:(unsigned long long)defaultValue;
#pragma mark ======  object:Float&Double check  ======
- (float)imxFloatAtIndex:(NSUInteger)index;
- (float)imxFloatAtIndex:(NSUInteger)index defaultValue:(float)defaultValue;
- (double)imxDoubleAtIndex:(NSUInteger)index;
- (double)imxDoubleAtIndex:(NSUInteger)index defaultValue:(double)defaultValue;
#pragma mark ======  object:BOOL check  ======
- (BOOL)imxBoolAtIndex:(NSUInteger)index;
- (BOOL)imxBoolAtIndex:(NSUInteger)index defaultValue:(BOOL)defaultValue;
#pragma mark ======  object:NSInteger check  ======
- (NSInteger)imxIntegerAtIndex:(NSUInteger)index;
- (NSInteger)imxIntegerAtIndex:(NSUInteger)index defaultValue:(NSInteger)defaultValue;
- (NSUInteger)imxUnsignedIntegerAtIndex:(NSUInteger)index;
- (NSUInteger)imxUnsignedIntegerAtIndex:(NSUInteger)index defaultValue:(NSUInteger)defaultValue;
#pragma mark ======  object:CG check  ======
- (CGPoint)imxPointAtIndex:(NSUInteger)index;
- (CGPoint)imxPointAtIndex:(NSUInteger)index defaultValue:(CGPoint)defaultValue;
- (CGSize)imxSizeAtIndex:(NSUInteger)index;
- (CGSize)imxSizeAtIndex:(NSUInteger)index defaultValue:(CGSize)defaultValue;
- (CGRect)imxRectAtIndex:(NSUInteger)index;
- (CGRect)imxRectAtIndex:(NSUInteger)index defaultValue:(CGRect)defaultValue;
@end

@interface NSMutableArray (IMXSafeCheck)

#pragma mark ======  object Add check  ======
- (void)imxAddObjects:(id)objects, ...;
- (void)imxAddObject:(id)anObject;
#pragma mark ======  object:Char Add check  ======
- (void)imxaddChar:(char)value;
- (void)imxAddUnsignedChar:(unsigned char)value;
#pragma mark ======  object:Int Add check  ======
- (void)imxAddShort:(short)value;
- (void)imxAddUnsignedShort:(unsigned short)value;
- (void)imxAddInt:(int)value;
- (void)imxAddUnsignedInt:(unsigned int)value;
- (void)imxAddLong:(long)value;
- (void)imxAddUnsignedLong:(unsigned long)value;
- (void)imxAddLongLong:(long long)value;
- (void)imxAddUnsignedLongLong:(unsigned long long)value;
#pragma mark ======  object:Float&Double Add check  ======
- (void)imxAddFloat:(float)value;
- (void)imxAddDouble:(double)value;
#pragma mark ======  object:BOOL Add check  ======
- (void)imxAddBool:(BOOL)value;
#pragma mark ======  object:NSInteger Add check  ======
- (void)imxAddInteger:(NSInteger)value;
- (void)imxAddUnsignedInteger:(NSUInteger)value;
#pragma mark ======  object:CG Add check  ======
- (void)imxAddPointValue:(CGPoint)value;
- (void)imxAddSizeValue:(CGSize)value;
- (void)imxAddRectValue:(CGRect)value;
#pragma mark ======  object Insert check  ======
- (void)imxInsertObject:(id)anObject atIndex:(NSUInteger)index;
#pragma mark ======  object:Char Insert check  ======
- (void)imxInsertChar:(char)value atIndex:(NSUInteger)index;
- (void)imxInsertUnsignedChar:(unsigned char)value atIndex:(NSUInteger)index;
#pragma mark ======  object:Int Insert check  ======
- (void)imxInsertShort:(short)value atIndex:(NSUInteger)index;
- (void)imxInsertUnsignedShort:(unsigned short)value atIndex:(NSUInteger)index;
- (void)imxInsertInt:(int)value atIndex:(NSUInteger)index;
- (void)imxInsertUnsignedInt:(unsigned int)value atIndex:(NSUInteger)index;
- (void)imxInsertLong:(long)value atIndex:(NSUInteger)index;
- (void)imxInsertUnsignedLong:(unsigned long)value atIndex:(NSUInteger)index;
- (void)imxInsertLongLong:(long long)value atIndex:(NSUInteger)index;
- (void)imxInsertUnsignedLongLong:(unsigned long long)value atIndex:(NSUInteger)index;
#pragma mark ======  object:Float&Double Insert check  ======
- (void)imxInsertFloat:(float)value atIndex:(NSUInteger)index;
- (void)imxInsertDouble:(double)value atIndex:(NSUInteger)index;
#pragma mark ======  object:BOOL Insert check  ======
- (void)imxInsertBool:(BOOL)value atIndex:(NSUInteger)index;
#pragma mark ======  object:NSInteger Insert check  ======
- (void)imxInsertInteger:(NSInteger)value atIndex:(NSUInteger)index;
- (void)imxInsertUnsignedInteger:(NSUInteger)value atIndex:(NSUInteger)index;
#pragma mark ======  object:CG Insert check  ======
- (void)imxInsertPointValue:(CGPoint)value atIndex:(NSUInteger)index;
- (void)imxInsertSizeValue:(CGSize)value atIndex:(NSUInteger)index;
- (void)imxInsertRectValue:(CGRect)value atIndex:(NSUInteger)index;
#pragma mark ======  object Replace check  ======
- (void)imxReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
#pragma mark ======  object:Char Replace check  ======
- (void)imxReplaceCharAtIndex:(NSUInteger)index withChar:(char)value;
- (void)imxReplaceUnsignedCharAtIndex:(NSUInteger)index withUnsignedChar:(unsigned char)value;
#pragma mark ======  object:Int Replace check  ======
- (void)imxReplaceShortAtIndex:(NSUInteger)index withShort:(short)value;
- (void)imxReplaceUnsignedShortAtIndex:(NSUInteger)index withUnsignedShort:(unsigned short)value;
- (void)imxReplaceIntAtIndex:(NSUInteger)index withInt:(int)value;
- (void)imxReplaceUnsignedIntAtIndex:(NSUInteger)index withUnsignedInt:(unsigned int)value;
- (void)imxReplaceLongAtIndex:(NSUInteger)index withLong:(long)value;
- (void)imxReplaceUnsignedLongAtIndex:(NSUInteger)index withUnsignedLong:(unsigned long)value;
- (void)imxReplaceLongLongAtIndex:(NSUInteger)index withLongLong:(long long)value;
- (void)imxReplaceUnsignedLongLongAtIndex:(NSUInteger)index withUnsignedLongLong:(unsigned long long)value;
#pragma mark ======  object:Float&Double Replace check  ======
- (void)imxReplaceFloatAtIndex:(NSUInteger)index withFloat:(float)value;
- (void)imxReplaceDoubleAtIndex:(NSUInteger)index withDouble:(double)value;
#pragma mark ======  object:BOOL Replace check  ======
- (void)imxReplaceBoolAtIndex:(NSUInteger)index withBool:(BOOL)value;
#pragma mark ======  object:NSInteger Replace check  ======
- (void)imxReplaceIntegerAtIndex:(NSUInteger)index withInteger:(NSInteger)value;
- (void)imxReplaceUnsignedIntegerAtIndex:(NSUInteger)index withUnsignedInteger:(NSUInteger)value;
#pragma mark ======  object:CG Replace check  ======
- (void)imxReplacePointValueAtIndex:(NSUInteger)index withPointValue:(CGPoint)value;
- (void)imxReplaceSizeValueAtIndex:(NSUInteger)index withSizeValue:(CGSize)value;
- (void)imxReplaceRectValueAtIndex:(NSUInteger)index withRectValue:(CGRect)value;

@end

//
//  NSDate+Extension.h
//  IMXBaseCpt
//
//  Created by guyouwen on 2017/12/13.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)
/**
 *  是否为今天
 */
- (BOOL)isToday;
/**
 *  是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否为今年
 */
- (BOOL)isThisYear;
/**
 *  返回一个只有年月日的时间
 */
- (NSDate *)dateWithYMD;
/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *)deltaWithNow;
@end

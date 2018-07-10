//
//  IMXObjectExtUtil.h
//  IMXBaseModules
//
//  Created by zhoupanpan on 2017/8/8.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#ifndef IMXObjectExtUtil_h
#define IMXObjectExtUtil_h

#define IMX_INCASE_EMPTY_OBJ_EXT(str, replace) \
(([(str)length] == 0) ? (replace) : (str))

#define IMX_INCASE_EMPTYSTRING_OBJ_EXT(str) \
(([(str)length] == 0) ? (@"") : (str))

#import "NSString+IMXFormatCheck.h"
#import "NSString+IMXSafeCheck.h"
#import "NSArray+IMXSafeCheck.h"
#import "NSDictionary+IMXSafeCheck.h"
#import "EXTScope.h"
#import "metamacros.h"
#import "NSAttributedString+IMXHighlightKit.h"
#import "NSObject+IMXExtFork.h"
#import "NSDate+Extension.h"
#endif /* IMXObjectExtUtil_h */

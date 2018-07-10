//
//  IMXEntryAPPDelegate.m
//  IMXLauncher
//
//  Created by zhoupanpan on 2017/11/7.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import "IMXEntryAPPDelegate.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "IMXAPPServiceManager.h"
@implementation IMXEntryAPPDelegate
- (void)dealloc{
}
#pragma mark ======  public  ======
+ (IMXEntryAPPDelegate *)sharedInstance
{
    static IMXEntryAPPDelegate *instance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[IMXEntryAPPDelegate alloc] init];
    });
    return instance;
}
#pragma mark ======  life cycle  ======
- (BOOL)respondsToSelector:(SEL)aSelector {
    BOOL canResponse = [self methodForSelector:aSelector] != nil && [self methodForSelector:aSelector] != _objc_msgForward;
    if (!canResponse && [[self systemAPPDelegateMethods] containsObject:NSStringFromSelector(aSelector)]) {
        canResponse = [[IMXAPPServiceManager sharedInstance] proxyCanResponseToSelector:aSelector];
    }
    return canResponse;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [[IMXAPPServiceManager sharedInstance] proxyForwardInvocation:anInvocation];
}
#pragma mark ======  delegate  ======

#pragma mark ======  event  ======

#pragma mark ======  private  ======
- (NSArray<NSString *> *)systemAPPDelegateMethods {
    static NSMutableArray *methods = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        unsigned int methodCount = 0;
        struct objc_method_description *methodList = protocol_copyMethodDescriptionList(@protocol(UIApplicationDelegate), NO, YES, &methodCount);
        methods = [NSMutableArray arrayWithCapacity:methodCount];
        for (int i = 0; i < methodCount; i ++) {
            struct objc_method_description md = methodList[i];
            [methods addObject:NSStringFromSelector(md.name)];
        }
        free(methodList);
    });
    return methods;
}
#pragma mark ======  getter & setter  ======


@end

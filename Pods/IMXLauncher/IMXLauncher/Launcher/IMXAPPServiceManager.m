//
//  IMXAPPServiceManage.m
//  IMXLauncher
//
//  Created by zhoupanpan on 2017/11/7.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import "IMXAPPServiceManager.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface IMXAPPServiceManager()
@property (nonatomic,strong)NSMutableDictionary<NSString*, id<IMXAPPService>> *lowsQueue;
@property (nonatomic,strong)NSMutableDictionary<NSString*, id<IMXAPPService>> *defaultsQueue;
@property (nonatomic,strong)NSMutableDictionary<NSString*, id<IMXAPPService>> *highsQueue;
@property (strong, nonatomic) NSOperationQueue *asyncOperationQueue;//当前未使用
@end

@implementation IMXAPPServiceManager
- (void)dealloc{
}
#pragma mark ======  public  ======
+ (IMXAPPServiceManager *)sharedInstance
{
    static IMXAPPServiceManager *instance=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[IMXAPPServiceManager alloc] init];
    });
    return instance;
}
- (void)registerService:(id<IMXAPPService>)service{
    if(!service){
        return;
    }
    NSString *key = [service appServiceName];
    id<IMXAPPService> exitService = [self exitServiceForServiceName:key];
    if(exitService){
        if([service isKindOfClass:[exitService class]]){
            [self removeService:exitService];
            [self addService2Queue:service];
        }else{
            NSAssert([exitService isKindOfClass:[service class]],
                     @"Tried to register both %@ and %@ as the handler of %@ service. \
                     Cannot determine the right class to use because neither inherits from the other.",
                     [exitService class], [service class], [service appServiceName]);
        }
    }else{
        [self addService2Queue:service];
    }
}
- (id<IMXAPPService>)serviceForName:(NSString *)serviceName{
    if(!serviceName) { return nil; }

    id<IMXAPPService> exitService = [self exitServiceForServiceName:serviceName];
    return exitService;
}

- (BOOL)proxyCanResponseToSelector:(SEL)aSelector{
    __block IMP imp = NULL;
    NSDictionary *allServicesMap = [self servicesFromQueues];
    [allServicesMap enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id<IMXAPPService> _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj respondsToSelector:aSelector]) {
            imp = [(id)obj methodForSelector:aSelector];
            NSMethodSignature *signature = [(id)obj methodSignatureForSelector:aSelector];
            if (signature.methodReturnLength > 0 && strcmp(signature.methodReturnType, @encode(BOOL)) != 0) {
                imp = NULL;
            }
            *stop = YES;
        }
    }];
    return imp != NULL && imp != _objc_msgForward;
}
- (void)proxyForwardInvocation:(NSInvocation *)anInvocation{
    [self proxyForwardInvocation:anInvocation forQueue:self.highsQueue];
    [self proxyForwardInvocation:anInvocation forQueue:self.defaultsQueue];
    [self proxyForwardInvocation:anInvocation forQueue:self.lowsQueue];
}
#pragma mark ======  life cycle  ======
- (instancetype)init{
    self = [super init];
    if (self) {
    }
    return self;
}
#pragma mark ======  delegate  ======

#pragma mark ======  event  ======

#pragma mark ======  private  ======
- (NSString *)objcTypesFromSignature:(NSMethodSignature *)signature {
    NSMutableString *types = [NSMutableString stringWithFormat:@"%s", signature.methodReturnType?:"v"];
    for (NSUInteger i = 0; i < signature.numberOfArguments; i ++) {
        [types appendFormat:@"%s", [signature getArgumentTypeAtIndex:i]];
    }
    return [types copy];
}
/**
 按照优先次序整合三个队列中的service
 
 @return 全部service集合
 */
- (NSDictionary *)servicesFromQueues{
    NSMutableDictionary *servicesMap = [[NSMutableDictionary alloc] init];
    [servicesMap addEntriesFromDictionary:self.highsQueue];
    [servicesMap addEntriesFromDictionary:self.defaultsQueue];
    [servicesMap addEntriesFromDictionary:self.lowsQueue];
    return servicesMap;
}

/**
 queue中services批量执行method

 @param anInvocation 方法
 @param queue 队列
 */
- (void)proxyForwardInvocation:(NSInvocation *)anInvocation forQueue:(NSDictionary *)queue{
    NSMethodSignature *signature = anInvocation.methodSignature;
    NSUInteger argCount = signature.numberOfArguments;
    __block BOOL returnValue = NO;
    NSUInteger returnLength = signature.methodReturnLength;
    void * returnValueBytes = NULL;
    if (returnLength > 0) {
        returnValueBytes = alloca(returnLength);
    }
    [queue enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id<IMXAPPService> _Nonnull obj, BOOL * _Nonnull stop) {
        if ( ! [obj respondsToSelector:anInvocation.selector]) {
            return;
        }
        // check the signature
        NSAssert([[self objcTypesFromSignature:signature] isEqualToString:[self objcTypesFromSignature:[(id)obj methodSignatureForSelector:anInvocation.selector]]],
                 @"Method signature for selector (%@) on (%@ - `%@`) is invalid. \
                 Please check the return value type and arguments type.",
                 NSStringFromSelector(anInvocation.selector), obj.appServiceName, obj);
        
        // copy the invokation
        NSInvocation *invok = [NSInvocation invocationWithMethodSignature:signature];
        invok.selector = anInvocation.selector;
        // copy arguments
        for (NSUInteger i = 0; i < argCount; i ++) {
            const char * argType = [signature getArgumentTypeAtIndex:i];
            NSUInteger argSize = 0;
            NSGetSizeAndAlignment(argType, &argSize, NULL);
            
            void * argValue = alloca(argSize);
            [anInvocation getArgument:&argValue atIndex:i];
            [invok setArgument:&argValue atIndex:i];
        }
        // reset the target
        invok.target = obj;
        // invoke
        [invok invoke];
        
        // get the return value
        if (returnValueBytes) {
            [invok getReturnValue:returnValueBytes];
            returnValue = returnValue || *((BOOL *)returnValueBytes);
        }
    }];
    // set return value
    if (returnValueBytes) {
        [anInvocation setReturnValue:returnValueBytes];
    }
}
/**
 返回特定service的权限
 默认权限：IMXAppServicePriorityDefault

 @param service 服务
 @return 级别
 */
- (IMXAppServicePriority)priorityForService:(id<IMXAPPService>)service{
    if(![service respondsToSelector:@selector(appServicePriority)]){
        return IMXAppServicePriorityDefault;
    }
    return [service appServicePriority];
}

/**
 获取service对应的模式
 默认是IMXAppServiceModeSync：同步

 @param service 服务
 @return 模式
 */
- (IMXAppServiceMode)modeForService:(id<IMXAPPService>)service{
    if(![service respondsToSelector:@selector(appServiceMode)]){
        return IMXAppServiceModeSync;
    }
    return [service appServiceMode];
}
/**
 添加service对象到合适的queue中
 
 @param service 将添加的对象
 */
- (void)addService2Queue:(id<IMXAPPService>)service{
    IMXAppServicePriority pri = [self priorityForService:service];
    NSMutableDictionary *queue = [self serviceQueueForPriority:pri];
    NSString *key = [service appServiceName];
    queue[key] = service;
}

/**
 查找三个队列，删除特定service
 
 @param service 将删除的service
 */
- (void)removeService:(id<IMXAPPService>)service{
    NSString *key = [service appServiceName];
    if(!key){
        return;
    }
    [self.defaultsQueue removeObjectForKey:key];
    [self.lowsQueue removeObjectForKey:key];
    [self.highsQueue removeObjectForKey:key];
}
/**
 根据serviceName判断是否存在同名service
 
 @param serviceName 传入的serviceName
 @return 同名同权限级别的service
 */
- (id<IMXAPPService>)exitServiceForServiceName:(NSString *)serviceName{
    id<IMXAPPService> exitService = self.defaultsQueue[serviceName];
    if(exitService){
        return exitService;
    }
    exitService = self.lowsQueue[serviceName];
    if(exitService){
        return exitService;
    }
    exitService = self.highsQueue[serviceName];
    if(exitService){
        return exitService;
    }
    return nil;
}

/**
 获取特定权限级别的Queue

 @param pri 权限等级
 @return 返回当前三种队列之一
 */
- (NSMutableDictionary *)serviceQueueForPriority:(IMXAppServicePriority)pri{
    switch (pri) {
        case IMXAppServicePriorityDefault:
        {
            return self.defaultsQueue;
        }
            break;
        case IMXAppServicePriorityLow:
        {
            return self.lowsQueue;
        }
            break;
        case IMXAppServicePriorityHigh:
        {
            return self.highsQueue;
        }
            break;
        default:
            return self.defaultsQueue;
            break;
    }
}
#pragma mark ======  getter & setter  ======

- (NSMutableDictionary<NSString*, id<IMXAPPService>> *)lowsQueue{
    if(!_lowsQueue){
        _lowsQueue = [[NSMutableDictionary alloc] init];
    }
    return _lowsQueue;
}
- (NSMutableDictionary<NSString*, id<IMXAPPService>> *)defaultsQueue{
    if(!_defaultsQueue){
        _defaultsQueue = [[NSMutableDictionary alloc] init];
    }
    return _defaultsQueue;
}
- (NSMutableDictionary<NSString*, id<IMXAPPService>> *)highsQueue{
    if(!_highsQueue){
        _highsQueue = [[NSMutableDictionary alloc] init];
    }
    return _highsQueue;
}
- (NSOperationQueue *)asyncOperationQueue{
    if(!_asyncOperationQueue){
        _asyncOperationQueue = [[NSOperationQueue alloc] init];
        _asyncOperationQueue.maxConcurrentOperationCount = 1;
    }
    return _asyncOperationQueue;
}
@end

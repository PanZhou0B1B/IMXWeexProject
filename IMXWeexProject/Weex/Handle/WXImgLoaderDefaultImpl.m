/**
 * Created by Weex.
 * Copyright (c) 2016, Alibaba, Inc. All rights reserved.
 *
 * This source code is licensed under the Apache Licence 2.0.
 * For the full copyright and license information,please view the LICENSE file in the root directory of this source tree.
 */

#import "WXImgLoaderDefaultImpl.h"
#import <AFNetworking/AFImageDownloader.h>

#define MIN_IMAGE_WIDTH 36
#define MIN_IMAGE_HEIGHT 36

#if OS_OBJECT_USE_OBJC
#undef  WXDispatchQueueRelease
#undef  WXDispatchQueueSetterSementics
#define WXDispatchQueueRelease(q)
#define WXDispatchQueueSetterSementics strong
#else
#undef  WXDispatchQueueRelease
#undef  WXDispatchQueueSetterSementics
#define WXDispatchQueueRelease(q) (dispatch_release(q))
#define WXDispatchQueueSetterSementics assign
#endif

@interface WXImgLoaderDefaultImpl()

@property (WXDispatchQueueSetterSementics, nonatomic) dispatch_queue_t ioQueue;

@end

@implementation WXImgLoaderDefaultImpl

#pragma mark -
#pragma mark WXImgLoaderProtocol

- (id<WXImageOperationProtocol>)downloadImageWithURL:(NSString *)url imageFrame:(CGRect)imageFrame userInfo:(NSDictionary *)userInfo completed:(void(^)(UIImage *image,  NSError *error, BOOL finished))completedBlock
{
    if ([url hasPrefix:@"//"]) {
        url = [@"http:" stringByAppendingString:url];
    }
    NSURL *URL = [NSURL URLWithString:url];
    return (id<WXImageOperationProtocol>)[[AFImageDownloader defaultInstance] downloadImageForURLRequest:[NSURLRequest requestWithURL:URL] success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull responseObject) {
        if (completedBlock) {
            completedBlock(responseObject, nil, YES);
        }
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        if (completedBlock) {
            completedBlock(nil,error , YES);
        }
    }];
    
}

@end

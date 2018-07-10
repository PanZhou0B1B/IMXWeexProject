//
//  IMXWeexBaseViewController.h
//  IMXWeexProject
//
//  Created by zhoupanpan on 2018/6/13.
//  Copyright © 2018年 zhoupanpan. All rights reserved.
//

#import "IMXWBaseViewController.h"
typedef NS_ENUM(NSInteger, IMXWeexRenderStatus) {
    IMXWeexRenderStatusCreated,
    IMXWeexRenderStatusFailed,
    IMXWeexRenderStatusFinished,
};
@interface IMXWeexBaseViewController : IMXWBaseViewController
@property (nonatomic, copy) void(^weexRenderBlock)(IMXWeexRenderStatus status,NSError *error);

- (void)weexConfig:(CGRect)frame superView:(UIView *)sView;
- (void)weexLoadUrl:(NSURL *)url;
@end

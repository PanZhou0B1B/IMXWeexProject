//
//  IMXWeexBaseViewController.h
//  IMXWeexProject
//
//  Created by zhoupanpan on 2018/6/13.
//  Copyright © 2018年 zhoupanpan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WeexSDK/WeexSDK.h>

typedef NS_ENUM(NSInteger, IMXWeexRenderStatus) {
    IMXWeexRenderStatusCreated,
    IMXWeexRenderStatusFailed,
    IMXWeexRenderStatusFinished,
    IMXWeexRenderStatusrenderFinish
};
@interface IMXWeexBaseViewController : UIViewController
@property (nonatomic,strong)WXSDKInstance *weexInstance;
@property (nonatomic, copy) void(^weexRenderBlock)(IMXWeexRenderStatus status,NSError *error);

- (void)weexConfig:(CGRect)frame superView:(UIView *)sView;
- (void)weexLoadUrl:(NSURL *)url;
- (void)weexLoadUrl:(NSURL *)url data:(id)data;
- (void)weexForceReload;
- (void)weexRefreshData:(id)data;
@end

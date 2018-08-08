//
//  IMXScanUtil.m
//  IMXScanDemo
//
//  Created by zhoupanpan on 2018/8/1.
//  Copyright © 2018年 zhoupanpan. All rights reserved.
//

#import "IMXScanUtil.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>

@implementation IMXScanUtil

#pragma mark - Public
+ (void)cameraStatusCheck:(void(^)(void))handler{
    if (![self isCameraAvailable]){
        [self showTips:@"设备无相机"];
        return;
    }
    if (![self isRearCameraAvailable] && ![self isFrontCameraAvailable]) {
        [self showTips:@"设备相机错误"];
        return;
    }
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(status == AVAuthorizationStatusDenied || status == AVAuthorizationStatusRestricted){
        [self showAuthTips:@"需要相机/相册的权限"];
    }else if (status == AVAuthorizationStatusAuthorized){
        if(handler){
            handler();
        }
    }else{
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if(granted){
                if(handler){
                    handler();
                }
            }else{
                [self showAuthTips:@"需要相机/相册的权限"];
            }
        }];
    }
}
+ (void)libraryStatusCheck:(void(^)(void))handler{
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if(status == PHAuthorizationStatusDenied || status == PHAuthorizationStatusRestricted){
        [self showAuthTips:@"需要相册的权限"];
    }else if (status == PHAuthorizationStatusAuthorized){
        if(handler){
            handler();
        }
    }else{
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if(status == PHAuthorizationStatusAuthorized){
                if(handler){
                    handler();
                }
            }else{
                [self showAuthTips:@"需要相册的权限"];
            }
        }];
    }
}

#pragma mark - Private
+ (BOOL)isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}
+ (BOOL)isFrontCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}
+ (BOOL)isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}
///UI
+ (void)showAuthTips:(NSString *)msg{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        UIViewController *ctrl = [self imx_CurrentViewCtrl];
        [ctrl.navigationController popViewControllerAnimated:YES];
    }];
    UIAlertAction *requestAction = [UIAlertAction actionWithTitle:@"同意" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication]canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        }
    }];
    [alert addAction:cancelAction];
    [alert addAction:requestAction];
    UIViewController *ctrl = [self imx_CurrentViewCtrl];
    [ctrl presentViewController:alert animated:YES completion:nil];
}
+ (void)showTips:(NSString *)message{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        UIViewController *ctrl = [self imx_CurrentViewCtrl];
        [ctrl.navigationController popViewControllerAnimated:YES];
    }];
    [alert addAction:cancelAction];
    UIViewController *ctrl = [self imx_CurrentViewCtrl];
    [ctrl presentViewController:alert animated:YES completion:nil];
}
+ (UIViewController *)imx_CurrentViewCtrl{
    UIWindow * window = [self imx_window];
    
    UIViewController *rootViewController = window.rootViewController;
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    return currentVC;
}

+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    if ([rootVC presentedViewController]) {
        rootVC = [rootVC presentedViewController];
    }
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
        
    } else {
        currentVC = rootVC;
    }
    return currentVC;
}
+ (UIWindow *)imx_window{
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    return window;
}

@end

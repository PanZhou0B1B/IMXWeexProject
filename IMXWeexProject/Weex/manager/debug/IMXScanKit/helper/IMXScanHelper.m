//
//  IMXScanHelper.m
//  IMXScanDemo
//
//  Created by zhoupanpan on 2018/8/1.
//  Copyright © 2018年 zhoupanpan. All rights reserved.
//

#import "IMXScanHelper.h"
#import "IMXScanUtil.h"
#import "IMXScanViewController.h"

@interface IMXScanHelper ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic ,strong) UIImagePickerController *imagePicker;

@property (nonatomic, weak) UIViewController *baseCtrl;
@property (nonatomic, copy) void(^libResult)(NSString *info);
@end

@implementation IMXScanHelper
- (void)dealloc{
}
#pragma mark - Public
- (void)showDefaultScanFrom:(UIViewController *)ctrl result:(void(^)(NSString *info))result{
    self.baseCtrl = ctrl;
    __weak __typeof(self)weakSelf = self;
    [IMXScanUtil cameraStatusCheck:^{
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        IMXScanViewController *scanCtrl = [[IMXScanViewController alloc] init];
        scanCtrl.result = result;
        [strongSelf.baseCtrl.navigationController pushViewController:scanCtrl animated:YES];
    }];
}
- (void)showLibraryFrom:(UIViewController *)ctrl result:(void(^)(NSString *info))result{
    self.baseCtrl = ctrl;
    self.libResult = result;
    __weak __typeof(self)weakSelf = self;
    [IMXScanUtil libraryStatusCheck:^{
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf.baseCtrl presentViewController:strongSelf.imagePicker animated:YES completion:nil];
    }];
}
#pragma mark - Life Cycle

#pragma mark - Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(nonnull NSDictionary<NSString *,id> *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    NSString *result = [self messageFromQRCodeImage:image];
    if(self.libResult){
        self.libResult(result);
    }
}
#pragma mark - Event

#pragma mark - Private
- (NSString *)messageFromQRCodeImage:(UIImage *)image{
    if (!image) {
        return nil;
    }
    CIContext *context = [CIContext contextWithOptions:nil];
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:context options:@{CIDetectorAccuracy:CIDetectorAccuracyHigh}];
    CIImage *ciImage = [CIImage imageWithCGImage:image.CGImage];
    NSArray *features = [detector featuresInImage:ciImage];
    if (features.count == 0) {
        return nil;
    }
    CIQRCodeFeature *feature = features.firstObject;
    return feature.messageString;
}
#pragma mark - Getter & Setter
- (UIImagePickerController *)imagePicker{
    if (!_imagePicker) {
        _imagePicker = [[UIImagePickerController alloc]init];
        _imagePicker.delegate = self;
        _imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    return _imagePicker;
}

@end

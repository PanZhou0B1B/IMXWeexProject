//
//  IMXScanBuilder.m
//  IMXScanDemo
//
//  Created by zhoupanpan on 2018/8/1.
//  Copyright © 2018年 zhoupanpan. All rights reserved.
//

#import "IMXScanBuilder.h"
#import <AVFoundation/AVFoundation.h>
#import "IMXScanUtil.h"
@interface IMXScanBuilder ()<AVCaptureMetadataOutputObjectsDelegate>
@property (nonatomic,strong)AVCaptureSession *session;
@property (nonatomic,strong)AVCaptureInput *deviceInput;
@property (nonatomic,strong)AVCaptureMetadataOutput *dataOutput;

@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic, weak) UIView *baseView;
@end

@implementation IMXScanBuilder
- (void)dealloc{
}
#pragma mark - Public
- (void)scanSettings:(UIView *)baseView{
    self.baseView = baseView;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if(self.session){;}
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.baseView.layer insertSublayer:self.previewLayer atIndex:0];
            [self.session startRunning];
            self.dataOutput.rectOfInterest = [self.previewLayer metadataOutputRectOfInterestForRect:[self scanRectOfInterest]];
        });
    });
}
- (void)startScanning{
    if(self.session.isRunning){
        return;
    }
    [self.session startRunning];
}
- (void)stopScanning{
    if(!self.session.isRunning){
        return;
    }
    [self.session stopRunning];
}
#pragma mark - Life Cycle

#pragma mark - Delegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray<AVMetadataMachineReadableCodeObject *> *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects.count == 0) {
        return;
    }
    [self.session stopRunning];
    NSString *result = [metadataObjects.firstObject stringValue];
    if(self.scanResult){
        self.scanResult(result);
    }
}

#pragma mark - Event

#pragma mark - Private
- (CGRect)scanRectOfInterest{
    CGRect scanRect = CGRectZero;
    if([self.delegate respondsToSelector:@selector(scanFocusRect)]){
        scanRect = [self.delegate scanFocusRect];
        return scanRect;
    }
    scanRect = CGRectMake(scanRect.origin.y/IMX_SCAN_SCREEN_HEIGHT, scanRect.origin.x/IMX_SCAN_SCREEN_WIDTH, scanRect.size.height/IMX_SCAN_SCREEN_HEIGHT,scanRect.size.width/IMX_SCAN_SCREEN_WIDTH);
    return scanRect;
}
#pragma mark - Getter & Setter
- (AVCaptureSession *)session{
    if(!_session){
        _session = [[AVCaptureSession alloc]init];
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ([device supportsAVCaptureSessionPreset:AVCaptureSessionPreset1920x1080]) {
            [_session setSessionPreset:AVCaptureSessionPreset1920x1080];
        }
        else{
            [_session setSessionPreset:AVCaptureSessionPresetHigh];
        }
        if ([_session canAddInput:self.deviceInput]) {
            [_session addInput:self.deviceInput];
        }
        
        if ([_session canAddOutput:self.dataOutput]){
            [_session addOutput:self.dataOutput];
            self.dataOutput.metadataObjectTypes = @[AVMetadataObjectTypeQRCode];
        }
    }
    return _session;
}
- (AVCaptureInput *)deviceInput{
    if(!_deviceInput){
        NSError *error;
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        _deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    }
    return _deviceInput;
}
- (AVCaptureMetadataOutput *)dataOutput{
    if(!_dataOutput){
        _dataOutput = [[AVCaptureMetadataOutput alloc]init];
        [_dataOutput setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    }
    return _dataOutput;
}
- (AVCaptureVideoPreviewLayer *)previewLayer{
    if (!_previewLayer) {
        _previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
        _previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        _previewLayer.frame = [UIScreen mainScreen].bounds;
    }
    return _previewLayer;
}

@end

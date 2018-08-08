//
//  IMXScanViewController.m
//  IMXScanDemo
//
//  Created by zhoupanpan on 2018/8/1.
//  Copyright © 2018年 zhoupanpan. All rights reserved.
//

#import "IMXScanViewController.h"
#import "IMXScanUtil.h"
#import "IMXScanBuilder.h"

@interface IMXScanViewController ()<IMXScanBuilderDelegate>
@property (nonatomic,strong)IMXScanBuilder *scanBuilder;

@property (nonatomic,strong)UIView *scanFocusView;
@property (nonatomic,strong)UIView *scanMaskView;
@property (nonatomic,strong)UIView *scanLineView;
@end

@implementation IMXScanViewController

- (void)dealloc{
}
#pragma mark - Public

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"SCAN";
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    [self UIConfigs];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.scanBuilder startScanning];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.scanBuilder stopScanning];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Delegate
- (CGRect)scanFocusRect{
    CGSize scanSize = CGSizeMake(self.view.frame.size.width * 3/4, self.view.frame.size.width * 3/4);
    CGRect scanRect = CGRectMake((self.view.frame.size.width - scanSize.width)/2, (self.view.frame.size.height - scanSize.height)/2, scanSize.width, scanSize.height);
    return scanRect;
}

#pragma mark - Event
- (void)backAction:(UIBarButtonItem *)item{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - Private
- (void)UIConfigs{
    [self.view addSubview:self.scanFocusView];
    [self.scanFocusView addSubview:self.scanLineView];
    [self.view addSubview:self.scanMaskView];
    [self.scanBuilder scanSettings:self.view];
    __weak __typeof(self)weakSelf = self;
    self.scanBuilder.scanResult = ^(NSString *info) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        if(strongSelf.result){
            strongSelf.result(info);
        }
    };
}
- (void)startScanning{
    [IMXScanUtil cameraStatusCheck:^{
        [self.scanBuilder startScanning];
    }];
}
- (void)stopScanning{
    [self.scanBuilder stopScanning];
}
#pragma mark - Getter & Setter
- (IMXScanBuilder *)scanBuilder{
    if(!_scanBuilder){
        _scanBuilder = [[IMXScanBuilder alloc] init];
        _scanBuilder.delegate = self;
    }
    return _scanBuilder;
}
- (UIView *)scanFocusView{
    if (!_scanFocusView) {
        _scanFocusView = [[UIView alloc]initWithFrame:[self scanFocusRect]];
        _scanFocusView.clipsToBounds = YES;
    }
    return _scanFocusView;
}
- (UIView *)scanLineView{
    if (!_scanLineView) {
        _scanLineView = [[UIView alloc]initWithFrame:CGRectMake(0,0,[self scanFocusRect].size.width, 40)];
        _scanLineView.hidden = YES;
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.startPoint = CGPointMake(0.5, 0);
        gradient.endPoint = CGPointMake(0.5, 1);
        gradient.frame = _scanLineView.layer.bounds;
        gradient.colors = @[(__bridge id)[[UIColor greenColor] colorWithAlphaComponent:0].CGColor,(__bridge id)[[UIColor greenColor] colorWithAlphaComponent:0.4f].CGColor,(__bridge id)[UIColor greenColor].CGColor];
        gradient.locations = @[@0,@0.96,@0.97];
        [_scanLineView.layer addSublayer:gradient];
    }
    return _scanLineView;
}
- (UIView *)scanMaskView{
    if (!_scanMaskView) {
        _scanMaskView = [[UIView alloc]initWithFrame:self.view.bounds];
        _scanMaskView.backgroundColor = [UIColor blackColor];
        _scanMaskView.alpha = 0.8;
        UIBezierPath *bpath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, IMX_SCAN_SCREEN_WIDTH, IMX_SCAN_SCREEN_HEIGHT) ];
        [bpath appendPath:[[UIBezierPath bezierPathWithRect:[self scanFocusRect]] bezierPathByReversingPath]];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = bpath.CGPath;
        _scanMaskView.layer.mask = shapeLayer;
    }
    return _scanMaskView;
}


@end

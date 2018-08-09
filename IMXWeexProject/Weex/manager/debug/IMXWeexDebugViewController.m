//
//  IMXWeexDebugViewController.m
//  DHgate
//
//  Created by zhoupanpan on 2018/8/1.
//  Copyright © 2018年 dhgate. All rights reserved.
//

#import "IMXWeexDebugViewController.h"
#import <WeexSDK/WeexSDK.h>
#import <IMXExtentCpt/IMXUIKitExtUtil.h>
#import <IMXSafeAreaKit/IMXSafeAreaKit.h>

@interface IMXWeexDebugViewController ()
@property (nonatomic,strong)WXSDKInstance *weexInstance;
@property (nonatomic,strong)UIView *weexRootView;
@end

@implementation IMXWeexDebugViewController

- (void)dealloc{
    [_weexInstance destroyInstance];
}
#pragma mark - Public

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"DEBUG PAGE";
    CGFloat top = [UIApplication sharedApplication].statusBarFrame.size.height + 44;
    CGFloat bottom = [self imx_safeBottomFromCache];
    CGRect frame = CGRectMake(0, 0, IMX_SCREEN_WIDTH_UIKIT, IMX_SCREEN_HEIGHT_UIKIT-top-bottom);
    [self weexConfig:frame superView:self.view];
    
    if(self.loadURL){
        [self weexLoadUrl:_loadURL data:nil];
    }
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self refreshWeexInstanceState:WeexInstanceAppear];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self refreshWeexInstanceState:WeexInstanceDisappear];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Delegate

#pragma mark - Event

#pragma mark - Private
- (void)weexConfig:(CGRect)frame superView:(UIView *)sView{
    [_weexInstance destroyInstance];
    self.weexInstance.frame = frame;
    
    __weak __typeof(self)weakSelf = self;
    self.weexInstance.onCreate = ^(UIView *view) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf.weexRootView removeFromSuperview];
        strongSelf.weexRootView = view;
        [sView addSubview:strongSelf.weexRootView];
    };
    self.weexInstance.onFailed = ^(NSError *error) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf weexRenderInfoShow:error.localizedDescription];
    };
    self.weexInstance.renderFinish = ^(UIView *view) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf refreshWeexInstanceState:WeexInstanceAppear];
    };
    self.weexInstance.onJSRuntimeException = ^(WXJSExceptionInfo *jsException) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf weexRenderInfoShow:jsException.exception];
    };
    self.weexInstance.onRenderProgress = ^(CGRect renderRect) {
    };
}
- (void)weexLoadUrl:(NSURL *)url data:(id)data{
    if(!url) { return; }
    
    [self.weexInstance renderWithURL:url options:nil data:data];
}
- (void)weexForceReload{
    [self.weexInstance reload:YES];
}
- (void)weexRefreshData:(id)data{
    [self.weexInstance refreshInstance:data];
}
- (void)refreshWeexInstanceState:(WXState)state
{
    if (self.weexInstance.state != state) {
        self.weexInstance.state = state;
        if (state == WeexInstanceAppear) {
            [[WXSDKManager bridgeMgr] fireEvent:self.weexInstance.instanceId ref:WX_SDK_ROOT_REF type:@"viewappear" params:nil domChanges:nil];
        }
        else if (state == WeexInstanceDisappear) {
            [[WXSDKManager bridgeMgr] fireEvent:self.weexInstance.instanceId ref:WX_SDK_ROOT_REF type:@"viewdisappear" params:nil domChanges:nil];
        }
    }
}
- (void)weexRenderInfoShow:(NSString *)tips{
#ifdef DEBUG
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"weex info" message:tips preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
#endif
}
#pragma mark - Getter & Setter
- (WXSDKInstance *)weexInstance{
    if(!_weexInstance){
        _weexInstance = [[WXSDKInstance alloc] init];
        _weexInstance.viewController = self;
    }
    return _weexInstance;
}
- (void)setLoadURL:(NSURL *)loadURL{
    _loadURL = loadURL;
}
@end

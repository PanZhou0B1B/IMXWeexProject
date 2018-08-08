
//
//  IMXWeexBaseViewController.m
//  IMXWeexProject
//
//  Created by zhoupanpan on 2018/6/13.
//  Copyright © 2018年 zhoupanpan. All rights reserved.
//

#import "IMXWeexBaseViewController.h"

@interface IMXWeexBaseViewController ()
@property (nonatomic,strong)UIView *weexRootView;

@property (nonatomic,assign)CGRect weexRect;
@property (nonatomic,weak)UIView *sView;
@end

@implementation IMXWeexBaseViewController

- (void)dealloc{
    [_weexInstance destroyInstance];
    [self removeObservers];
}
#pragma mark - Public
- (void)weexConfig:(CGRect)frame superView:(UIView *)sView{
    self.weexRect = frame;
    self.sView = sView;
}

- (void)weexLoadUrl:(NSURL *)url{
    [self weexLoadUrl:url data:nil];
}
- (void)weexLoadUrl:(NSURL *)url data:(id)data{
    if(!url) { return; }
    [self reloadWeexInstance];
    self.weexInstance.pageName = url.absoluteString;
    
    [self.weexInstance renderWithURL:url options:nil data:data];
}
- (void)weexForceReload{
    [self.weexInstance reload:YES];
}
- (void)weexRefreshData:(id)data{
    [self.weexInstance refreshInstance:data];
}
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.weexRect = self.view.bounds;
    self.sView = self.view;
    
    [self addObservers];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self refreshWeexInstanceState:WeexInstanceAppear];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self refreshWeexInstanceState:WeexInstanceDisappear];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self refreshWeexInstanceState:WeexInstanceMemoryWarning];
}
#pragma mark - Delegate

#pragma mark - Event

#pragma mark - Private
- (void)reloadWeexInstance{
    [self.weexInstance destroyInstance];
    
    self.weexInstance = [[WXSDKInstance alloc] init];
    self.weexInstance.frame = self.weexRect;
    self.weexInstance.pageObject = self;
    self.weexInstance.viewController = self;
    
    __weak __typeof(self)weakSelf = self;
    self.weexInstance.onCreate = ^(UIView *view) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf.weexRootView removeFromSuperview];
        strongSelf.weexRootView = view;
        [strongSelf.sView addSubview:strongSelf.weexRootView];
        if(strongSelf.weexRenderBlock){
            strongSelf.weexRenderBlock(IMXWeexRenderStatusCreated, nil);
        }
    };
    self.weexInstance.onFailed = ^(NSError *error) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf weexRenderInfoShow:error.localizedDescription];
    };
    self.weexInstance.renderFinish = ^(UIView *view) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf refreshWeexInstanceState:WeexInstanceAppear];
        if(strongSelf.weexRenderBlock){
            strongSelf.weexRenderBlock(IMXWeexRenderStatusrenderFinish, nil);
        }
    };
    self.weexInstance.onJSRuntimeException = ^(WXJSExceptionInfo *jsException) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf weexRenderInfoShow:jsException.exception];
    };
    self.weexInstance.onRenderProgress = ^(CGRect renderRect) {
    };
}
- (void)refreshWeexInstanceState:(WXState)state{
    if (self.weexInstance && self.weexInstance.state != state) {
        self.weexInstance.state = state;
        if (state == WeexInstanceAppear) {
            [[WXSDKManager bridgeMgr] fireEvent:self.weexInstance.instanceId ref:WX_SDK_ROOT_REF type:@"viewappear" params:nil domChanges:nil];
        }
        else if (state == WeexInstanceDisappear) {
            [[WXSDKManager bridgeMgr] fireEvent:self.weexInstance.instanceId ref:WX_SDK_ROOT_REF type:@"viewdisappear" params:nil domChanges:nil];
        }
    }
}
- (void)addObservers{
    for (NSString *name in @[UIApplicationDidBecomeActiveNotification,
                             UIApplicationDidEnterBackgroundNotification]) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(appStateDidChange:)
                                                     name:name
                                                   object:nil];
    }
}
- (void)removeObservers{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)appStateDidChange:(NSNotification *)notify{
    if ([notify.name isEqualToString:UIApplicationDidBecomeActiveNotification]) {
        [self refreshWeexInstanceState:WeexInstanceForeground];
    } else if([notify.name isEqualToString:UIApplicationDidEnterBackgroundNotification]) {
        [self refreshWeexInstanceState:WeexInstanceBackground]; ;
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

@end

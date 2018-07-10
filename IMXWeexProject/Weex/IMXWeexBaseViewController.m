
//
//  IMXWeexBaseViewController.m
//  IMXWeexProject
//
//  Created by zhoupanpan on 2018/6/13.
//  Copyright © 2018年 zhoupanpan. All rights reserved.
//

#import "IMXWeexBaseViewController.h"
#import <WeexSDK/WeexSDK.h>

@interface IMXWeexBaseViewController ()
@property (nonatomic,strong)WXSDKInstance *weexInstance;
@property (nonatomic,strong)UIView *weexRootView;
@end

@implementation IMXWeexBaseViewController

- (void)dealloc{
    [_weexInstance destroyInstance];
}
#pragma mark ======  public  ======
- (void)weexConfig:(CGRect)frame superView:(UIView *)sView{
    self.weexInstance.frame = frame;
    
    __weak __typeof(self)weakSelf = self;
    self.weexInstance.onCreate = ^(UIView *view) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        [strongSelf.weexRootView removeFromSuperview];
        strongSelf.weexRootView = view;
        [sView addSubview:strongSelf.weexRootView];
        if(strongSelf.weexRenderBlock){
            strongSelf.weexRenderBlock(IMXWeexRenderStatusCreated, nil);
        }
    };
    self.weexInstance.onFailed = ^(NSError *error) {
        NSLog(@"yes");
    };
    self.weexInstance.renderFinish = ^(UIView *view) {
        NSLog(@"yes");
    };
    self.weexInstance.onJSRuntimeException = ^(WXJSExceptionInfo *jsException) {
         NSLog(@"yes");
    };
    self.weexInstance.onRenderProgress = ^(CGRect renderRect) {
         NSLog(@"yes");
    };
}
- (void)weexLoadUrl:(NSURL *)url{
    if(!url) { return; }
    
    [self.weexInstance renderWithURL:url];
}
#pragma mark ======  life cycle  ======
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark ======  delegate  ======

#pragma mark ======  event  ======

#pragma mark ======  private  ======

#pragma mark ======  getter & setter  ======
- (WXSDKInstance *)weexInstance{
    if(!_weexInstance){
        _weexInstance = [[WXSDKInstance alloc] init];
        _weexInstance.viewController = self;
    }
    return _weexInstance;
}


@end

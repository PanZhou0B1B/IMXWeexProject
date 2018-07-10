//
//  IMXWRootViewController.m
//  IMXWeexProject
//
//  Created by zhoupanpan on 2018/6/13.
//  Copyright © 2018年 zhoupanpan. All rights reserved.
//

#import "IMXWRootViewController.h"

@interface IMXWRootViewController ()

@end

@implementation IMXWRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"root ctrl";
    [self weexConfig:self.view.bounds superView:self.view];
    
    
    [self performSelector:@selector(loadURL) withObject:nil afterDelay:5];
}
- (void)loadURL{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"js"];
    [self weexLoadUrl:url];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

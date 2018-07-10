//
//  MTXBaseInteractor.h
//  MVIP
//
//  Created by zhoupanpan on 2017/7/20.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTXInteractorProtocol.h"
@interface MTXBaseInteractor : NSObject<MTXInteractorProtocol>
@property (nonatomic,weak)id mtx_view;//具体的View,不可通过该类改动
@end

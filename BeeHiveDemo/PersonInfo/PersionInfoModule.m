//
//  PersionInfoModule.m
//  BeeHiveDemo
//
//  Created by oriochan on 2017/3/9.
//  Copyright © 2017年 oriochan. All rights reserved.
//

#import "PersionInfoModule.h"
#import "JCService.h"
#import "PersionInfoViewController.h"

// 注册
BeeHiveMod(PersionInfoModule) 

@interface PersionInfoModule () <BHModuleProtocol>

@end

@implementation PersionInfoModule

- (void)modSetUp:(BHContext *)context {
    NSLog(@"%s", __FUNCTION__);
    // 注册PersionInfoServiceProtocol
    [[BeeHive shareInstance] registerService:@protocol(PersionInfoServiceProtocol) service:[PersionInfoViewController class]];
}

- (void)modDidEnterBackground:(BHContext *)context {
    
    NSLog(@"%s", __FUNCTION__);
    
    id <PersionInfoServiceProtocol>persionVc = [[BeeHive shareInstance] createService:@protocol(PersionInfoServiceProtocol)];
    
    if ([persionVc isKindOfClass:[UIViewController class]]) {
        UIViewController *Vc = (UIViewController *)persionVc;
        [Vc.view setBackgroundColor:[UIColor redColor]];
    }
}

- (void)modWillEnterForeground:(BHContext *)context {
    
    NSLog(@"%s", __FUNCTION__);
    
    id <PersionInfoServiceProtocol>persionVc = [[BeeHive shareInstance] createService:@protocol(PersionInfoServiceProtocol)];
    
    if ([persionVc isKindOfClass:[UIViewController class]]) {
        UIViewController *Vc = (UIViewController *)persionVc;
        
        sleep(2);
        
        [Vc.view setBackgroundColor:[UIColor darkGrayColor]];
    }
}

@end

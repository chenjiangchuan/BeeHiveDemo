//
//  JCTabBarModule.m
//  BeeHiveDemo
//
//  Created by oriochan on 2017/3/9.
//  Copyright © 2017年 oriochan. All rights reserved.
//

#import "JCTabBarModule.h"
#import "JCService.h"

/**
 *  Module三种注册方式
 *  1、静态注册，在delegate中：[BHContext shareInstance].moduleConfigName = @"BeeHive.bundle/BeeHive";
 *  2、动态注册，在load类方法中进行注册
 *  3、Annotation注册
 */

// Annotation注册
BeeHiveMod(JCTabBarModule)

@interface JCTabBarModule() <BHModuleProtocol>

@end

@implementation JCTabBarModule

// 动态注册
//BH_EXPORT_MODULE(NO)

// 下面也属于动态注册，和上面的一样
//+ (void)load {
//   [BeeHive registerDynamicModule:[self class]];
//}

/*
   Module运行顺序如下(生命周期)：
    1. modSetup:
    2. modInit:
    3. modSplash:
 */
- (void)modSetUp:(BHContext *)context {
    NSLog(@"%s", __FUNCTION__);
}

- (void)modInit:(BHContext *)context {
    NSLog(@"%s", __FUNCTION__);
}

- (void)modSplash:(BHContext *)context {
    NSLog(@"%s", __FUNCTION__);
}

- (void)modOpenURL:(BHContext *)context {
    NSLog(@"%s", __FUNCTION__);
}

- (void)modUnmount:(BHContext *)context {
    NSLog(@"%s", __FUNCTION__);
}

- (void)modTearDown:(BHContext *)context {
    NSLog(@"%s", __FUNCTION__);
}

- (void)modQuickAction:(BHContext *)context {
    NSLog(@"%s", __FUNCTION__);
}

- (void)modWillTerminate:(BHContext *)context {
    NSLog(@"%s", __FUNCTION__);
}

- (void)modDidEnterBackground:(BHContext *)context {
    NSLog(@"%s", __FUNCTION__);
}

- (void)modWillEnterForeground:(BHContext *)context {
    NSLog(@"%s", __FUNCTION__);
}

@end

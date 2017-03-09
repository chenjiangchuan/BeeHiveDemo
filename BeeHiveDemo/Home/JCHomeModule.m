//
//  HomeModule.m
//  BeeHiveDemo
//
//  Created by oriochan on 2017/3/9.
//  Copyright © 2017年 oriochan. All rights reserved.
//

#import "JCHomeModule.h"
#import "JCService.h"
// 注册Module
BeeHiveMod(JCHomeModule)

@interface JCHomeModule() <BHModuleProtocol>

@end

@implementation JCHomeModule

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

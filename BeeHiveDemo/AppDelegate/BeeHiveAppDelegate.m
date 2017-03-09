//
//  AppDelegate.m
//  BeeHiveDemo
//
//  Created by oriochan on 2017/3/9.
//  Copyright © 2017年 oriochan. All rights reserved.
//

#import "BeeHiveAppDelegate.h"
#import "JCService.h"

@interface BeeHiveAppDelegate ()

@end

@implementation BeeHiveAppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [BHContext shareInstance].application = application;
    [BHContext shareInstance].launchOptions = launchOptions;
    
    // 静态注册Module
//    [BHContext shareInstance].moduleConfigName = @"BeeHive.bundle/BeeHive";
    // 静态注册Service
//    [BHContext shareInstance].serviceConfigName = @"BeeHive.bundle/BHService";
    
    [BeeHive shareInstance].enableException = YES;
    [[BeeHive shareInstance] setContext:[BHContext shareInstance]];
    
    [super application:application didFinishLaunchingWithOptions:launchOptions];
    
    // 生产Service
    id <TabBarServiceProtocol> tabBarVc = [[BeeHive shareInstance] createService:@protocol(TabBarServiceProtocol)];
    
    if ([tabBarVc isKindOfClass:[UIViewController class]]) {
        UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:(UIViewController*)tabBarVc];
        
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.rootViewController = navCtrl;
        
        [self.window makeKeyAndVisible];
    }
    
    return YES;
}

@end

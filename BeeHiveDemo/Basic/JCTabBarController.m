//
//  JCTabBarController.m
//  BeeHiveDemo
//
//  Created by oriochan on 2017/3/9.
//  Copyright © 2017年 oriochan. All rights reserved.
//

#import "JCTabBarController.h"
#import "JCService.h"

// 模拟一个空控制器
@interface DemoTableViewController : UIViewController
@end

@implementation DemoTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
@end
// end

/**
 *  注册ServiceProtocol的三种方式：
 *  1、静态注册，在delegate中：[BHContext shareInstance].serviceConfigName = @"BeeHive.bundle/BHService";
 *  2、动态注册，在load方法
 *  3、Annotation注册
 */

// Annotation注册
BeeHiveService(TabBarServiceProtocol, JCTabBarController)

@interface JCTabBarController () <TabBarServiceProtocol>

/** 存放子控制器的数组 */
@property (strong, nonatomic) NSMutableArray *registerViewControllersArray;

@end

@implementation JCTabBarController

#pragma mark - Life Cycle

// 在load中注册
//+ (void)load {
//    [[BeeHive shareInstance] registerService:@protocol(TabBarServiceProtocol) service:[JCTabBarController class]];
//}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        
        // 第一个控制器
        DemoTableViewController *demoVC = [[DemoTableViewController alloc] init];
        
        if ([demoVC isKindOfClass:[UIViewController class]]) {
            [self registerViewController:demoVC title:@"首页" iconName:nil];
        }
        
        // 第二个控制器
        id <HomeServiceProtocol> homeVc = [[BeeHive shareInstance] createService:@protocol(HomeServiceProtocol)];
        
        if ([homeVc isKindOfClass:[UIViewController class]]) {
//            NSLog(@"homeVc = %@", homeVc);
            homeVc.itemId = @"第二个控制器";
            [self registerViewController:(UIViewController *)homeVc title:@"主页" iconName:nil];
        }
        
//        id <HomeServiceProtocol> homeViewC = [[BeeHive shareInstance] createService:@protocol(HomeServiceProtocol)];
//        NSLog(@"homeViewC = %@", homeViewC);
        
    }
    
    return self;
}

- (void)viewDidLoad {
    
    NSLog(@"%s", __FUNCTION__);
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - TabBarServiceProtocol

- (void)registerViewController:(UIViewController *)vc title:(NSString *)title iconName:(NSString *)iconName {
    vc.tabBarItem.image = [UIImage imageNamed:iconName];
    vc.tabBarItem.title = title;
    
    [self.registerViewControllersArray addObject:vc];
    
    self.viewControllers = self.registerViewControllersArray;
}

#pragma mark - Lazy Initialization

- (NSMutableArray *)registerViewControllersArray {
    if (_registerViewControllersArray == nil) {
        _registerViewControllersArray = [NSMutableArray array];
    }
    return _registerViewControllersArray;
}

@end

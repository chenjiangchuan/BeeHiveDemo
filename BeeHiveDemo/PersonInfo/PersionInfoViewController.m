//
//  PersionInfoViewController.m
//  BeeHiveDemo
//
//  Created by oriochan on 2017/3/9.
//  Copyright © 2017年 oriochan. All rights reserved.
//

#import "PersionInfoViewController.h"
#import "JCService.h"
#import "PersionInfoModel.h"

//BeeHiveService(PersionInfoServiceProtocol, PersionInfoViewController) // 把注册放到Module里

@interface PersionInfoViewController () <PersionInfoServiceProtocol>

@end

@implementation PersionInfoViewController

@synthesize persionInfoModel = _persionInfoModel;

#pragma mark - Life Cycle

/**
 *  @author chenjiangchuan, 17-03-10 10:03:10
 *
 *  把PersionInfoViewController设置成单例
 *
 */
- (BOOL)singleton {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __FUNCTION__);
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
    
    NSLog(@"name = %@, age = %d", self.persionInfoModel.name, self.persionInfoModel.age);
}

#pragma mark - PersionInfoServiceProtocol

- (void)persionTest {
    NSLog(@"%s", __FUNCTION__);
}

@end

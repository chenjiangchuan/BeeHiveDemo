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

BeeHiveService(PersionInfoServiceProtocol, PersionInfoViewController)

@interface PersionInfoViewController () <PersionInfoServiceProtocol>

@end

@implementation PersionInfoViewController

@synthesize persionInfoModel = _persionInfoModel;

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
    
    NSLog(@"name = %@, age = %d", self.persionInfoModel.name, self.persionInfoModel.age);
}

@end

//
//  HomeViewController.m
//  BeeHiveDemo
//
//  Created by oriochan on 2017/3/9.
//  Copyright © 2017年 oriochan. All rights reserved.
//

#import "HomeViewController.h"
#import "JCService.h"
#import "PersionInfoModel.h"

// 注册Service
BeeHiveService(HomeServiceProtocol, HomeViewController)

@interface HomeViewController () <HomeServiceProtocol>

/** UILabel */
@property (strong, nonatomic) UILabel *label;
/** UIButton */
@property (strong, nonatomic) UIButton *button;

@end

@implementation HomeViewController

@synthesize itemId = _itemId;

#pragma mark - Life Cycle

/**
 *  @author chenjiangchuan, 17-03-09 14:03:55
 *
 *  是否把HomeViewController设成单例
 *
 *  @return YES:设成单例    NO:不设成单例
 */
- (BOOL)singleton {
    return NO;
}

- (void)viewDidLoad {
    
    NSLog(@"%s", __FUNCTION__);
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.label];
    [self.view addSubview:self.button];
    [self layoutPageSubviews];
}

- (void)layoutPageSubviews {
    
    CGFloat x = [UIScreen mainScreen].bounds.size.width * 0.5;
    CGFloat y = [UIScreen mainScreen].bounds.size.height * 0.5;
    CGFloat width = 100;
    CGFloat heigh = 20;
    
    self.label.frame = CGRectMake(x, y, width, heigh);
    self.button.frame = CGRectMake(x, y+20, width, heigh);

    self.label.text = self.itemId;
    [self.label sizeToFit];
}

#pragma mark - Event Response

- (void)buttonAction {
    
    id <PersionInfoServiceProtocol> persionInfoVc = [[BeeHive shareInstance] createService:@protocol(PersionInfoServiceProtocol)];
    if ([persionInfoVc isKindOfClass:[UIViewController class]]) {
        PersionInfoModel *model = [[PersionInfoModel alloc] init];
        model.name = @"cjc";
        model.age = 27;
        persionInfoVc.persionInfoModel = model;
        [self.navigationController pushViewController:(UIViewController *)persionInfoVc animated:YES];
    }
}

#pragma mark - Lazy Initialization

- (UILabel *)label {
    if (_label == nil) {
        _label = [[UILabel alloc] init];
        [_label setBackgroundColor:[UIColor redColor]];
    }
    return _label;
}

- (UIButton *)button {
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button setTitle:@"跳转" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

@end

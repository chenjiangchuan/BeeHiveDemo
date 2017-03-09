//
//  TabBarServiceProtocol.h
//  BeeHiveDemo
//
//  Created by oriochan on 2017/3/9.
//  Copyright © 2017年 oriochan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BHServiceProtocol.h"

@protocol TabBarServiceProtocol <NSObject, BHServiceProtocol>

@optional

- (void)registerViewController:(UIViewController *)vc
                         title:(NSString *)title
                      iconName:(NSString *)iconName;

@end

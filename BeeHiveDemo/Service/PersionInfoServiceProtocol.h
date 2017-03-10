//
//  PersionInfoServiceProtocol.h
//  BeeHiveDemo
//
//  Created by oriochan on 2017/3/9.
//  Copyright © 2017年 oriochan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BHServiceProtocol.h"

@class PersionInfoModel;

@protocol PersionInfoServiceProtocol <NSObject, BHServiceProtocol>

/** PersionInfoModel */
@property (strong, nonatomic) PersionInfoModel *persionInfoModel;

- (void)persionTest;

@end

//
//  HomeServiceProtocol.h
//  BeeHiveDemo
//
//  Created by oriochan on 2017/3/9.
//  Copyright © 2017年 oriochan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BHServiceProtocol.h"

@protocol HomeServiceProtocol <NSObject, BHServiceProtocol>

@optional

/**  */
@property (strong, nonatomic) NSString *itemId;

@end

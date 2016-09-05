//
//  PQListVideoModel.h
//  LiveAppDemo
//
//  Created by ios on 16/9/5.
//  Copyright © 2016年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PQCreatorItem;
@interface PQListVideoModel : NSObject

/** 直播流地址 */
@property (nonatomic, copy) NSString *stream_addr;
/** 关注人 */
@property (nonatomic, assign) NSUInteger online_users;
/** 城市 */
@property (nonatomic, copy) NSString *city;
/** 主播 */
@property (nonatomic, strong) PQCreatorItem *creator;

@end

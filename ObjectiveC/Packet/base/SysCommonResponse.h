//
//  SysCommonResponse.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IqPacket.h"

/*
	处理响应通用类
	result:返回结果,0:成功 1:失败
	description:处理结果描述
 */
@interface SysCommonResponse : IqPacket

@property (nonatomic, retain) NSString *result;
@property (nonatomic, retain) NSString *description;

// 组包--从Packet中读取数据到properties中。
- (void)getProperties:(NSMutableDictionary *)properties;

// 解包--从properties中读取数据到Packet中。
- (void)setProperties:(NSDictionary *)properties;

@end

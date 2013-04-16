//
//  LoginRequest.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IqPacket.h"

/*
 登录请求协议类
 */
@interface LoginRequest : IqPacket


@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *password;

//
- (Class)responsePacketClass;

// 从Packet中读取数据到properties中。
- (void)getProperties:(NSMutableDictionary *)properties;

// 从properties中读取数据到Packet中。
- (void)setProperties:(NSDictionary *)properties;

@end

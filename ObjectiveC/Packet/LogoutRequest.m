//
//  LogoutRequest.m
//  FeOAClient
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "LogoutRequest.h"
#import "LogoutResponse.h"

@implementation LogoutRequest

- (id)init {
    if(self = [super init:@"LogoutRequest"]){
        
	}
	return self;
}

// 返回request的回应数据对象类型
- (Class)responsePacketClass {
	return [LogoutResponse class];
}

@end

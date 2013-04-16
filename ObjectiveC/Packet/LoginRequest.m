//
//  LoginRequest.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "LoginRequest.h"
#import "LoginResponse.h"

@implementation LoginRequest

@synthesize name = _name;
@synthesize password = _password;

- (id)init {
    if(self = [super init:@"LoginRequest"]){
	}
	return self;
}

- (void)dealloc {
	[_name release];
	[_password release];
	[super dealloc];
}

// 返回request的回应数据对象类型
- (Class)responsePacketClass {
	return [LoginResponse class];
}

- (void)getProperties:(NSMutableDictionary *)properties{
	[super getProperties:properties];
	NSMutableDictionary *query = (NSMutableDictionary *)[IqPacket findProperty:properties path:@"iq/query"];
    if (self.name != nil) {
        [query setObject:self.name forKey:@"name"];
    }
	if (self.password) {
        [query setObject:self.password forKey:@"password"];
    }
}

- (void)setProperties:(NSDictionary *)properties{
	[super setProperties:properties];
	NSDictionary *query = (NSDictionary *)[IqPacket findProperty:properties path: @"iq/query"];
    if (query != nil) {
        self.name = [[query objectForKey:@"name"] stringValue];
        self.password = [[query objectForKey:@"password"] stringValue];
    }
}


@end

//
//  LoginResponse.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "LoginResponse.h"

@implementation LoginResponse

@synthesize userID = _userID;

- (void)dealloc{
    [_userID release];
    [super dealloc];
}

- (id)init {
    if(self = [super init:@"LoginResponse"]){
	}
	return self;
}

// 组包
- (void)getProperties:(NSMutableDictionary *)properties{
	[super getProperties:properties];
	NSMutableDictionary *query = (NSMutableDictionary *)[IqPacket findProperty:properties path:@"iq/query"];
	
	if (self.userID != nil) {
		[query setObject:self.userID forKey:@"userID"];
	}
}

// 解包
- (void)setProperties:(NSDictionary *)properties{
	[super setProperties:properties];
	NSDictionary *query = (NSDictionary *)[IqPacket findProperty:properties path: @"iq/query"];
    
    if (query != nil) {
        self.userID =  (NSString *)[query objectForKey:@"userID"];
    }
}

@end


//@implementation LogoutResponse
//
//- (id)init {
//	[super init:@"LogoutResponse"];
//	return self;
//}
//
//@end


@implementation ExceptionResponse

- (id)init {
	[super init:@"ExceptionResponse"];
	return self;
}

@end



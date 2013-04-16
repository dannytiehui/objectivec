//
//  SysCommonResponse.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "SysCommonResponse.h"


@implementation SysCommonResponse

@synthesize result = _result;
@synthesize description = _description;


- (id)init:(NSString *)pNameSpace {
	if (self = [super init:pNameSpace]) {

	}
	return self;
}

- (void)dealloc {
	[_result release];
	[_description release];
	[super dealloc];
}

//组包
- (void)getProperties:(NSMutableDictionary *)properties{
	[super getProperties:properties];
	NSMutableDictionary *query = (NSMutableDictionary *)[IqPacket findProperty:properties path:@"iq/query"];
	
	if (self.result != nil) {
		[query setObject:self.result forKey:@"result"];
	}
	
	if (self.description != nil) {
		[query setObject:self.description forKey:@"description"];
	}
	
}

//解包
- (void)setProperties:(NSDictionary *)properties{
	[super setProperties:properties];
	NSDictionary *query = (NSDictionary *)[IqPacket findProperty:properties path: @"iq/query"];
	NSString *tempResult = (NSString *)[query objectForKey:@"result"];
	NSString *tempDescription = (NSString *)[query objectForKey:@"description"];
	if (tempResult != nil) {
		self.result = tempResult;
	}
	if (tempDescription != nil) {
		self.description = tempDescription;
	}
}


@end

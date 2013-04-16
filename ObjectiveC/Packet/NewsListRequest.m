//
//  NewsListRequest.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "NewsListRequest.h"


@implementation NewsListRequest

@synthesize typeID = _typeID;

- (id)init {
	[super init:@"NewsListRequest"];
	return self;
}

- (void)dealloc {
	[_typeID release];
	[super dealloc];
}

- (void)getProperties:(NSMutableDictionary *)properties{
	[super getProperties:properties];
	NSMutableDictionary *query = (NSMutableDictionary *)[IqPacket findProperty:properties path:@"iq/query"];
	if (self.typeID != nil) {
		[query setObject:self.typeID forKey:@"typeID"];
	}
}


- (void)setProperties:(NSDictionary *)properties{
	[super setProperties:properties];
	NSDictionary *query = (NSDictionary *)[IqPacket findProperty:properties path: @"iq/query"];
	if (query != nil) {
		self.typeID = (NSString *)[query objectForKey:@"typeID"];
	}
}

@end


//新闻类别
@implementation NewsTypeListRequest
- (id)init {
	[super init:@"NewsTypeListRequest"];
	return self;
}
@end

//公告列表
@implementation AnnoucementListRequest
- (id)init {
	[super init:@"AnnoucementListRequest"];
	return self;
}
@end

//公告类别列表
@implementation AnnoucementTypeListRequest
- (id)init {
	[super init:@"AnnoucementTypeListRequest"];
	return self;
}

@end
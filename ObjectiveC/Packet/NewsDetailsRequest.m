//
//  NewsDetailsRequest.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "NewsDetailsRequest.h"


@implementation NewsDetailsRequest

@synthesize newsID = _newsID;

- (id)init {
	if(self = [super init:@"NewsDetailsRequest"]){
        
	}
	return self;
}

- (void)dealloc {
	[_newsID release];
	[super dealloc];
}

- (void)getProperties:(NSMutableDictionary *)properties{
	[super getProperties:properties];
	NSMutableDictionary *query = (NSMutableDictionary *)[IqPacket findProperty:properties path:@"iq/query"];
	
	if (self.newsID != nil) {
		[query setObject:self.newsID forKey:@"id"];
	}
}


- (void)setProperties:(NSDictionary *)properties{
	[super setProperties:properties];
	NSDictionary *query = (NSDictionary *)[IqPacket findProperty:properties path: @"iq/query"];
	if (query != nil) {
		self.newsID = (NSString *)[query objectForKey:@"id"];
	}
}

@end


@implementation AnnoucementDetailsRequest

- (id)init {
	if(self = [super init:@"AnnoucementDetailsRequest"]){
        
	}
	return self;
}

@end

//
//  NewsDetailsRequest.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "NewsDetailsResponse.h"


@implementation NewsDetailsResponse

@synthesize newsDetailsItem;

- (id)init {
	[super init:@"NewsDetailsResponse"];
	return self;
}

- (void)dealloc {
	[newsDetailsItem release];
	[super dealloc];
}

- (void)getProperties:(NSMutableDictionary *)properties{
	[super getProperties:properties];
	NSMutableDictionary *query = (NSMutableDictionary *)[IqPacket findProperty:properties path:@"iq/query"];
	if (self.newsDetailsItem != nil) {
		[newsDetailsItem getProperties:query];
	}
}


- (void)setProperties:(NSDictionary *)properties{
	[super setProperties:properties];
	NSDictionary *query = (NSDictionary *)[IqPacket findProperty:properties path: @"iq/query"];
	if (query != nil) {
		self.newsDetailsItem = [[[NewsDetailsItem alloc] init] autorelease];
		[newsDetailsItem setProperties:query];
	}
}

@end


@implementation AnnoucementDetailsResponse

- (id)init {
	[super init:@"AnnoucementDetailsResponse"];
	return self;
}


@end

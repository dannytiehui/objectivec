//
//  ListRequest.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "ListRequest.h"


@implementation ListRequest

@synthesize currentPage = _currentPage;
@synthesize perPageNums = _perPageNums;
@synthesize orderBy = _orderBy;
@synthesize orderType = _orderType;
@synthesize searchKey = _searchKey;

- (void)dealloc {
	[_currentPage release];
	[_perPageNums release];
	[_orderBy release];
	[_orderType release];
	[_searchKey release];
	[super dealloc];
}


- (void)getProperties:(NSMutableDictionary *)properties{
	[super getProperties:properties];
	NSMutableDictionary *query = (NSMutableDictionary *)[IqPacket findProperty:properties path:@"iq/query"];
	
	if (self.currentPage != nil) {
		[query setObject:self.currentPage forKey:@"page"];
	}
	if (self.perPageNums != nil) {
		[query setObject:self.perPageNums forKey:@"perPageNums"];
	}
	if (self.orderBy != nil) {
		[query setObject:self.orderBy forKey:@"orderBy"];
	}
	if (self.orderType != nil) {
		[query setObject:self.orderType forKey:@"orderType"];
	}
	if (self.searchKey != nil) {
		[query setObject:self.searchKey forKey:@"searchKey"];
	}
	
}


- (void)setProperties:(NSDictionary *)properties{
	[super setProperties:properties];
	NSDictionary *query = (NSDictionary *)[IqPacket findProperty:properties path: @"iq/query"];
	if (query != nil) {
		self.currentPage = (NSString *)[query objectForKey:@"page"];
		self.perPageNums = (NSString *)[query objectForKey:@"perPageNums"];
		self.orderBy = (NSString *)[query objectForKey:@"orderBy"];
		self.orderType = (NSString *)[query objectForKey:@"orderType"];
		self.searchKey = (NSString *)[query objectForKey:@"searchKey"];
	}
}


@end

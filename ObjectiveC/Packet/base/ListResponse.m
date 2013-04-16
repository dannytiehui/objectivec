//
//  ListResponse.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "ListResponse.h"

@implementation ListResponse

@synthesize totalNums;
@synthesize dataTable;
@synthesize isNeedTranslate = _isNeedTranslate;
@synthesize entityList = _entityList;

- (id)init:(NSString *)pNameSpace {
	if (self = [super init:pNameSpace]) {
         _entityList = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)dealloc {
    [_entityList release];
	[dataTable release];
	[super dealloc];
}

//组包
- (void)getProperties:(NSMutableDictionary *)properties{
	[super getProperties:properties];
	NSMutableDictionary *query = (NSMutableDictionary *)[IqPacket findProperty:properties path:@"iq/query"];
	
    [query setObject:[NSString stringWithFormat:@"%ld",self.totalNums] forKey:@"totalNums"];

	if (self.dataTable != nil) {
		NSMutableDictionary *tableProperty = [[[NSMutableDictionary alloc] init] autorelease];
		[query setObject:tableProperty forKey:@"table"];
		[dataTable getProperties:tableProperty];
	}
}

// 解包
- (void)setProperties:(NSDictionary *)properties{
	[super setProperties:properties];
	NSDictionary *query = (NSDictionary *)[IqPacket findProperty:properties path: @"iq/query"];

	if (query != nil) {
		self.totalNums = [[query objectForKey:@"totalNums"] intValue];
        
        NSDictionary *types = [query objectForKey:@"types"];//_Tiehui.Lu
        NSDictionary *tableProperty = [types objectForKey:@"table"];//_Tiehui.Lu
        
		//NSDictionary *tableProperty = [query objectForKey:@"table"];
		if (tableProperty != nil) {
			self.dataTable = [[[DataTable alloc] init] autorelease];
			[dataTable setProperties:tableProperty];
		}
	}
}

#pragma mark -child class implement it
- (void)translateDataTableToEntityList{
    
}


@end

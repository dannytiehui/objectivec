//
//  NewsTypeItem.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "NewsTypeItem.h"


@implementation NewsTypeItem

@synthesize typeID,name,nums;

- (id)init {
	if(self = [super init]){
	}
	return self;
}

- (void)dealloc {
	[typeID release];
	[name release];
	[nums release];
//	[dataTable release];
	[super dealloc];
}


//组包
- (void)getProperties:(NSMutableDictionary *)properties{
		
	if (properties != nil) {
		if (self.typeID != nil) {
			[properties setObject:self.typeID forKey:@"id"];
		}
		
		if (self.name != nil) {
			[properties setObject:self.name forKey:@"name"];
		}
		
		if (self.nums != nil) {
			[properties setObject:self.nums forKey:@"nums"];
		}
		
//		if (self.dataTable != nil) {
//			NSMutableDictionary *dict = [[[NSMutableDictionary alloc] init] autorelease];
//			[properties setObject:dict forKey:@"table"];
//			[dataTable getProperties:dict];
//		}
		
	}
}

//解包
- (void)setProperties:(NSDictionary *)properties{

	if (properties != nil) {
		self.typeID = (NSString *)[properties objectForKey:@"id"];
		self.name = (NSString *)[properties objectForKey:@"name"];
		self.nums = (NSString *)[properties objectForKey:@"nums"];
		
//		NSDictionary *tableProperty = [properties objectForKey:@"table"];
//		if (tableProperty != nil) {
//			self.dataTable = [[[DataTable alloc] init] autorelease];
//			[dataTable setProperties:tableProperty];
//		}
		

	}
}

@end

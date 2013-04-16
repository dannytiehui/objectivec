//
//  NewsTypeCollection.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "NewsTypeCollection.h"
#import "NewsTypeItem.h"

@implementation NewsTypeCollection

@synthesize newsTypeArray;

- (id)init {
	if(self = [super init]){
		newsTypeArray = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)dealloc {
	[newsTypeArray release];
	[super dealloc];
}


- (NSUInteger) count{
    return [newsTypeArray count];
}

- (NewsTypeItem *)objectAtIndex:(NSUInteger)index{
    return [newsTypeArray objectAtIndex:index];
}


- (void)addNewsTypeItem:(NewsTypeItem *)aItem{
	if (aItem == nil) {
		return;
	}
	
	[newsTypeArray addObject:aItem];
}

//组包
- (void)getProperties:(NSMutableArray *)properties{
	if (properties != nil) {
		NSInteger count = [newsTypeArray count];
		NewsTypeItem *newsTypeItem = nil;
		for (int i=0; i<count; i++) {
			newsTypeItem = [newsTypeArray objectAtIndex:i];
			NSMutableDictionary *dict = [[[NSMutableDictionary alloc] init]autorelease];
			[properties addObject:dict];
			[newsTypeItem getProperties:dict];
		}
	}
}

//解包
- (void)setProperties:(NSArray *)properties{
	if (properties != nil) {
		for (NSDictionary *rowProperty in properties) {
			NewsTypeItem *newsTypeItem = [[[NewsTypeItem alloc] init]autorelease];
			[newsTypeItem setProperties:rowProperty];
			[newsTypeArray addObject:newsTypeItem];
		}
	}
}

@end

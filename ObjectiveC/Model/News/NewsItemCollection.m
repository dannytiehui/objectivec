//
//  NewsItemCollection.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "NewsItemCollection.h"
#import "NewsDetailsItem.h"

@implementation NewsItemCollection

@synthesize mutableArray;

- (id)init {
	if(self = [super init]){
		mutableArray = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)dealloc {
	[mutableArray release];
	[super dealloc];
}

- (NSUInteger)count{
    return [mutableArray count];
}

- (NewsDetailsItem *)objectAtIndex:(NSUInteger)index{
  return  [mutableArray objectAtIndex:index];
}

- (void)addObject:(NewsDetailsItem *)anObject{
	if (anObject == nil) {
		return;
	}
	
	[mutableArray addObject:anObject];
}

- (void)removeAllObjects{
    [mutableArray removeAllObjects];
}

- (void)removeObjectAtIndex:(NSUInteger)index{
    [mutableArray removeObjectAtIndex:index];
}

//组包
- (void)getProperties:(NSMutableArray *)properties{
	if (properties != nil) {
		NSInteger count = [mutableArray count];
		NewsDetailsItem *newsItem = nil;
		for (int i=0; i<count; i++) {
			newsItem = [mutableArray objectAtIndex:i];
			NSMutableDictionary *dict = [[[NSMutableDictionary alloc] init]autorelease];
			[properties addObject:dict];
			[newsItem getProperties:dict];
		}
	}
}

//解包
- (void)setProperties:(NSArray *)properties{
	if (properties != nil) {
		for (NSDictionary *rowProperty in properties) {
			NewsDetailsItem *newsItem = [[[NewsDetailsItem alloc] init]autorelease];
			[newsItem setProperties:rowProperty];
			[mutableArray addObject:newsItem];
		}
	}
}
@end

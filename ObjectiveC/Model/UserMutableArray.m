//
//  UserMutableArray.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-15.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "UserMutableArray.h"
#import "UserObject.h"

@implementation UserMutableArray

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

- (UserObject *)objectAtIndex:(NSUInteger)index{
    return [mutableArray objectAtIndex:index];
}

- (void)addObject:(UserObject *)anObject
{
	if (anObject == nil ) {
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

// 组包
- (void)getProperties:(NSMutableArray *)properties{
	if (properties != nil) {
		NSInteger count = [self count];
		UserObject *userObject = nil;
		for (int i=0; i<count; i++) {
			userObject = [self objectAtIndex:i];
			NSMutableDictionary *dict = [[[NSMutableDictionary alloc] init] autorelease];
			[properties addObject:dict];
			[userObject getProperties:dict];
		}
	}
}

// 解包
- (void)setProperties:(NSArray *)properties{
	if (properties != nil) {
		for (NSDictionary *rowProperty in properties) {
			UserObject *userObject = [[[UserObject alloc] init] autorelease];
			[userObject setProperties:rowProperty];
			[mutableArray addObject:userObject];
		}
	}
}


@end

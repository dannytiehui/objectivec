//
//  AttachmentCollection.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 zhnews. All rights reserved.
//


#import "AttachmentCollection.h"
#import "AttachmentItem.h"

@implementation AttachmentCollection

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

- (AttachmentItem *)objectAtIndex:(NSUInteger)index{
    return [mutableArray objectAtIndex:index];
}

- (void)addObject:(AttachmentItem *)anObject
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


//组包
- (void)getProperties:(NSMutableArray *)properties{
	if (properties != nil) {
		NSInteger count = [self count];
		AttachmentItem *attachmentItem = nil;
		for (int i=0; i<count; i++) {
			attachmentItem = [self objectAtIndex:i];
			NSMutableDictionary *dict = [[[NSMutableDictionary alloc] init] autorelease];
			[properties addObject:dict];
			[attachmentItem getProperties:dict];
		}
	}
}

//解包
- (void)setProperties:(NSArray *)properties{
	if (properties != nil) {
		for (NSDictionary *rowProperty in properties) {
			AttachmentItem *attachmentItem = [[[AttachmentItem alloc] init] autorelease];
			[attachmentItem setProperties:rowProperty];
			[mutableArray addObject:attachmentItem];
		}
	}
}


@end

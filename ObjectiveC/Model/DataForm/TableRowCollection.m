//
//  TableRowCollection.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "TableRowCollection.h"
#import "TableRow.h"

@implementation TableRowCollection

- (id)init {
	if(self = [super init]){
		tableRowArray = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)dealloc {
	[tableRowArray release];
	[super dealloc];
}

- (NSUInteger)count{
    return [tableRowArray count];
}

- (TableRow *)objectAtIndex:(NSUInteger)index{
    return [tableRowArray objectAtIndex:index];
}


- (void)addTableRow:(TableRow *)aTableRow{
	if (aTableRow == nil ) {
		return;
	}

	[tableRowArray addObject:aTableRow]; 
}



//组包
- (void)getProperties:(NSMutableArray *)properties{
	if (properties != nil) {
		NSInteger count = [tableRowArray count];
		TableRow *row = nil;
		for (int i=0; i<count; i++) {
			row = [tableRowArray objectAtIndex:i];
			NSMutableArray *array = [[[NSMutableArray alloc] init]autorelease];
			[properties addObject:array];
			[row getProperties:array];
		}
	}
}

//解包
- (void)setProperties:(NSArray *)properties{
	if (properties != nil) {
		for (NSArray *rowProperty in properties) {
			TableRow *tableRow = [[[TableRow alloc] init]autorelease];
			[tableRow setProperties:rowProperty];
			[tableRowArray addObject:tableRow];
		}
	}
}


@end

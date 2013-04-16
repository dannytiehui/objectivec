//
//  TableRow.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "TableRow.h"
#import "DataItem.h"

@implementation TableRow

- (id)init {
	if(self = [super init]){
		dataItemArray = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)dealloc {
	[dataItemArray release];
	[super dealloc];
}

- (void)addDataItem:(NSString *)aFieldName value:(NSString *)value{
	if (aFieldName == nil || value == nil) {
		return;
	}
	
	DataItem *item = [[[DataItem alloc] init] autorelease];
	item.dataFieldName = aFieldName;
	item.value = value;
	[dataItemArray addObject:item]; 
}


- (DataItem *)getDataItemByFieldName:(NSString *)aFieldName{
	DataItem *result = nil;
	for (DataItem *item in dataItemArray) {
		if ([item.dataFieldName isEqualToString:aFieldName] ) {
			result = item;
			break;
		}
	}
	return result;
}


//组包
- (void)getProperties:(NSMutableArray *)properties{
	if (properties != nil) {
		NSInteger count = [dataItemArray count];
		DataItem *item = nil;
		for (int i=0; i<count; i++) {
			item = [dataItemArray objectAtIndex:i];
			NSMutableDictionary *dict = [[[NSMutableDictionary alloc] init]autorelease];
			[properties addObject:dict];
			[item getProperties:dict];
		}
	}
}

//解包
- (void)setProperties:(NSArray *)properties{
	if (properties != nil) {
		for (NSDictionary *itemElement in properties) {
			DataItem *dataItem = [[[DataItem alloc] init]autorelease];
			[dataItem setProperties:itemElement];
			[dataItemArray addObject:dataItem];
		}
	}
}


@end

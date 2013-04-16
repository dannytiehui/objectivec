//
//  TableSchema.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "TableSchema.h"
#import "DataField.h"

@implementation TableSchema

- (id)init {
	if(self = [super init]){
		dataFieldArray = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void)dealloc {
	[dataFieldArray release];
	[super dealloc];
}

- (NSUInteger)count{
    return [dataFieldArray count];
}

- (DataField *)objectAtIndex:(NSUInteger)index{
    return [dataFieldArray objectAtIndex:index];
}

- (void)addDataField:(DataField *)aDataField{
	if (aDataField == nil) {
		return;
	}
	
	[dataFieldArray addObject:aDataField];
}


//组包
- (void)getProperties:(NSMutableArray *)properties{
	if (properties != nil) {
		NSInteger count = [dataFieldArray count];
		DataField *dataField = nil;
		for (int i=0; i<count; i++) {
			dataField = [dataFieldArray objectAtIndex:i];
			NSMutableDictionary *dict = [[[NSMutableDictionary alloc] init]autorelease];
			[properties addObject:dict];
			[dataField getProperties:dict];
		}
	}
}

//解包
- (void)setProperties:(NSArray *)properties{
	for (NSDictionary *itemElement in properties) {
		DataField *dataField = [[[DataField alloc] init]autorelease];
		[dataField setProperties:itemElement];
		[dataFieldArray addObject:dataField];
	}
}



@end

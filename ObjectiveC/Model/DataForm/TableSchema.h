//
//  TableSchema.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DataField;

@interface TableSchema : NSObject {
	NSMutableArray *dataFieldArray;
}

- (void)addDataField:(DataField *)aDataField;

- (NSUInteger)count;
- (DataField *)objectAtIndex:(NSUInteger)index;

//组包
- (void)getProperties:(NSMutableArray *)properties;

//解包
- (void)setProperties:(NSArray *)properties;

@end

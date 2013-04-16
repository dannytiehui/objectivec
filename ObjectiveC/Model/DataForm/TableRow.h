//
//  TableRow.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DataItem;

@interface TableRow : NSObject {
	NSMutableArray *dataItemArray;
}

- (void)addDataItem:(NSString *)aFieldName value:(NSString *)value;
- (DataItem *)getDataItemByFieldName:(NSString *)aFieldName;

//组包
- (void)getProperties:(NSMutableArray *)properties;

//解包
- (void)setProperties:(NSArray *)properties;


@end

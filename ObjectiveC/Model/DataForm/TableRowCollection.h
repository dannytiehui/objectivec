//
//  TableRowCollection.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TableRow;

@interface TableRowCollection : NSObject {
	NSMutableArray *tableRowArray;
}

- (NSUInteger)count;
- (TableRow *)objectAtIndex:(NSUInteger)index;

- (void)addTableRow:(TableRow *)aTableRow;

//组包
- (void)getProperties:(NSMutableArray *)properties;

//解包
- (void)setProperties:(NSArray *)properties;


@end

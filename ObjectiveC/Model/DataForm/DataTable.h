//
//  DataTable.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableSchema.h"
#import "TableRowCollection.h"

@interface DataTable : NSObject {
	NSString *name;
	NSString *displayName;
	
	TableSchema *tableSchema;
	TableRowCollection *tableRowCollection;
}

@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *displayName;
@property (nonatomic,retain) TableSchema *tableSchema;
@property (nonatomic,retain) TableRowCollection *tableRowCollection;


//组包
- (void)getProperties:(NSMutableDictionary *)properties;

//解包
- (void)setProperties:(NSDictionary *)properties;

@end

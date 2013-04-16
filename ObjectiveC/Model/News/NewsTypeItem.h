//
//  NewsTypeItem.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataTable.h"

@interface NewsTypeItem : NSObject 

@property(nonatomic, retain) NSString *typeID;
@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *nums;
//@property (nonatomic,retain) DataTable *dataTable;

//组包
- (void)getProperties:(NSMutableDictionary *)properties;

//解包
- (void)setProperties:(NSDictionary *)properties;

@end

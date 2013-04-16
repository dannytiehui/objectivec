//
//  DataItem.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DataItem : NSObject {
	NSString *dataFieldName;
	NSString *value;
}

@property (nonatomic,retain)NSString *dataFieldName;
@property (nonatomic,retain)NSString *value;

//组包
- (void)getProperties:(NSMutableDictionary *)properties;

//解包
- (void)setProperties:(NSDictionary *)properties;


@end

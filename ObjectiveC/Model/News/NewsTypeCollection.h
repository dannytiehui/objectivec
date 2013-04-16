//
//  NewsTypeCollection.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NewsTypeItem;

@interface NewsTypeCollection : NSObject {
	NSMutableArray *newsTypeArray;
}

@property (nonatomic,readonly)NSMutableArray *newsTypeArray;

- (NSUInteger) count;

- (NewsTypeItem *)objectAtIndex:(NSUInteger)index;

- (void)addNewsTypeItem:(NewsTypeItem *)aItem;

//组包
- (void)getProperties:(NSMutableArray *)properties;

//解包
- (void)setProperties:(NSArray *)properties;


@end

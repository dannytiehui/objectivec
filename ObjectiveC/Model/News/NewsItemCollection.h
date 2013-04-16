//
//  NewsItemCollection.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NewsDetailsItem;

@interface NewsItemCollection : NSObject{
    NSMutableArray *mutableArray;
}

@property(nonatomic, readonly) NSMutableArray *mutableArray;

- (NSUInteger)count;

- (NewsDetailsItem *)objectAtIndex:(NSUInteger)index;

- (void)addObject:(NewsDetailsItem *)anObject;

- (void)removeAllObjects;
- (void)removeObjectAtIndex:(NSUInteger)index;


//组包
- (void)getProperties:(NSMutableArray *)properties;

//解包
- (void)setProperties:(NSArray *)properties;

@end

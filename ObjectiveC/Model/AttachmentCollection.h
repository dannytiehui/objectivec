//
//  AttachmentCollection.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 zhnews. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AttachmentItem;

@interface AttachmentCollection : NSObject
{
    NSMutableArray *mutableArray;
}


- (NSUInteger)count;

- (AttachmentItem *)objectAtIndex:(NSUInteger)index;

- (void)addObject:(AttachmentItem *)anObject;

- (void)removeAllObjects;
- (void)removeObjectAtIndex:(NSUInteger)index;

//组包
- (void)getProperties:(NSMutableArray *)properties;

//解包
- (void)setProperties:(NSArray *)properties;

@end

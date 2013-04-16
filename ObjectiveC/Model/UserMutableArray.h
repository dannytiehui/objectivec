//
//  UserMutableArray.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-15.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserObject;

@interface UserMutableArray : NSObject
{
    NSMutableArray *mutableArray;
}

- (NSUInteger)count;

- (UserObject *)objectAtIndex:(NSUInteger)index;

- (void)addObject:(UserObject *)anObject;

- (void)removeAllObjects;
- (void)removeObjectAtIndex:(NSUInteger)index;

// 组包
- (void)getProperties:(NSMutableArray *)properties;

// 解包
- (void)setProperties:(NSArray *)properties;

@end

//
//  Foo.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-3-25.
//  Copyright (c) 2013年 zhnews. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Foo : NSObject <NSCoding>
{
    int intVal;
    float floatVal;
    NSString * strVal;
}

@property int intVal;
@property float floatVal;
@property(nonatomic, copy) NSString * strVal;

@end

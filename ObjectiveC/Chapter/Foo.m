//
//  Foo.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-3-25.
//  Copyright (c) 2013年 zhnews. All rights reserved.
//

#import "Foo.h"

@implementation Foo

@synthesize intVal, floatVal, strVal;

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:intVal forKey:@"FoointVal"];
    [aCoder encodeFloat:floatVal forKey:@"FoofloatVal"];
    [aCoder encodeObject:strVal forKey:@"FoostrVal"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    intVal = [aDecoder decodeIntForKey:@"FoointVal"];
    floatVal = [aDecoder decodeFloatForKey:@"FoofloatVal"];
    strVal = [[aDecoder decodeObjectForKey:@"FoostrVal"] retain];
    
    return self;
}

@end

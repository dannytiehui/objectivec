//
//  ExampleSingleton.m
//  ObjectC
//
//  Created by Tiehui.Lu on 13-3-15.
//  Copyright (c) 2013年 zhnews. All rights reserved.
//

/*
1.首先必须创建一个全局实例，通常存放在一个全局变量中,此全局变量设置为nil
 
2.提供工厂方法对该全局实例进行访问，检查该变量是否为nil，如果nil就创建一个新的实例，最后返回全局实例
 
3.全局变量的初始化在第一次调用工厂方法时会在+allocWithZone:中进行，所以需要重写该方法，防止通过标准的alloc方式创建新的实例
 
4.为了防止通过copy方法得到新的实例，需要实现-copyWithZone方法
 
5.只需在此方法中返回本身对象即可，引用计数也不需要进行改变，因为单例模式下的对象是不允许销毁的，所以也就不用保留
 
6.因为全局实例不允许释放，所以retain,release,autorelease方法均需重写
 */

#import "MyGizmoClass.h"

@implementation MyGizmoClass

static MyGizmoClass *sharedGizmoManager = nil;

+ (MyGizmoClass*)sharedManager
{
    @synchronized(self)
    {
        if (sharedGizmoManager == nil) {
            sharedGizmoManager = [[super allocWithZone:NULL] init];
        }
    }
    return sharedGizmoManager;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [[self sharedManager] retain];
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain
{
    return self;
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;  //denotes an object that cannot be released
}

- (void)release
{
    //do nothing
}

- (id)autorelease
{
    return self;
}

@end





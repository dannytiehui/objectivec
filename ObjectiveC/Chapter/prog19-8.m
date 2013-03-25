//
//  main.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-3-25.
//  Copyright (c) 2013年 zhnews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Foo.h"

#warning 把代码拷贝到main.m文件, 然后把"main_19_8"改为"main"即可运行
int main_19_8(int argc, const char * argv[])
{
    
    @autoreleasepool {
        Foo * myFoo1 = [[Foo alloc] init];
        Foo * myFoo2;
        
        [myFoo1 setIntVal:12345];
        [myFoo1 setFloatVal:98.6];
        [myFoo1 setStrVal:@"This is the string"];
        
        [NSKeyedArchiver archiveRootObject:myFoo1 toFile:@"foo.arch"];
        
        myFoo2 = [NSKeyedUnarchiver unarchiveObjectWithFile:@"foo.arch"];
        NSLog(@"%@\n%i\n%g", [myFoo2 strVal], [myFoo2 intVal], [myFoo2 floatVal]);
        
        //参考:p367
        NSLog(@"%ld", sizeof([myFoo2 intVal]));
        
        [myFoo1 release];
        
    }
    return 0;
}


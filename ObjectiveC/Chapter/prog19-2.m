//
//  main.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-3-25.
//  Copyright (c) 2013年 zhnews. All rights reserved.
//

#import <Foundation/Foundation.h>

#warning 把代码拷贝到main.m文件, 然后把"main_19_2"改为"main"即可运行
int main_19_2(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        // 使用NSKeyedArchiver归档
        NSDictionary * glossary = [NSDictionary dictionaryWithObjectsAndKeys:@"A class defined so other classes can inherit from it.", @"abstract class", @"To implement all the methods defined in a protocol", @"adopt", @"Storing an object for later use.", @"archiving", nil];
        
        if ([NSKeyedArchiver archiveRootObject:glossary toFile:@"glossary.archive"] == NO) {
            NSLog(@"Save to file failed! ");
        }
        
        NSDictionary * dict = [NSKeyedUnarchiver unarchiveObjectWithFile:@"glossary.archive"];
        for (NSString * key in dict) {
            NSLog(@"%@: %@", key, [dict objectForKey:key]);
        }
        
    }
    return 0;
}


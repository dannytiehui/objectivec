//
//  main.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-3-25.
//  Copyright (c) 2013年 zhnews. All rights reserved.
//

#import <Foundation/Foundation.h>

#warning 把代码拷贝到main.m文件, 然后把"main_19_1"改为"main"即可运行
int main_19_1(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        // 获取当前应用程序目录
        NSFileManager * fileManager = [NSFileManager defaultManager];
        NSString * path = [fileManager currentDirectoryPath];
        NSLog(@"%@", path); // /Users/luth/Library/Developer/Xcode/DerivedData/ObjectiveC-gqdnecwjqmifzngtqmwpvejrrkmb/Build/Products/Debug
        
        // 使用XML属性列表进行归档
        NSDictionary * glossary = [NSDictionary dictionaryWithObjectsAndKeys:
                                   @"A class defined so other classes can inherit from it.", @"abstract class",
                                   @"To implement all the methods defined in a protocol", @"adopt",
                                   @"Storing an object for later use.", @"archiving",
                                   nil];
        
        if ([glossary writeToFile:@"glossary" atomically:YES] == NO) {
            NSLog(@"Save to file failed! ");
        }
        
        //读取属性列表
        NSDictionary * dict = [NSDictionary dictionaryWithContentsOfFile:@"glossary"];
        for (NSString * key in dict) {
            NSLog(@"%@: %@", key, [dict objectForKey:key]);
        }
        
    }
    return 0;
}




//
//  main.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-3-25.
//  Copyright (c) 2013年 zhnews. All rights reserved.
//

#import <Foundation/Foundation.h>

#warning 把代码拷贝到main.m文件, 然后把"main_19_11"改为"main"即可运行
int main_19_11(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        // 使用归档程序复制对象(深复制) P371
        NSData * data;
        NSMutableArray * dataArray = [NSMutableArray arrayWithObjects:
                                      [NSMutableString stringWithString:@"one"],
                                      [NSMutableString stringWithString:@"two"],
                                      [NSMutableString stringWithString:@"three"],
                                      nil];
        
        NSMutableArray * dataArray2;
        NSMutableString * mStr;
        
        // Make a deep copy using the archiver
        data = [NSKeyedArchiver archivedDataWithRootObject:dataArray];
        dataArray2 = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
        mStr = [dataArray2 objectAtIndex:0];
        [mStr appendString:@"ONE"];
        
        NSLog(@"dataArray:");
        for (NSString * elem in dataArray) {
            NSLog(@"%@", elem);
        }
        
        NSLog(@"dataArray2:");
        for (NSString * elem in dataArray2) {
            NSLog(@"%@", elem);
        }
        
    }
    return 0;
}

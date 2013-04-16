//
//  main.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-3-27.
//  Copyright (c) 2013年 zhnews. All rights reserved.
//

#import <Foundation/Foundation.h>

#warning 把代码拷贝到main.m文件, 然后把"main_19_0"改为"main"即可运行
int main_19_0(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        // iOS中常用的四种数据持久化方法:属性列表、对象归档、SQLite3和Core Data
        // 以下是属性列表
        NSString *str = [NSString stringWithFormat:@"NSUserDefaults => Hello World!"];
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:str forKey:@"key"];
        NSLog(@"%@", [ud objectForKey:@"key"]);
        
    }
    return 0;
}

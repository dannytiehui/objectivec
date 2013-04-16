//
//  JsonBaseObj.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "JsonBaseObj.h"

@implementation JsonBaseObj

- (void)fromJSON:(NSString *)json {
    NSError *error;
    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableDictionary *properties = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
	[self setProperties:properties];
}

- (NSString *)toJSON {
	NSMutableDictionary *payload = [[[NSMutableDictionary alloc] init] autorelease];
	[self getProperties:payload];
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:payload options:NSJSONWritingPrettyPrinted error:&error];
    NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"JsonBaseObj=%@", json);
	return json;
}

// 组包 -- 从packet对象中,读取元素值到json字典中
- (void)getProperties:(NSMutableDictionary *)properties {
	//子类实现
}


// 解包 -- 从json字典对象中,提取出对象元素值,并赋到packet对象中
- (void)setProperties:(NSDictionary *)properties {	
	//子类实现
}


@end

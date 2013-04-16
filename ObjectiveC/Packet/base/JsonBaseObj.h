//
//  JsonBaseObj.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonBaseObj : NSObject {

}

// 将Packet转换为JSON格式的文本并且返回
- (NSString *)toJSON;

// 从传入的JSON文本转换为当前Packet。
- (void)fromJSON:(NSString *)json;


// 从packet对象中,读取元素值到json字典中
- (void)getProperties:(NSMutableDictionary *)properties;

//从json字典对象中,提取出对象元素值,并赋到packet对象中
- (void)setProperties:(NSDictionary *)properties;

@end

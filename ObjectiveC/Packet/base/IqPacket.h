//
//  IqPacket.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonBaseObj.h"

/*
	协议包基类
	nameSpace:名称空间
	version:协议版本
	model:手机型号:如iphone4,ipad2,android..
	resolution:手机屏幕分辨率:640*1136
 */
@interface IqPacket : JsonBaseObj

@property (nonatomic, retain) NSString *nameSpace;
@property (nonatomic, retain) NSString *version;
@property (nonatomic, retain) NSString *model;
@property (nonatomic, retain) NSString *resolution;

- (id)init:(NSString *)pNameSpace;

- (Class)responsePacketClass;

+ (id)findProperty:(NSDictionary *)properties path:(NSString *)path;
+ (id)findProperty:(NSDictionary *)properties path:(NSString *)path namespace:(NSString *)namespace;

@end

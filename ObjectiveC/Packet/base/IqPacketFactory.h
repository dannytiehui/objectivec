//
//  IqPacketFactory.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IqPacket.h"

@interface IqPacketFactory : NSObject {
	NSMutableArray *requestPacketArray;
	NSMutableArray *responsePacketArray;
}

+ (IqPacketFactory *)getInstance;

- (IqPacket *)getRequestPacketByName:(NSString *)aName;
- (IqPacket *)parseReponsePacketByData:(NSString *)aStr packetName:aName;

@end

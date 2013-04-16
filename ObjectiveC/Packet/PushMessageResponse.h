//
//  PushMessageResponse.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IqPacket.h"
#import "PushMessage.h"

@interface PushMessageResponse : IqPacket

@property (nonatomic,retain) PushMessage *pushMessage;

@end

@interface PushNewsResponse : PushMessageResponse {
	
}

@end


@interface PushAnnoucementResponse : PushMessageResponse {
	
}

@end



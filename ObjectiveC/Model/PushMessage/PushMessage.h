//
//  PushMessage.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsDetailsItem.h"

typedef enum {
    PushMessageTypeNews = 0,
    PushMessageTypeAnnouncement
}PushMessageType;


@interface PushMessage : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *messageID;
@property(nonatomic, assign) PushMessageType messageType;
@property(nonatomic, assign) NewsType newsType;

- (void)getProperties:(NSMutableDictionary *)properties;
- (void)setProperties:(NSDictionary *)properties;

@end

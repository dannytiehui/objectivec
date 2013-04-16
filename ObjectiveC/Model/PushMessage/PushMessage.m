//
//  PushMessage.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "PushMessage.h"

@implementation PushMessage

@synthesize title = _title;
@synthesize messageID = _messageID;
@synthesize messageType = _messageType;
@synthesize newsType = _newsType;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc{
    [_title release];
    [_messageID release];
    [super dealloc];
}

- (void)getProperties:(NSMutableDictionary *)properties{

	if (self.messageID != nil) {
		[properties setObject:self.messageID forKey:@"id"];
	}
	if (self.title != nil) {
		[properties setObject:self.title forKey:@"title"];
	}
    
    [properties setObject:[NSString stringWithFormat:@"%d",self.messageType] forKey:@"messageType"];
    [properties setObject:[NSString stringWithFormat:@"%d",self.newsType] forKey:@"newsType"];
}


- (void)setProperties:(NSDictionary *)properties{
	if (properties != nil) {
		self.messageID = [properties objectForKey:@"id"];
		self.title = [properties objectForKey:@"title"];
        self.messageType = [[properties objectForKey:@"messageType"] intValue];
        self.newsType = [[properties objectForKey:@"newsType"] intValue];
	}
}



@end

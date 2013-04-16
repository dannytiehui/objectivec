//
//  PushMessageResponse.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "PushMessageResponse.h"


@implementation PushMessageResponse

@synthesize pushMessage = _pushMessage;

- (id)init {
	if(self = [super init:@"PushMessageResponse"]){
	}
	return self;
}

- (void)dealloc {
    [_pushMessage release];
	[super dealloc];
}

- (void)getProperties:(NSMutableDictionary *)properties{
	[super getProperties:properties];
	NSMutableDictionary *query = (NSMutableDictionary *)[IqPacket findProperty:properties path:@"iq/query"];
    if (_pushMessage != nil) {
        [_pushMessage getProperties:query];
    }
//	if (self.messageID != nil) {
//		[query setObject:self.messageID forKey:@"id"];
//	}
//	if (self.title != nil) {
//		[query setObject:self.title forKey:@"title"];
//	}
}


- (void)setProperties:(NSDictionary *)properties{
	[super setProperties:properties];
	NSDictionary *query = (NSDictionary *)[IqPacket findProperty:properties path: @"iq/query"];
    if (query != nil) {
        self.pushMessage = [[[PushMessage alloc] init] autorelease];
        [_pushMessage setProperties:query];
    }
//	if (query != nil) {
//		self.messageID = [query objectForKey:@"id"];
//		self.title = [query objectForKey:@"title"];
//	}
}

@end



@implementation PushNewsResponse

- (id)init {
	if(self = [super init:@"PushNewsResponse"]){
	}
	return self;
}

@end

@implementation PushAnnoucementResponse

- (id)init {
	if(self = [super init:@"PushAnnoucementResponse"]){
	}
	return self;
}

@end

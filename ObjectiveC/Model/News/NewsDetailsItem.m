//
//  NewsDetailsItem.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "NewsDetailsItem.h"


@implementation NewsDetailsItem

@synthesize newsID = _newsID;
@synthesize title = _title;
@synthesize sendUser = _sendUser;
@synthesize sendTime = _sendTime;
@synthesize content = _content;
@synthesize readNums = _readNums;
@synthesize isNew;
@synthesize attachmentCollection = _attachmentCollection;
@synthesize newsType;

- (id)init {
	if(self = [super init]){
	}
	return self;
}

- (void)dealloc {
	[_newsID release];
	[_title release];
	[_sendUser release];
	[_sendTime release];
	[_content release];
	[_readNums release];
	[_attachmentCollection release];
	[super dealloc];
}

//组包
- (void)getProperties:(NSMutableDictionary *)properties{
	
	if (properties != nil) {
		if (self.newsID != nil) {
			[properties setObject:self.newsID forKey:@"id"];
		}
		
		if (self.title != nil) {
			[properties setObject:self.title forKey:@"title"];
		}
		
		if (self.sendUser != nil) {
			[properties setObject:self.sendUser forKey:@"sendUser"];
		}
		
		if (self.sendTime != nil) {
			[properties setObject:self.sendTime forKey:@"sendTime"];
		}
		
		if (self.content != nil) {
			[properties setObject:self.content forKey:@"content"];
		}
		
		if (self.readNums != nil) {
			[properties setObject:self.readNums forKey:@"readNums"];
		}
		
        [properties setObject:[NSString stringWithFormat:@"%d",isNew] forKey:@"isNew"];
        
		if (self.attachmentCollection != nil) {
			NSMutableArray *array = [[[NSMutableArray alloc] init] autorelease];
			[properties setObject:array forKey:@"attachments"];
			[_attachmentCollection getProperties:array];
		}
        
        [properties setObject:[NSString stringWithFormat:@"%d",newsType] forKey:@"newsType"];
		
	}
}

//解包
- (void)setProperties:(NSDictionary *)properties{
	
	if (properties != nil) {
		self.newsID = (NSString *)[properties objectForKey:@"id"];
		self.title = (NSString *)[properties objectForKey:@"title"];
		self.sendUser = (NSString *)[properties objectForKey:@"sendUser"];
		self.sendTime = (NSString *)[properties objectForKey:@"sendTime"];
		self.content = (NSString *)[properties objectForKey:@"content"];
		self.readNums = (NSString *)[properties objectForKey:@"readNums"];
        self.isNew = [[properties objectForKey:@"isNew"] boolValue];
		self.newsType = [[properties objectForKey:@"newsType"] boolValue];
        
		NSArray *attachmentsProperty = [properties objectForKey:@"attachments"];
		if (attachmentsProperty != nil) {
			self.attachmentCollection = [[[AttachmentCollection alloc] init] autorelease];
			[_attachmentCollection setProperties:attachmentsProperty];
		}
		
		
	}
}

@end

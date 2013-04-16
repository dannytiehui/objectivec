//
//  AttachmentItem.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 zhnews. All rights reserved.
//

#import "AttachmentItem.h"

@implementation AttachmentItem

@synthesize name = _name;
@synthesize type = _type;
@synthesize size = _size;
@synthesize href = _href;

- (id)init {
	if(self = [super init]){
	
	}
	return self;
}

- (void)dealloc {
	[_name release];
	[_size release];
	[_href release];
	[super dealloc];
}

//组包
- (void)getProperties:(NSMutableDictionary *)properties{
	if (properties != nil) {
		if (self.name != nil) {
			[properties setObject:self.name forKey:@"name"];
		}
		
        [properties setObject:[NSString stringWithFormat:@"%d",self.type] forKey:@"type"];
		
		if (self.size != nil) {
			[properties setObject:self.size forKey:@"size"];
		}
		
		if (self.href != nil) {
			[properties setObject:self.href forKey:@"href"];
		}
	}
}

//解包
- (void)setProperties:(NSDictionary *)properties{
	if (properties != nil) {
		self.name = (NSString *)[properties objectForKey:@"name"];
		self.type = [(NSString *)[properties objectForKey:@"type"] intValue];
		self.size = (NSString *)[properties objectForKey:@"size"];
		self.href = (NSString *)[properties objectForKey:@"href"];
	}
}



@end

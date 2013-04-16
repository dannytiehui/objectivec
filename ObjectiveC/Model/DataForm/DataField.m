//
//  DataField.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "DataField.h"


@implementation DataField

@synthesize name,type,displayName,description,primaryKey;

- (id)init {
	if(self = [super init]){
		
	}
	return self;
}

- (void)dealloc {
	[name release];
	[displayName release];
	[description release];
	[super dealloc];
}


//组包
- (void)getProperties:(NSMutableDictionary *)properties{
	if (properties != nil) {
		if (self.name != nil) {
			[properties setObject:self.name forKey:@"name"];
		}
		
		[properties setObject:[NSString stringWithFormat:@"%d",self.type] forKey:@"type"];
		
		
		if (self.displayName != nil) {
			[properties setObject:self.displayName forKey:@"displayName"];
		}
		
		if (self.description != nil) {
			[properties setObject:self.description forKey:@"description"];
		}
		
		[properties setObject:[NSString stringWithFormat:@"%d",self.primaryKey] forKey:@"primaryKey"];
		
	}
}

//解包
- (void)setProperties:(NSDictionary *)properties{
	if (properties != nil) {
		self.name = (NSString *)[properties objectForKey:@"name"];
		self.type = [[properties objectForKey:@"type"] intValue];
		self.displayName = (NSString *)[properties objectForKey:@"displayName"];
		self.description = (NSString *)[properties objectForKey:@"description"];
		self.primaryKey = [[properties objectForKey:@"primaryKey"] boolValue];
	}
}


@end

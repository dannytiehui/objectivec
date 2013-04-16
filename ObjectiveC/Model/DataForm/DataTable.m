//
//  DataTable.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "DataTable.h"


@implementation DataTable

@synthesize name,displayName,tableSchema,tableRowCollection;

- (id)init {
	if(self = [super init]){
		
	}
	return self;
}

- (void)dealloc {
	[name release];
	[displayName release];
	[tableSchema release];
	[tableRowCollection release];
	[super dealloc];
}

//组包
- (void)getProperties:(NSMutableDictionary *)properties{
	if (properties != nil) {
		if (self.name != nil) {
			[properties setObject:self.name forKey:@"name"];
		}
		
		if (self.displayName != nil) {
			[properties setObject:self.displayName forKey:@"displayName"];
		}
		
		if (self.tableSchema != nil) {
			NSMutableArray *arrayProperty = [[[NSMutableArray alloc] init] autorelease];
			[properties setObject:arrayProperty forKey:@"tableSchema"];
			[tableSchema getProperties:arrayProperty];
		}
		
		if (self.tableRowCollection != nil) {
			NSMutableArray *arrayProperty = [[[NSMutableArray alloc] init] autorelease];
			[properties setObject:arrayProperty forKey:@"tableRows"];
			[tableRowCollection getProperties:arrayProperty];
		}
	}
}

//解包
- (void)setProperties:(NSDictionary *)properties{
	if (properties != nil) {
		self.name = (NSString *)[properties objectForKey:@"name"];
		self.displayName = (NSString *)[properties objectForKey:@"displayName"];
		NSArray *tableSchemaProperty = [properties objectForKey:@"tableSchema"];
		if (tableSchemaProperty != nil) {
			self.tableSchema = [[[TableSchema alloc] init] autorelease];
			[tableSchema setProperties:tableSchemaProperty];
		}
		
		NSArray *tableRowsProperty = [properties objectForKey:@"tableRows"];
		if (tableRowsProperty != nil) {
			self.tableRowCollection = [[[TableRowCollection alloc] init] autorelease];
			[tableRowCollection setProperties:tableRowsProperty];
		}
	}
}



@end

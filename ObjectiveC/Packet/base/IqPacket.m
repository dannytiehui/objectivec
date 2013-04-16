//
//  IqPacket.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "IqPacket.h"

@implementation IqPacket

@synthesize nameSpace = _nameSpace;
@synthesize version = _version;
@synthesize model = _model;
@synthesize resolution = _resolution;

- (id)init:(NSString *)pNameSpace {
	if (self = [super init]) {
		self.nameSpace = pNameSpace;
	}
	return self;
}

- (void)dealloc {
	[_nameSpace release];
	[_version release];
	[_model release];
	[_resolution release];
	[super dealloc];
}

// 从packet对象中,读取元素值到json字典中--组包
- (void)getProperties:(NSMutableDictionary *)properties {
    [properties setObject:[[[NSMutableDictionary alloc] init]autorelease] forKey:@"iq"];
	NSMutableDictionary *parent = (NSMutableDictionary *)[properties objectForKey:@"iq"];
	
	if (self.nameSpace != nil) {
		[parent setObject:self.nameSpace forKey:@"namespace"];
	}
	if(self.version != nil){
		[parent setObject:self.version forKey:@"version"];
	}
	if (self.model != nil) {
		[parent setObject:self.model forKey:@"model"];
	}
	if (self.resolution != nil) {
		[parent setObject:self.resolution forKey:@"resolution"];
	}
	
	[parent setObject:[[[NSMutableDictionary alloc] init] autorelease] forKey:@"query"];
}


// 从json字典对象中,提取出对象元素值,并赋到packet对象中--解包
- (void)setProperties:(NSDictionary *)properties {	
	NSDictionary *parent = (NSDictionary *)[properties objectForKey:@"iq"];
	if (parent != nil) {
		self.nameSpace = [parent objectForKey:@"namespace"];
		self.version = [parent objectForKey:@"version"];
		self.model = [parent objectForKey:@"model"];
		self.resolution = [parent objectForKey:@"resolution"];
	}
}

- (Class)responsePacketClass {
	[NSException raise:@"NotImplementException" format:@"Require implements responsePacketClass."];
	return nil;
}

+ (id)findProperty:(NSDictionary *)properties path:(NSString *)path {
	return [IqPacket findProperty:properties path:path namespace:@""];
}

+ (id) findProperty: (NSDictionary *) properties path:(NSString *)path namespace:(NSString *)namespace {
	NSArray *chunks = [path componentsSeparatedByString: @"/"];
	NSDictionary *currentElement = properties;
	
	int count = 0;
	for (NSString *elementName in chunks) {
		count += 1;
		id valueObject = [currentElement objectForKey:elementName];
		
		if ([valueObject isKindOfClass:[NSDictionary class]] == NO && (count < [chunks count])) {
			currentElement = nil;
			break;
		}
		currentElement = valueObject;
	}
	
	/*
	if (currentElement != nil && [namespace isEqualToString: @""] != YES && namespace != nil) {
		// find sys_namespace
		if ([currentElement isKindOfClass:[NSArray class]]) {
			
			for (NSDictionary *item in currentElement) {
				if ([UMPacket _matchSysnamespace:item namespace:namespace]) {
					return item;
				}
			}
			
			return nil;
		}
		
		if ([UMPacket _matchSysnamespace:currentElement namespace:namespace]) {
			currentElement = nil;
		}
	}
	 */
	
	return currentElement;
}



@end

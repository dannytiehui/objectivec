//
//  IqPacketFactory.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "IqPacketFactory.h"
#import "ListResponse.h"

@interface IqPacketFactory(private)

- (void)_initRequestPacketCollection;
- (void)_initResponsePacketCollection;

@end

@implementation IqPacketFactory


+ (IqPacketFactory *) getInstance {
	static IqPacketFactory *instance;
	
	if (instance == nil) {
		instance = [[IqPacketFactory alloc] init];
	}
	
	return instance;
}

- (id)init {
	if (self = [super init]) {
		requestPacketArray = [[NSMutableArray alloc] init];
		responsePacketArray = [[NSMutableArray alloc] init];
		[self _initRequestPacketCollection];
		[self _initResponsePacketCollection];
	}
	return self;
}

- (void)dealloc {
	[requestPacketArray release];
	[responsePacketArray release];
	[super dealloc];
}

- (void)_initRequestPacketCollection{
	[requestPacketArray addObject:@"LoginRequest"];
	[requestPacketArray addObject:@"LogoutRequest"];
    [requestPacketArray addObject:@"NewsListRequest"];
}

- (void)_initResponsePacketCollection{
	[responsePacketArray addObject:@"LoginResponse"];
	[responsePacketArray addObject:@"LogoutResponse"];
    [responsePacketArray addObject:@"NewsListResponse"];
}

- (BOOL)_containsResponsePacket:(NSString *)packetName{
	BOOL bResult = NO;
	if ([responsePacketArray containsObject:packetName]) {
		bResult = YES;
	}
	return bResult;
}

- (IqPacket *)getRequestPacketByName:(NSString *)aName{
	if (![requestPacketArray containsObject:aName]) {
		return nil;
	}
    
	id object = [[[NSClassFromString(aName) alloc] init] autorelease];
	if (object != nil && [object isKindOfClass:[IqPacket class]]) {
		return object;
	}
	return nil;
}

- (IqPacket *)parseReponsePacketByData:(NSString *)aStr packetName:aName{
	id result = nil;
	
	if (![self _containsResponsePacket:aName]) {
		return nil;
	}

    NSError *error;
    NSData *data = [aStr dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableDictionary *properties = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
	
	result = [[[NSClassFromString(aName) alloc] init] autorelease];
	if (result != nil && [result isKindOfClass:[IqPacket class]]) {
		[result setProperties:properties];
        if ([result isKindOfClass:[ListResponse class]]) {
            if ([result isNeedTranslate]) {
                [result translateDataTableToEntityList];
            }
        }
		return result;
	}
	
	return nil;
}
	
@end

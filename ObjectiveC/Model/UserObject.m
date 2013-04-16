//
//  UserObject.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-15.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "UserObject.h"

@implementation UserObject

@synthesize userName = _userName;
@synthesize password = _password;
@synthesize sex;

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)dealloc
{
    [_userName release];
    _userName = nil;
    [_password release];
    _password = nil;
    [super dealloc];
}

//#pragma mark - AIIURLRequestDelegate
//- (void)initURL:(NSURL *)aURL parameter:(NSString *)aJson timeout:(NSTimeInterval)timeoutInterval
//{
//    [super initURL:aURL parameter:aJson timeout:timeoutInterval];
//    _responseString = super.responseString;
//    NSLog(@"%@", _responseString);
//}

// 组包
- (void)getProperties:(NSMutableDictionary *)properties{
	if (properties != nil) {
		if (self.userName != nil) {
			[properties setObject:self.userName forKey:@"userName"];
		}
        
		if (self.password != nil) {
			[properties setObject:self.password forKey:@"password"];
		}
        
        [properties setObject:[NSString stringWithFormat:@"%ld",self.sex] forKey:@"sex"];
	}
}

// 解包
- (void)setProperties:(NSDictionary *)properties{
	if (properties != nil) {
		self.userName = (NSString *)[properties objectForKey:@"userName"];
		self.password = (NSString *)[properties objectForKey:@"password"];
		self.sex = [[properties objectForKey:@"sex"] intValue];
	}
}


@end

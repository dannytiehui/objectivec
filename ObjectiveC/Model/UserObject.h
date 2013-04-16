//
//  UserObject.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-15.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SEX){
    SEXFemale  = 0,
    SEXMale
};

@interface UserObject : NSObject
{
    @private
    NSString *_responseString;
}

//@property(nonatomic, strong) NSString *requestJson;
//@property(nonatomic, strong) NSString *responseJson;

@property(nonatomic, copy) NSString *userName;
@property(nonatomic, copy) NSString *password;
@property(nonatomic, assign) SEX sex;


// 组包
- (void)getProperties:(NSMutableDictionary *)properties;

// 解包
- (void)setProperties:(NSDictionary *)properties;


@end

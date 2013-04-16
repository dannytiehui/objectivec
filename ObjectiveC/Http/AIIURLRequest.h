//
//  AIIURLRequest.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-15.
//  Copyright (c) 2013年 zhnews. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, METHOD){
    METHODGET   = 0,
    METHODPOST
};

@protocol AIIURLRequestDelegate <NSObject>

- (void)initURL:(NSURL *)aURL parameter:(NSString *)aJson timeout:(NSTimeInterval)timeoutInterval;

@end

@interface AIIURLRequest : NSObject<NSURLConnectionDelegate, NSURLConnectionDataDelegate>
{
//    NSData *responseData;
//    NSString *responseJSON;
//    NSString *responseString;

    @private
    NSString *_json;
    NSMutableData *_receiveData;
}

@property(nonatomic, readonly) NSTimeInterval timeSpendInterval;
@property(nonatomic, assign) NSTimeInterval timeoutInterval;
@property(nonatomic, strong) NSString *responseString;

- (void)initURL:(NSURL *)aURL parameter:(NSString *)aJson timeout:(NSTimeInterval)timeoutInterval;



@end

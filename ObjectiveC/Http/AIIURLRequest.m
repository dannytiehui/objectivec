//
//  AIIURLRequest.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-15.
//  Copyright (c) 2013年 zhnews. All rights reserved.
//

#import "AIIURLRequest.h"
#import "LoginResponse.h"
#import "IqPacketFactory.h"
#import "NewsListResponse.h"

@implementation AIIURLRequest

@synthesize timeSpendInterval = _timeSpendInterval;
@synthesize timeoutInterval = _timeoutInterval;
@synthesize responseString = _responseString;

- (id)init
{
    self = [super init];
    if (self) {
        _receiveData = [[NSMutableData alloc] init];
    }
    return self;
}

- (void)initURL:(NSURL *)aURL parameter:(NSString *)aJson timeout:(NSTimeInterval)timeoutInterval
{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:aURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
//    [NSURLConnection connectionWithRequest:request delegate:self];
    
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
	if(data != nil) {
        _responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"_responseString = %@", _responseString);
        
//        LoginResponse *response = (LoginResponse *)[[IqPacketFactory getInstance] parseReponsePacketByData:_responseString packetName:@"LoginResponse"];
        NewsListResponse *response = (NewsListResponse *)[[IqPacketFactory getInstance] parseReponsePacketByData:_responseString packetName:@"NewsListResponse"];
        NSLog(@"response = %@", [response toJSON]);
	}
}

#pragma mark - NSURLConnectionDelegate
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"数据连接出错");
}

#pragma mark - NSURLConnectionDataDelegate
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"didReceiveData");
    [_receiveData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"数据连接成功");
    NSError *error;
    _responseString = [[NSString alloc] initWithData:_receiveData encoding:NSUTF8StringEncoding];
    NSLog(@"_responseString = %@", _responseString);
    NSDictionary *dic;
    
    if ([NSJSONSerialization isValidJSONObject:_responseString]) {
        dic = [NSJSONSerialization JSONObjectWithData:_receiveData options:NSJSONReadingMutableLeaves error:&error];
    } else {
        NSLog(@"返回的数据JSON格式错误.");
    }
    
    LoginResponse *response = (LoginResponse *)[[IqPacketFactory getInstance] parseReponsePacketByData:_responseString packetName:@"LoginResponse"];
    NSLog(@"response = %@", [response toJSON]);
    
}


@end

//
//  main.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserObject.h"
#import "UserMutableArray.h"
#import "AIIURLRequest.h"
#import "LoginRequest.h"
#import "IqPacketFactory.h"
#import "NewsListRequest.h"

#define WEB_ROOT @"http://124.172.242.74:8080/"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        // iOS中常用的四种数据持久化方法:属性列表、对象归档、SQLite3和Core Data
        // 以下是属性列表
//        NSString *str = [NSString stringWithFormat:@"NSUserDefaults => Hello World!"];
//        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//        [ud setObject:str forKey:@"key"];
//        NSLog(@"%@", [ud objectForKey:@"key"]);
        
//        NSString *urlString = @"http://124.172.242.74:8080/app/login.asp?";
//        NSURL *url = [NSURL URLWithString:urlString];
//        NSString *json = @"{\"username\":\"demo\", \"password\":\"123456\"}";
//        UserJSONModel *userJSONModel = [[UserJSONModel alloc] init];
//        userJSONModel = [userJSONModel initURL:url parameter:json timeout:60];
        
        NSError *error;
        NSString *str = @"{\"userName\":\"demo\",\"password\":\"99999\",\"sex\":1}";
        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];

        // 解包
        UserObject *userObject = [[UserObject alloc] init];
        [userObject setProperties:dic];
        NSLog(@"%@", userObject);
        NSLog(@"userName = %@", userObject.userName);
        NSLog(@"password = %@", userObject.password);
        NSLog(@"sex = %ld", userObject.sex);
        
        // 组包
        UserObject *userObject2 = [[UserObject alloc] init];
        userObject2.userName = @"jiemeng";
        userObject2.password = @"123456";
        userObject2.sex = SEXMale;
        NSMutableDictionary *properties = [[NSMutableDictionary alloc] init];
        [userObject2 getProperties:properties];
        NSLog(@"%@", properties);

        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:properties options:NSJSONWritingPrettyPrinted error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"json=%@", json);
        
        
        // 数组
        NSString *jsonArrayString = @"[{\"userName\":\"demo\",\"password\":\"99999\",\"sex\":1},{\"userName\":\"demo2\",\"password\":\"22222\",\"sex\":0}]";
        NSData *dataArray = [jsonArrayString dataUsingEncoding:NSUTF8StringEncoding];
        NSArray *array = [NSJSONSerialization JSONObjectWithData:dataArray options:NSJSONReadingMutableLeaves error:&error];

        // 解包
        UserMutableArray *userMutableArray = [[UserMutableArray alloc] init];
        [userMutableArray setProperties:array];
        NSLog(@"%@", userMutableArray);
        NSInteger count = userMutableArray.count;
        for (int i=0; i<count; i++) {
            UserObject *user = [userMutableArray objectAtIndex:i];
            NSLog(@"userName = %@", user.userName);
            NSLog(@"password = %@", user.password);
            NSLog(@"sex = %ld", user.sex);
        }
        
        // 组包
        UserMutableArray *userMutableArray2 = [[UserMutableArray alloc] init];
        UserObject *user1 = [[UserObject alloc] init];
        user1.userName = @"邓兴裕";
        user1.password = @"111111";
        user1.sex = SEXFemale;
        [userMutableArray2 addObject:user1];
        
        UserObject *user2 = [[UserObject alloc] init];
        user2.userName = @"李汉光";
        user2.password = @"222222";
        user2.sex = SEXMale;
        [userMutableArray2 addObject:user2];
        
        NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
        [userMutableArray getProperties:mutableArray];
        NSLog(@"%@", mutableArray);
        

        // LoginRequest
//        LoginRequest *requestPacket = (LoginRequest *)[[IqPacketFactory getInstance] getRequestPacketByName:@"LoginRequest"];
//        requestPacket.name = @"鲁铁辉";
//        requestPacket.password = @"123456";
//        NSString *requestJSON = [requestPacket toJSON];
//        NSLog(@"requestPacket = %@", requestJSON);
//        
//        NSString *urlString = @"http://www.aiitec.net/danny/LoginResponse.php?";
//        NSURL *aURL = [NSURL URLWithString:urlString];
//        AIIURLRequest *urlRequest = [[AIIURLRequest alloc] init];
//        [urlRequest initURL:aURL parameter:requestJSON timeout:60];
        
        // NewsListRequest
        NewsListRequest *requestPacket2 = (NewsListRequest *)[[IqPacketFactory getInstance] getRequestPacketByName:@"NewsListRequest"];
        requestPacket2.typeID = @"2";
        NSString *requestJSON2 = [requestPacket2 toJSON];
        NSLog(@"requestPacket2 = %@", requestJSON2);
        
        NSString *urlString2 = @"http://www.aiitec.net/danny/NewsListResponse.php?";
        NSURL *aURL2 = [NSURL URLWithString:urlString2];
        AIIURLRequest *urlRequest2 = [[AIIURLRequest alloc] init];
        [urlRequest2 initURL:aURL2 parameter:requestJSON2 timeout:60];

    }
    return 0;
}

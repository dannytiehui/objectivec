//
//  LoginResponse.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SysCommonResponse.h"

/*
	登录响应协议类
 */
@interface LoginResponse : SysCommonResponse

@property(nonatomic, copy) NSString *userID;

@end

/*
 注销响应协议类
 */
//@interface LogoutResponse : SysCommonResponse {
//	
//}
//
//@end


/*
 异常响应协议类
 */
@interface ExceptionResponse : SysCommonResponse {
	
}

@end

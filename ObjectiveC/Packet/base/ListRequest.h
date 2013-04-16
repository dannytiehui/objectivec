//
//  ListRequest.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IqPacket.h"

@interface ListRequest : IqPacket

@property (nonatomic, retain)NSString *currentPage;
@property (nonatomic, retain)NSString *perPageNums;
@property (nonatomic, retain)NSString *orderBy;
@property (nonatomic, retain)NSString *orderType;
@property (nonatomic, retain)NSString *searchKey;

@end

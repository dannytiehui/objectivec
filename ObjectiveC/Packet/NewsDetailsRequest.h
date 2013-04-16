//
//  NewsDetailsRequest.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IqPacket.h"

@interface NewsDetailsRequest : IqPacket

@property (nonatomic,retain)NSString *newsID;

@end


@interface AnnoucementDetailsRequest : NewsDetailsRequest 

@end

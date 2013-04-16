//
//  NewsDetailsRequest.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IqPacket.h"
#import "NewsDetailsItem.h"

@interface NewsDetailsResponse : IqPacket {
	NewsDetailsItem *newsDetailsItem;
}

@property (nonatomic,retain)NewsDetailsItem *newsDetailsItem;

- (void)getProperties:(NSMutableDictionary *)properties;
- (void)setProperties:(NSDictionary *)properties;

@end


@interface AnnoucementDetailsResponse : NewsDetailsResponse

@end

//
//  NewsListRequest.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListRequest.h"

@interface NewsListRequest : ListRequest

@property(nonatomic, retain) NSString *typeID;

@end


@interface NewsTypeListRequest : NewsListRequest 

@end

@interface AnnoucementListRequest : NewsListRequest 

@end


@interface AnnoucementTypeListRequest : NewsListRequest 

@end

//
//  NewsDetailsItem.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AttachmentCollection.h"

typedef enum{
    NewsTypeDefault = 0,
	NewsTypeAdministrative,         // 行政公告
    NewsTypeRulesAndRegulations,    // 规章制度
}NewsType;


@interface NewsDetailsItem : NSObject


@property(nonatomic,retain) NSString *newsID;
@property(nonatomic,retain) NSString *title;
@property(nonatomic,retain) NSString *sendUser;
@property(nonatomic,retain) NSString *sendTime;
@property(nonatomic,retain) NSString *content;
@property(nonatomic,retain) NSString *readNums;
@property(nonatomic,assign) BOOL isNew;
@property(nonatomic,retain) AttachmentCollection *attachmentCollection;
@property(nonatomic,assign) NewsType newsType;

//组包
- (void)getProperties:(NSMutableDictionary *)properties;

//解包
- (void)setProperties:(NSDictionary *)properties;

@end

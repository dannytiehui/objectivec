//
//  NewsListResponse.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "NewsListResponse.h"
#import "NewsDetailsItem.h"
#import "DataField.h"
#import "TableRow.h"
#import "TableRowCollection.h"
#import "DataItem.h"

@implementation NewsListResponse

- (id)init {
	if(self = [super init:@"NewsListResponse"]){
        _isNeedTranslate = YES;
	}
	return self;
}

- (void)translateDataTableToEntityList{
    if (dataTable != nil) {
        TableSchema *schema = dataTable.tableSchema;
        TableRowCollection *rowCollection = dataTable.tableRowCollection;
        DataField *field = nil;
        TableRow *row = nil;
        NewsDetailsItem *item = nil;
        for (int y=0; y<[rowCollection count];y++) {
            row = [rowCollection objectAtIndex:y];
            item = [[[NewsDetailsItem alloc] init] autorelease];
            [_entityList addObject:item];
            for (int i=0; i<[schema count]; i++) {
                field = [schema objectAtIndex:i];                
                if ([[field name] isEqualToString:@"id"]) {
                    item.newsID = [[row getDataItemByFieldName:@"id"] value];
                }
                else if([[field name] isEqualToString:@"title"]){
                    item.title = [[row getDataItemByFieldName:@"title"] value];
                }
                else if([[field name] isEqualToString:@"sendTime"]){
                    item.sendTime = [[row getDataItemByFieldName:@"sendTime"] value];
                }
                else if([[field name] isEqualToString:@"sendUser"]){
                    item.sendUser = [[row getDataItemByFieldName:@"sendUser"] value];
                }
                else if([[field name] isEqualToString:@"isNew"]){
                    item.isNew = [[[row getDataItemByFieldName:@"isNew"] value] boolValue];
                }
            }
        }
    }
    
}


@end


@implementation AnnoucementListResponse

- (id)init {
	if(self = [super init:@"AnnoucementListResponse"]){
	}
	return self;
}

@end

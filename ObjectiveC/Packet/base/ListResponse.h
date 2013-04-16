//
//  ListResponse.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IqPacket.h"
#import "DataTable.h"

@interface ListResponse : IqPacket {
    
    @protected
    NSUInteger totalNums;
	DataTable *dataTable;
    BOOL _isNeedTranslate; //内部数据转换
    NSMutableArray *_entityList;
    
}

@property(nonatomic, assign) NSUInteger totalNums;
@property(nonatomic, retain) DataTable *dataTable;
@property(nonatomic, assign) BOOL isNeedTranslate;
@property(nonatomic,readonly) NSMutableArray *entityList;

- (void)translateDataTableToEntityList;

@end

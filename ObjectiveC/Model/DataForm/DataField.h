//
//  DataField.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
	DataFieldTypeText = 0, //字符文本
	DataFieldTypeHtml, //html文本
	DataFieldTypeLink, //http地址
	DataFieldTypeTel, //固定电话
	DataFieldTypeMobile,//移动电话
	DataFieldTypeEmail,//邮箱
	DataFieldTypePic,//图片
	DataFieldTypeAddressBook //通讯录类型
}DataFieldType;

@interface DataField : NSObject {
	NSString *name;
	DataFieldType type;
	NSString *displayName;
	NSString *description;
	BOOL	  primaryKey;
}

@property (nonatomic,retain) NSString *name;
@property (nonatomic,assign) DataFieldType type;
@property (nonatomic,retain) NSString *displayName;
@property (nonatomic,retain) NSString *description;
@property (nonatomic,assign) BOOL primaryKey;

//组包
- (void)getProperties:(NSMutableDictionary *)properties;

//解包
- (void)setProperties:(NSDictionary *)properties;


@end

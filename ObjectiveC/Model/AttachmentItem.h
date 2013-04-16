//
//  AttachmentItem.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 zhnews. All rights reserved.
//

#import <Foundation/Foundation.h>

// Using UIWebView to display select document types:
// http://developer.apple.com/library/ios/#qa/qa1630/_index.html
typedef enum {
    FileTypeDefault = 0,
    FileTypePIC     = 1,    // PIC, PNG
    FileTypeAUDIO   = 2,    // m4a, wav
    FileTypeVEDIO   = 3,    //
    FileTypeDOCUMENT= 4     // doc, docx, xls, xlsx, ppt, rtf, txt
} FileType;


@interface AttachmentItem : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, assign) FileType type;
@property(nonatomic, strong) NSString *size;
@property(nonatomic, strong) NSString *href;


//组包
- (void)getProperties:(NSMutableDictionary *)properties;

//解包
- (void)setProperties:(NSDictionary *)properties;

@end

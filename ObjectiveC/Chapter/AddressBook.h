//
//  AddressBook.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-3-25.
//  Copyright (c) 2013年 zhnews. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AddressCard;

@interface AddressBook : NSObject <NSCoding>
{
    NSString *bookName;
    NSMutableArray *book;
}
@property ( copy, nonatomic ) NSString *bookName;
@property ( copy, nonatomic ) NSMutableArray *book;

-(id) initWithName: (NSString *) name;
-(void) addCard: (AddressCard *) theCard;
-(void) removeCard: (AddressCard *) theCard;
-(AddressCard *) lookup: (NSString *) theName;
-(void) sort;
-(int) entries;
-(void) list;
-(void) dealloc;

@end

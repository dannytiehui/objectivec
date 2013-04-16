//
//  AddressCard.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-3-25.
//  Copyright (c) 2013年 zhnews. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressCard : NSObject <NSCopying, NSCoding>
{
    NSString *name;
    NSString *email;
}

@property (copy, nonatomic) NSString *name, *email;

-(void) setName: (NSString *) theName andEmail: (NSString *) theEmail;
-(NSComparisonResult) compareNames: (id) element;
-(void) print;

//Additional methods for NSCopyingp protocol
-(AddressCard *) copyWithZone: (NSZone *) zone;
//-(void) retainName: (NSString *) theName andEmail: ( NSString *) theEmail;

@end

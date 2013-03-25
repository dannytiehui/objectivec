//
//  AddressCard.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-3-25.
//  Copyright (c) 2013年 zhnews. All rights reserved.
//

#import "AddressCard.h"

@implementation AddressCard

@synthesize name, email;

-(void) setName: (NSString *) theName andEmail: (NSString *) theEmail
{
    self.name = theName;
    self.email = theEmail;
}

-(NSComparisonResult) compareNames: (id) element
{
    return [name compare: [element name]];
}

-(void) print
{
    NSLog(@"====================================");
    NSLog(@"|                                           |");
    NSLog(@"|   %-37s   |", [name UTF8String]);
    NSLog(@"|   %-37s   |", [email UTF8String]);
    NSLog(@"|                                           |");
    NSLog(@"|                                           |");
    NSLog(@"|                                           |");
    NSLog(@"|                                           |");
    NSLog(@"|           O                       O       |");
    NSLog(@"====================================");
    
}

-(AddressCard *)copyWithZone:(NSZone *)zone
{
    return self;
}

-(void) encodeWithCoder: (NSCoder *) encoder
{
    [encoder encodeObject:name forKey: @"AddressCardName"];
    [encoder encodeObject:email forKey: @"AddressCardEmail"];
}

-(id) initWithCoder: (NSCoder *) decoder
{
    name = [[ decoder decodeObjectForKey: @"AddressCardName"] retain];
    email = [[ decoder decodeObjectForKey: @"AddressCardEmail"] retain];
    
    return self;
}

@end

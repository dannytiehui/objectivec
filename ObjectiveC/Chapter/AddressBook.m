//
//  AddressBook.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-3-25.
//  Copyright (c) 2013年 zhnews. All rights reserved.
//

#import "AddressBook.h"
#import "AddressCard.h"

@implementation AddressBook

@synthesize bookName, book;

- (void)dealloc
{
    [bookName release];
    bookName = nil;
    [book release];
    book = nil;
    [super dealloc];
}

-(id) initWithName: (NSString *) name
{
    self = [super init];
    if (self) {
        bookName = [[NSString alloc] initWithString: name];
        book = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) addCard: (AddressCard *) theCard
{
    [book addObject:theCard];
}

-(void) removeCard: (AddressCard *) theCard
{
    [book removeObjectIdenticalTo: theCard];
}

-(AddressCard *) lookup: (NSString *) theName
{
    for (AddressCard *nextCard in book)
        if ( [[nextCard name] caseInsensitiveCompare: theName] == NSOrderedSame)
            return nextCard;
    
    return nil;
}

-(void) sort
{
    [book sortUsingSelector: @selector (compareNames:)];
}

-(int) entries
{
    NSNumber * number = [NSNumber numberWithLong:[book count]];
    return [number intValue];
    //return [book count];
}

-(void) list
{
    NSLog(@"=========  Contents of: %@  =========", bookName);
    
    for (AddressCard *theCard in book)
        NSLog(@"%-20s %-32s", [theCard.name UTF8String], [theCard.email UTF8String]);
    
    
    NSLog(@"=====================================================");
    
}


-(void) encodeWithCoder: (NSCoder *) encoder
{
    [encoder encodeObject: bookName forKey: @"AddressBookBookName"];
    [encoder encodeObject: book forKey: @"AddressBookBook"];
    
}

-(id) initWithCoder: (NSCoder *) decoder
{
    bookName = [[decoder decodeObjectForKey: @"AddressBookBookName"]retain];
    book = [[decoder decodeObjectForKey: @"AddressBookBook"]retain];
    
    return self;
}

@end

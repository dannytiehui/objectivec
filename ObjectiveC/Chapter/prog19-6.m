//
//  main.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-3-25.
//  Copyright (c) 2013年 zhnews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddressBook.h"
#import "AddressCard.h"

#warning 把代码拷贝到main.m文件, 然后把"main_19_6"改为"main"即可运行
int main_19_6(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        NSString *aName = @"Julia Kochan";
        NSString *aEmail = @"jewls337@axlc.com";
        NSString *bName = @"Tony Iannino";
        NSString *bEmail = @"Tony.Iannino@techfitness.com";
        NSString *cName = @"Steven Kochan";
        NSString *cEmail = @"steve@steve_kochan.com";
        NSString *dName = @"Jamie Baker";
        NSString *dEmail = @"jbaker@hitmail.com";
        AddressCard *card1 = [[ AddressCard alloc] init];
        AddressCard *card2 = [[ AddressCard alloc] init];
        AddressCard *card3 = [[ AddressCard alloc] init];
        AddressCard *card4 = [[ AddressCard alloc] init];
        
        AddressBook *myBook = [AddressBook alloc];
        // Fist set up 4 address cards
        [card1 setName: aName andEmail: aEmail];
        [card2 setName: bName andEmail: bEmail];
        [card3 setName: cName andEmail: cEmail];
        [card4 setName: dName andEmail: dEmail];
        
        [myBook initWithName: @"Steve's Address Book"];
        
        // Add some cards to the address book
        
        [myBook addCard: card1];
        [myBook addCard: card2];
        [myBook addCard: card3];
        [myBook addCard: card4];
        
        [myBook sort];
        
        //编码方法和解码方法
        if ( [NSKeyedArchiver archiveRootObject: myBook toFile:@"addressbook.arch"] == NO)
            NSLog(@"archiving failed");
        
        [card1 release];
        [card2 release];
        [card3 release];
        [card4 release];
        
        // 读取归档文件
        AddressBook * myAddressBook = [NSKeyedUnarchiver unarchiveObjectWithFile:@"addressbook.arch"];
        [myAddressBook list];
        
    }
    return 0;
}


//
//  main.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-3-25.
//  Copyright (c) 2013年 zhnews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Foo.h"
#import "AddressBook.h"
#import "AddressCard.h"

#warning 把代码拷贝到main.m文件, 然后把"main_19_9"改为"main"即可运行
int main_19_9(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        Foo * myFoo1 = [[Foo alloc] init];
        NSMutableData * dataArea;
        NSKeyedArchiver * archiver;
        AddressBook * myBook;
        
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
        
        myBook = [AddressBook alloc];
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
        [myBook list];
        
        [myFoo1 setIntVal:12345];
        [myFoo1 setFloatVal:98.6];
        [myFoo1 setStrVal:@"This is the string"];
        
        // 使用NSData创建自定义档案
        // Set up data area and connect it to an NSKeyedArchiver object
        dataArea = [NSMutableData data];
        archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:dataArea];
        
        // Now we can begin to archive objects
        [archiver encodeObject:myBook forKey:@"mybook"];
        [archiver encodeObject:myFoo1 forKey:@"myfoo1"];
        [archiver finishEncoding];
        
        if ([dataArea writeToFile:@"myArchive" atomically:YES] == NO) {
            NSLog(@"Archiving failed! ");
        }
        
        [archiver release];
        [myFoo1 release];
        [card1 release];
        [card2  release];
        [card3  release];
        [card4  release];
        [myBook release];
        
        // 读取NSData创建的自定义档案
        NSKeyedUnarchiver * unarchiver;
        NSData * data;
        Foo * foo;
        AddressBook * addressBook;
        
        data = [NSData dataWithContentsOfFile:@"myArchive"];
        if (!data) {
            NSLog(@"Can't read back archive file!");
            return 1;
        }
        
        unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        // Decode the objects we previously stored in the archive
        addressBook = [unarchiver decodeObjectForKey:@"mybook"];
        foo = [unarchiver decodeObjectForKey:@"myfoo1"];
        [unarchiver finishDecoding];
        
        // verify that the restore was successful
        [addressBook list];
        NSLog(@"\n%@\n%i\n%g", [ foo strVal], [foo intVal], [foo floatVal]);
        
        [unarchiver release];
        
    }
    return 0;
}



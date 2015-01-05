//
//  SetCardMatchingGame.m
//  set
//
//  Created by Administrator on 9/18/14.
//  Copyright (c) 2014 Elec 446. All rights reserved.
//

#import "SetCardMatchingGame.h"
#import "SetCard.h"

@implementation SetCardMatchingGame

- (NSString *)matchMode
{
    return @"3";
}

- (SetCard *)cardAtIndex:(NSUInteger)index
{
    return (index<[self.cards count]) ? self.cards[index] : nil;
}

@end

//
//  PlayingCardMatchingGame.m
//  set
//
//  Created by Administrator on 9/18/14.
//  Copyright (c) 2014 Elec 446. All rights reserved.
//

#import "PlayingCardMatchingGame.h"
#import "PlayingCard.h"

@implementation PlayingCardMatchingGame
- (NSString *)matchMode
{
        return @"2";
}

- (PlayingCard *)cardAtIndex:(NSUInteger)index
{
    return (index<[self.cards count]) ? self.cards[index] : nil;
}

@end

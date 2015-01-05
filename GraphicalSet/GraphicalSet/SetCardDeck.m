//
//  SetCardDeck.m
//  set
//
//  Created by Administrator on 9/18/14.
//  Copyright (c) 2014 Elec 446. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck
- (instancetype)init
{
    self = [super init];
    
    if(self) {
        // Create 81 cards, one of each possible combination of color, pattern, shape and number
        for (NSInteger color = 0 ; color < [SetCard maxColor] ; color++ )  {
            for (NSInteger shape = 0 ; shape < [SetCard maxShape] ; shape++ )  {
                for (NSInteger pattern = 0 ; pattern < [SetCard maxFill] ; pattern++ ) {
                    for (NSInteger number = 0 ; number < [SetCard maxNumber] ; number++ ) {
                        SetCard *card   = [[SetCard alloc] init];
                        card.color      = color;
                        card.fill    = pattern;
                        card.shape      = shape;
                        card.number     = number;
                        
                        [self addCard:card];
                    }
                }
            }
        }
    }
    return self;
}
@end

//
//  Card.m
//  Matchismo1
//
//  Created by Taylor E Vaughn on 9/2/14.
//  Copyright (c) 2014 Elec 446. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToAttributedString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end

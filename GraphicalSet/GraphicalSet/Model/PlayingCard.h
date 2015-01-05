//
//  PlayingCard.h
//  Matchismo1
//
//  Created by Taylor E Vaughn on 9/2/14.
//  Copyright (c) 2014 Elec 446. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end

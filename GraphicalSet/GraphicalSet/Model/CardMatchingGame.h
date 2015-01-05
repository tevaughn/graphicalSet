//
//  CardMatchingGame.h
//  Matchismo1
//
//  Created by Taylor E Vaughn on 9/9/14.
//  Copyright (c) 2014 Elec 446. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject
@property (strong, nonatomic) Deck* deck;
@property (nonatomic, strong) NSMutableArray *cards; // of Card

// designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
- (void)chooseCard:(Card* )card;
- (Card *)cardAtIndex:(NSUInteger)index;
- (NSString *)matchMode;

@property (nonatomic, readonly) NSInteger score;

@end

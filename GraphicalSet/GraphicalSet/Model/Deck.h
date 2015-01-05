//
//  Deck.h
//  Matchismo1
//
//  Created by Taylor E Vaughn on 9/2/14.
//  Copyright (c) 2014 Elec 446. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;
- (NSUInteger)cardsInDeck;

@end

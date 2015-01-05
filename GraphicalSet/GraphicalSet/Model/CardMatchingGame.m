//
//  CardMatchingGame.m
//  Matchismo1
//
//  Created by Taylor E Vaughn on 9/9/14.
//  Copyright (c) 2014 Elec 446. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}


- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        if(!_deck){
            _deck = deck;
        }
        for (int i = 0; i < count; i++) {
            Card *card = [self.deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
        
    }
    
    return self;
    
}



- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index<[self.cards count]) ? self.cards[index] : nil;
}


- (NSString *)matchMode
{
    return nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;


/*- (void) chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    NSMutableArray *chosenCards = [[NSMutableArray alloc] init]; // of card
    NSMutableAttributedString *chosenCardsContents  = [[NSMutableAttributedString alloc] init];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            // If already chosen, unchoose
            card.chosen = NO;
        } else {
            [chosenCards addObject:card];
            [chosenCardsContents appendAttributedString:(NSAttributedString *)card.contents];
            
            // match against other chosen cards
            for (Card *otherCard in self.cards) {
                
                // look for chosen unmatched cards
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [chosenCards addObject:otherCard];
                    [chosenCardsContents appendAttributedString:(NSAttributedString *)otherCard.contents];
                    
                    // If we've chosen the right number of cards for the game mode
                    if ([[self matchMode] isEqualToString:[NSString stringWithFormat:@"%lu", (unsigned long)chosenCards.count]]) {
                        int matchScore = [card match:chosenCards];
                        
                        // if we matched, increase score and mark cards as matched
                        if (matchScore) {
                            self.score += matchScore * MATCH_BONUS;
 
                            NSMutableAttributedString *result = [[NSMutableAttributedString alloc] initWithString:@"Matched: "];
                            [result appendAttributedString:(NSAttributedString *) chosenCardsContents];
                            [result appendAttributedString:(NSAttributedString *)
                                    [[NSMutableAttributedString alloc] initWithString:
                                     [NSString stringWithFormat:@" +%d pts!\n", matchScore * MATCH_BONUS ]]];
                            
                            self.result = result;
                            for (Card *cards in chosenCards) {
                                cards.matched = YES;
                            }
                        // else, unchoose all cards and subtract penalty
                        } else {
                            self.score -= MISMATCH_PENALTY;
                            NSMutableAttributedString *result = [[NSMutableAttributedString alloc] initWithString:@"No Match: "];
                            [result appendAttributedString:(NSAttributedString *) chosenCardsContents];
                            [result appendAttributedString:(NSAttributedString *)
                             [[NSMutableAttributedString alloc] initWithString:
                              [NSString stringWithFormat:@" -%d pts!\n", MISMATCH_PENALTY ]]];
                            self.result = result;
                            for (Card *cards in chosenCards) {
                                cards.chosen = NO;
                            }
                        }
                    }                    
                }
            }
            [self.history appendAttributedString:self.result];
            
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}
 
 

*/
- (void) chooseCard:(Card* )card
{
    NSMutableArray *chosenCards = [[NSMutableArray alloc] init]; // of card
    
    if (!card.isMatched) {
        if (card.isChosen) {
            // If already chosen, unchoose
            card.chosen = NO;
        } else {
            [chosenCards addObject:card];
            
            // match against other chosen cards
            for (Card *otherCard in self.cards) {
                
                // look for chosen unmatched cards
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [chosenCards addObject:otherCard];
                    
                    // If we've chosen the right number of cards for the game mode
                    if ([[self matchMode] isEqualToString:[NSString stringWithFormat:@"%lu", (unsigned long)chosenCards.count]]) {
                        int matchScore = [card match:chosenCards];
                        
                        // if we matched, increase score and mark cards as matched
                        if (matchScore) {
                            self.score += matchScore * MATCH_BONUS;
                            
                            for (Card *cards in chosenCards) {
                                cards.matched = YES;
                            }
                            // else, unchoose all cards and subtract penalty
                        } else {
                            self.score -= MISMATCH_PENALTY;
                            for (Card *cards in chosenCards) {
                                cards.chosen = NO;
                            }
                        }
                    }
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}


@end

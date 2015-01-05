//
//  PlayingCard.m
//  Matchismo1
//
//  Created by Taylor E Vaughn on 9/2/14.
//  Copyright (c) 2014 Elec 446. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    for (PlayingCard *firstCard in otherCards) {
        for (PlayingCard *secondCard in otherCards) {
            // Check each card against each other card
            // Because we double check, we get exponentially increased scores for each mulitple
            if (firstCard != secondCard) {
                if (firstCard.rank == secondCard.rank) {
                    score += 4;
                } else if (firstCard.suit == secondCard.suit) {
                    score += 1;
                }
            }
        }
    }
    return score;
}

- (NSMutableAttributedString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [[NSMutableAttributedString alloc] initWithString:[rankStrings[self.rank] stringByAppendingString:self.suit]];
}

@synthesize suit = _suit; // because we provide setter and getter

+ (NSArray *)validSuits
{
    return @[@"♥️",@"♠️",@"♦️",@"♣️"];
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank { return [[self rankStrings] count]-1; }

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}
@end

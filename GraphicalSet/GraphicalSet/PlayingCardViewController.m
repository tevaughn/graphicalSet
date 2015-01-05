//
//  PlayingCardViewController.m
//  GraphicalSet
//
//  Created by Administrator on 9/23/14.
//  Copyright (c) 2014 Rice University. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardView.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface PlayingCardViewController ()
@property (nonatomic) BOOL inited;
@end

@implementation PlayingCardViewController

- (void)setCardValues
{
    if ([self.card isKindOfClass:[PlayingCard class]]) {
        ((PlayingCard*)self.cardView).rank = ((PlayingCard *)self.card).rank;
        ((PlayingCard*)self.cardView).suit = ((PlayingCard *)self.card).suit;
    }
}

- (PlayingCardView *)newCardView
{
    PlayingCardView* cardView = [[PlayingCardView alloc] initWithFrame:((CardViewController*)self.controller.deckViewController).cardView.frame];
    cardView.faceUp = NO;
    return cardView;
    
}


@end

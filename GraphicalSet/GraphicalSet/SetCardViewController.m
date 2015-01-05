//
//  SetCardViewController.m
//  GraphicalSet
//
//  Created by Administrator on 9/23/14.
//  Copyright (c) 2014 Rice University. All rights reserved.
//

#import "SetCardViewController.h"
#import "SetCardView.h"
#import "SetCardDeck.h"
#import "SetCard.h"
#import "SetCardMatchingGame.h"

@interface SetCardViewController ()

@end

@implementation SetCardViewController

- (void)setCardValues
{
    if ([self.card isKindOfClass:[SetCard class]]) {
        ((SetCard*)self.cardView).color     = ((SetCard *)self.card).color;
        ((SetCard*)self.cardView).fill   = ((SetCard *)self.card).fill;
        ((SetCard*)self.cardView).shape     = ((SetCard *)self.card).shape;
        ((SetCard*)self.cardView).number    = ((SetCard *)self.card).number;

    }
}

- (SetCardView *)newCardView
{
    // initlize new card in deck posistion
     SetCardView* cardView = [[SetCardView alloc] initWithFrame:((CardViewController*)self.controller.deckViewController).cardView.frame];
    cardView.faceUp = NO;
    return cardView;
}

@end

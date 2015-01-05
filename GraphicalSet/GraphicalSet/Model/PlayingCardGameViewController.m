//
//  PlayingCardGameViewController.m
//  set
//
//  Created by Administrator on 9/18/14.
//  Copyright (c) 2014 Elec 446. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardViewController.h"
#import "PlayingCardMatchingGame.h"
#import "PlayingCardView.h"
#import "PlayingCardDeck.h"
#import "PlayingDiscardCardViewController.h"
#import "PlayingCard.h"

@interface PlayingCardGameViewController ()

@end


@implementation PlayingCardGameViewController

#pragma - GAME
- (PlayingCardMatchingGame *)newGame
{
        return [[PlayingCardMatchingGame alloc] initWithCardCount:[self initialNumberOfCards]
                                                        usingDeck:[[PlayingCardDeck alloc] init]];
}

#pragma - INITIALIZATION

// Pass in game
-(void)addCardViewControllerWithCard:(PlayingCard *)card
{
    [self.cardViewControllers addObject:[self createCardViewControllerWithCard:card]];
}

- (PlayingCardViewController *)createCardViewControllerWithCard:(PlayingCard *)card
{
    return [[PlayingCardViewController alloc] initCardViewControllerWithController:self AndCard:card InView:self.cardGameView];
}

- (PlayingDiscardCardViewController *)createDiscardCardViewController
{
    return nil;//[[PlayingDiscardCardViewController alloc] initCardViewControllerWithController:self AndCard:nil InView:self.cardGameView];
}

- (void)checkIfChosenForCard:(PlayingCard*)card AndView:(PlayingCardView*)view
{
    // If we are flipped the wrong way, flip
    if ( view.faceUp != card.isChosen) {
        view.faceUp = card.isChosen;
        view.flip = YES;
    }
}


#pragma - ATTRIBUTES

- (NSAttributedString *)titleForCard:(Card *)card {
    return card.isChosen ? card.contents : [[NSMutableAttributedString alloc] initWithString:@""];
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

#define INITIAL_NUMBER_OF_PLAYING_CARDS 30
- (NSUInteger)initialNumberOfCards {
    return INITIAL_NUMBER_OF_PLAYING_CARDS;
}

static const CGFloat aspectRatio = (CGFloat)CARD_WIDTH / (CGFloat)CARD_HEIGHT;
- (CGFloat)cardAspectRatio {
    return aspectRatio;
}


@end


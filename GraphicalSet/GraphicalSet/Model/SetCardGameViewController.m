//
//  SetCardGameViewController.m
//  set
//
//  Created by Administrator on 9/18/14.
//  Copyright (c) 2014 Elec 446. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetCardViewController.h"
#import "SetCardView.h"
#import "SetCardMatchingGame.h"
#import "SetCardDeck.h"
#import "SetCard.h"
#import "SetDiscardCardViewController.h"
#import "SetDeckCardViewController.h"

@interface SetCardGameViewController ()

@end


@implementation SetCardGameViewController

#pragma - GAME
- (SetCardMatchingGame *)newGame
{
    return [[SetCardMatchingGame alloc] initWithCardCount:[self initialNumberOfCards]
                                                 usingDeck:[[SetCardDeck alloc] init]];
}

#pragma - INITIALIZATION

// Pass in game
-(void)addCardViewControllerWithCard:(SetCard *)card
{
    [self.cardViewControllers addObject:[self createCardViewControllerWithCard:card]];
}


- (SetCardViewController *)createCardViewControllerWithCard:(SetCard *)card
{
    return [[SetCardViewController alloc] initCardViewControllerWithController:self AndCard:card InView:self.cardGameView];
}

- (SetDiscardCardViewController *)createDiscardCardViewController
{
    return nil;//[[SetDiscardCardViewController alloc] initCardViewControllerWithController:self AndCard:nil InView:self.cardGameView];
}

- (SetDeckCardViewController *)createDeckCardViewController
{
    return [[SetDeckCardViewController alloc] initCardViewControllerWithController:self AndCard:nil InView:self.cardGameView];
}

-(void)ifFaceUpOrHighlightedForView:(SetCardView*)view
{
    [super ifFaceUpOrHighlightedForView:view];
    view.highlight = NO;

}

- (void)ifFaceDownForView:(CardView*)view
{
    if (!view.faceUp)
    {
        view.faceUp = YES;
        view.flip = YES;
    }
}

#pragma - ATTRIBUTES

- (NSAttributedString *)titleForCard:(Card *)card {
    return card.contents;
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:@"cardfront"];
}

#define INITIAL_NUMBER_OF_PLAYING_CARDS 12
- (NSUInteger)initialNumberOfCards {
    return INITIAL_NUMBER_OF_PLAYING_CARDS;
}

//static const CGFloat aspectRatio = (CGFloat)CARD_HEIGHT / (CGFloat)CARD_WIDTH;
static const CGFloat aspectRatio = (CGFloat)CARD_WIDTH / (CGFloat)CARD_HEIGHT;
- (CGFloat)cardAspectRatio {
    return aspectRatio;
}


@end

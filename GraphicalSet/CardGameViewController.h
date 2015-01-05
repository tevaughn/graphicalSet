//
//  CardGameViewController.h
//  GraphicalSet
//
//  Created by Administrator on 9/30/14.
//  Copyright (c) 2014 Rice University. All rights reserved.
//
//  Creates a deck and passes to game
//  Owns view controller for each card

#import <UIKit/UIKit.h>
#import "CardView.h"
#import "CardMatchingGame.h"
#import "Deck.h"
#import "grid.h"

@interface CardGameViewController : UIViewController

#define CARD_HEIGHT 3.5
#define CARD_WIDTH  2.5


@property (weak, nonatomic) IBOutlet UIView *cardGameView;
@property (strong, nonatomic) CardMatchingGame* game;
@property (strong, nonatomic) Grid* cardGrid;

// Views
@property (strong, nonatomic) NSMutableArray* cardViewControllers; //of type cardViewController
@property (strong,nonatomic) id deckViewController;
@property (strong,nonatomic) id discardViewController;

@property (strong,nonatomic) UIDynamicAnimator *animator;
@property (nonatomic) BOOL isCollected;
@property (nonatomic) BOOL gameDealt;

- (NSUInteger)initialNumberOfCards;
- (CGFloat)cardAspectRatio;

- (CardMatchingGame *)newGame;
- (void)addCardViewControllerWithCard:(Card *)card;
- (id)createCardViewControllerWithCard:(Card *)card;
- (void)checkForUpdates;
- (void)checkIfChosenForCard:(Card*)card AndView:(CardView*)view;
- (void)ifFaceUpOrHighlightedForView:(CardView*)view;
- (void)ifFaceDownForView:(CardView*)view;
- (void)newCardAtIndex:(NSUInteger)index;
- (void)posistionCards;

- (Deck *)createDeck;
- (NSAttributedString *)titleForCard:(Card *)card;
- (UIImage *)backgroundImageForCard:(Card *)card;

@end

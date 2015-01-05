//
//  CardGameViewController.m
//  GraphicalSet
//
//  Created by Administrator on 9/30/14.
//  Copyright (c) 2014 Rice University. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardViewController.h"
#import "DeckCardViewController.h"
#import "SetDiscardCardViewController.h"
#import "PlayingDiscardCardViewController.h"
#import "DeckCardView.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UIButton *redealButton;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation CardGameViewController

#pragma - GAME
@synthesize game = _game;

- (CardMatchingGame *)game
{
    if (!_game) {
        _game = [self newGame];
        
        // Create a deck and discard pile
        if (!_deckViewController) {
            self.deckViewController = [self createDeckCardViewController];
        }
        
        ((DeckCardView*)((DeckCardViewController*)self.deckViewController).cardView).cardsInDeck = [self.game.deck cardsInDeck] ? YES : NO;
        
        //self.discardViewController = [self createDiscardCardViewController];
        
        // Allocate array of view controllers
        if (!_cardViewControllers) {
            _cardViewControllers = [[NSMutableArray alloc] init];
        }
        
        [self posistionDeck];
        
        // Create a controller for each intial card
        for ( NSUInteger controllerCount = 0 ; controllerCount < [self initialNumberOfCards] ; controllerCount++ ) {
            [self addCardViewControllerWithCard:
             (Card *)[self.game.cards objectAtIndex:controllerCount]];
            
            ((CardViewController*)[self.cardViewControllers objectAtIndex:controllerCount]).cardView.frame = ((CardViewController*)self.deckViewController).cardView.frame;
        }
        
        // Set our score
        self.scoreLabel.text = [[NSString alloc] initWithFormat:@"Score: %ld", (long)self.game.score];
        
    }
    return _game;
    
}

- (CardMatchingGame *)newGame
{
    return nil;
}

- (void)killGame
{
    _game = nil;
    
    // If we have dealt cards, gather them and redeal
    if (self.gameDealt){
        for (CardViewController* controller in self.cardViewControllers ) {
            [self ifFaceUpOrHighlightedForView:controller.cardView];
            //[self ifFaceUpOrHighlightedForView:((CardViewController*)self.discardViewController).cardView];
            [UIView animateWithDuration:1.0
                                  delay:0.5
                                options:UIViewAnimationOptionBeginFromCurrentState
                             animations:^{ controller.cardView.frame = ((CardViewController*)self.deckViewController).cardView.frame;
                             }
                             completion:^(BOOL fin){
                                 if (fin) [controller.cardView removeFromSuperview];
                             }];
        }
    }
        ((CardViewController*)self.deckViewController).cardView.frame = [self.cardGrid frameOfCellAtRow:0 inColumn:0];
    
        self.cardViewControllers = nil;
        self.deckViewController = nil;
        self.discardViewController = nil;
        [[self.cardGameView subviews]makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self game];
        [self posistionCards];
        self.gameDealt = YES;
}

-(void)ifFaceUpOrHighlightedForView:(CardView*)view
{
    if ( view.faceUp ) {
        view.faceUp = NO;
        view.flip = YES;
    }
}

- (void)ifFaceDownForView:(CardView*)view
{
    
}

- (IBAction)redealGame:(id)redealButton
{
    [self killGame];
}


#pragma - INITIALIZATION

-(void)viewDidLoad
{
    self.gameDealt = NO;
    [super viewDidLoad];
    // Create game
    self.game = [self game];

}

- (void)posistionDeck{
    // Create the grid for card views
    [self initGrid];
    ((CardViewController*)self.deckViewController).cardView.frame = [self.cardGrid frameOfCellAtRow:0 inColumn:0];
    self.cardGrid = nil;
}

- (void)posistionCards
{
    // Create the grid for card views
    [self initGrid];
    NSInteger cardCount = 0;
    // The first row is for our discards and deck
    for ( NSInteger rowCount = 1 ; rowCount < [self.cardGrid rowCount] ; rowCount++ ) {
        for ( NSInteger columnCount = 0 ; columnCount < [self.cardGrid columnCount] ; columnCount++ ) {
            
            // If we still have cards to posistion
            if ( cardCount < self.cardViewControllers.count ) {
                __weak CardView* view = ((CardViewController*)[self.cardViewControllers objectAtIndex:cardCount]).cardView;
                
                [self.cardGameView bringSubviewToFront:view];
                
                [UIView animateWithDuration:1.0
                                      delay:0.0
                                    options:UIViewAnimationOptionBeginFromCurrentState
                                 animations:^{ ((CardViewController*)[self.cardViewControllers objectAtIndex:cardCount]).cardView.frame = [self.cardGrid frameOfCellAtRow:(rowCount) inColumn:columnCount]; }
                                 completion:^(BOOL fin){
                                     if (fin)
                                    // Make sure set cards are always face up
                                     [self ifFaceDownForView:view];
                                 }];
            }
            cardCount++;
        }
    }
    // Put the deck at the top
    [self.cardGameView bringSubviewToFront:((CardViewController*)self.deckViewController).cardView];
    [UIView animateWithDuration:1.0
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         ((CardViewController*)self.deckViewController).cardView.frame = [self.cardGrid frameOfCellAtRow:0 inColumn:0];
                         //((CardViewController*)self.discardViewController).cardView.frame = [self.cardGrid frameOfCellAtRow:0 inColumn:self.cardGrid.columnCount - 1];
                     }
                     completion:nil];
    
    ;
    ((DeckCardView*)((DeckCardViewController*)self.deckViewController).cardView).cardsInDeck = [self.game.deck cardsInDeck];
    // Deallocate grid
    self.cardGrid = nil;
}

- (void)addCardViewControllerWithCard:(Card *)card
{
    
}
                        
- (CardViewController *)createCardViewControllerWithCard:(Card *)card
{
    return nil;
}

- (DeckCardViewController *)createDeckCardViewController
{
    return [[DeckCardViewController alloc] initCardViewControllerWithController:self AndCard:nil InView:self.cardGameView];
}

- (CardViewController *)createDiscardCardViewController
{
    return nil;
}


- (Deck *)createDeck
{
    return nil;
}

// Initalize the grid for card views
- (void)initGrid
{
    if (!_cardGrid) {
        self.cardGrid = [[Grid alloc] init];
    }
    [self.cardGrid setSize:self.cardGameView.bounds.size];
    [self.cardGrid setCellAspectRatio:[self cardAspectRatio]];
    [self.cardGrid setMinimumNumberOfCells:self.game.cards.count];
    
    
}

- (void)checkIfChosenForCard:(Card*)card AndView:(CardView*)view
{
    view.highlight = card.isChosen;
}

- (void)checkForUpdates
{
    BOOL weDidMatch = NO;
    // If a card is matched, wait and then take off-screen
    for (NSUInteger cardCount = 0 ; cardCount < [self.game.cards count] ; cardCount++ )
    {
        __weak CardGameViewController* weakSelf = self;
        
        CardViewController* controller = ((CardViewController*)[self.cardViewControllers objectAtIndex:cardCount]);
        __weak CardView* view = controller.cardView;

        Card* card = ((Card*)[self.game.cards objectAtIndex:cardCount]);
        
        [self checkIfChosenForCard:card AndView:view];
        
        if (card.isMatched) {
            weDidMatch = YES;
            [self.cardGameView bringSubviewToFront:view];
            [UIView animateWithDuration:2.0
                                  delay:0.0
                                options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction
                             animations:^{ view.frame = CGRectMake(500, 0, view.bounds.size.width, view.bounds.size.height);
                             }
                             completion:^(BOOL fin) { if (fin)
                                 [weakSelf newCardAtIndex:cardCount];
                                 self.scoreLabel.text = [[NSString alloc] initWithFormat:@"Score: %ld", (long)self.game.score];
                             }];
            
        }
        
    }
    
    if(!weDidMatch) {
        self.scoreLabel.text = [[NSString alloc] initWithFormat:@"Score: %ld", (long)self.game.score];
    }
    
    ((DeckCardView*)((DeckCardViewController*)self.deckViewController).cardView).cardsInDeck = [self.game.cards count] ? YES : NO;
}

- (void)newCardAtIndex:(NSUInteger)index
{
    CardViewController* controller = ((CardViewController*)[self.cardViewControllers objectAtIndex:index]);
    CardView* view = controller.cardView;
    
    // Give the discard pile the right card
    //((CardViewController*)self.discardViewController).card = controller.card;
    //[((CardViewController*)self.discardViewController) setCardValues];
    
    if ([self.game.deck cardsInDeck] && ([self.game.cards count] <= [self initialNumberOfCards])) {
        // replace the card
        [self.game.cards replaceObjectAtIndex:index withObject:[self.game.deck drawRandomCard]];
        [self.cardViewControllers replaceObjectAtIndex:index withObject:[self createCardViewControllerWithCard:((Card*)[self.game.cards objectAtIndex:index])]];
    } else {
        [self.game.cards removeObjectAtIndex:index];
        [self.cardViewControllers removeObjectAtIndex:index];
    }
    [self posistionCards];
    [view removeFromSuperview];
}

- (IBAction)handlePinch:(UIPinchGestureRecognizer *)sender
{
    // Create dynamic animation
    if (!_animator)
    {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.cardGameView];
    }

    if (!self.isCollected){
        for (CardView* view in self.cardGameView.subviews) {
            // Create behavior
            if (![view isKindOfClass:[DeckCardView class]]) {
                [self ifFaceUpOrHighlightedForView:view];
                
                UIAttachmentBehavior* collect = [[UIAttachmentBehavior alloc] initWithItem:view attachedToAnchor:self.cardGameView.center];
                
                CGPoint center = [view convertPoint:CGPointMake(view.bounds.origin.x + view.bounds.size.width / 2, view.bounds.origin.y + view.bounds.size.height / 2)  toView:self.cardGameView];
                
                collect.length = sqrt(powf(collect.anchorPoint.x -
                      center.x, 2.0) +
                     powf(collect.anchorPoint.y -
                          center.y, 2.0));
                
                [UIView animateWithDuration:.5
                                      delay:0
                                    options:UIViewAnimationOptionBeginFromCurrentState
                                 animations:^{
                                     view.intialLength = collect.length;
                                     [self.animator addBehavior:collect];
                                 }
                                 completion:nil];
                
                
            }
        
        }
        self.isCollected = YES;
        [self.cardGameView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)]];
    }
    else
    {
        NSUInteger viewCount = 0;
        for (CardView* view in self.cardGameView.subviews) {
            if (![view isKindOfClass:[DeckCardView class]]) {
                if ([sender scale] <= .10){
                    [UIView animateWithDuration:2.0
                                          delay:0.0
                                        options:UIViewAnimationOptionBeginFromCurrentState
                                     animations:^{
                                         ((UIAttachmentBehavior*)[self.animator.behaviors objectAtIndex:viewCount]).length = 0;
                                     }
                                     completion:nil];
                } else if ([sender scale] >= 1)
                {
                    [UIView animateWithDuration:.5
                                          delay:0
                                        options:UIViewAnimationOptionBeginFromCurrentState
                                     animations:^{
                                         ((UIAttachmentBehavior*)[self.animator.behaviors objectAtIndex:viewCount]).length = view.intialLength;
                                     }
                                     completion:nil];
                    self.isCollected = NO;
                    _animator = nil;
                } else
                {
                    [UIView animateWithDuration:.5
                                          delay:0
                                        options:UIViewAnimationOptionBeginFromCurrentState
                                     animations:^{
                                         ((UIAttachmentBehavior*)[self.animator.behaviors objectAtIndex:viewCount]).length = view.intialLength * [sender scale];
                                     }
                                     completion:nil];
                }
                
             viewCount++;
            }
           
        }
    }
    

}


- (IBAction)handlePan:(UIPanGestureRecognizer *)sender
{
    if (self.isCollected) {
        for (UIAttachmentBehavior* behavior in self.animator.behaviors)
        {
            [UIView animateWithDuration:4.0
                                  delay:0.0
                                options:UIViewAnimationOptionBeginFromCurrentState
                             animations:^{
                                 behavior.anchorPoint = [sender locationInView:self.cardGameView];
                             }
                             completion:nil];

        }
    }
}

#pragma - ATTRIBUTES

- (NSAttributedString *)titleForCard:(Card *)card {
    return nil;
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:@"cardfront"];
}

- (NSUInteger)initialNumberOfCards {
    return 0;
}

- (CGFloat)cardAspectRatio {
    return 0;
}

@end

//
//  CardViewController.m
//  Graphical Set
//
//  Created by Taylor Vaughn
//

#import "CardViewController.h"
#import "CardGameViewController.h"
@interface CardViewController ()

@end

@implementation CardViewController

- (IBAction)handleTap:(UITapGestureRecognizer *)sender
{
    if (self.controller.gameDealt) {
        if (self.controller.isCollected) {
            self.controller.isCollected = NO;
            self.controller.animator = nil;
            [self.controller posistionCards];
        } else {
            [self.controller.game chooseCard:self.card];
        }
        [self.controller checkForUpdates];
    }
    
}

- (void)setCardValues
{
    //
}

- (id)initCardViewControllerWithController:(CardGameViewController *)controller AndCard:(Card *)card InView:(UIView *)view
{
    self = [super init];
    if (self) {
        self.controller = controller;
        self.card = card;
    }
    // Create our cardView
    if (!_cardView) {
        _cardView = [self newCardView];
    }
    
    if (card) {
        self.cardView.hasCard = YES;
    }
    
    [self.cardView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)]];
    

    [self setCardValues];
    [view addSubview:self.cardView];
    [self.cardView setNeedsDisplay];
    
    return self;
}



-(CardView *)newCardView
{
    return nil;
}

@end

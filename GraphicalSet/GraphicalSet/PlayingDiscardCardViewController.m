//
//  PlayingDiscardCardViewController.m
//  GraphicalSet
//
//  Created by Administrator on 10/6/14.
//  Copyright (c) 2014 Rice University. All rights reserved.
//

#import "PlayingDiscardCardViewController.h"
#import "PlayingCardView.h"

@implementation PlayingDiscardCardViewController

- (IBAction)handleTap:(UITapGestureRecognizer *)sender
{
    // Do nothing
}

- (PlayingCardView *)newCardView
{
    // initlize new discard pile in discard posistion
    PlayingCardView* cardView = [[PlayingCardView alloc] initWithFrame:((CardViewController*)self.controller.discardViewController).cardView.frame];
    cardView.faceUp = YES;
    return cardView;
}


@end

//
//  DiscardCardViewController.m
//  GraphicalSet
//
//  Created by Administrator on 10/6/14.
//  Copyright (c) 2014 Rice University. All rights reserved.
//

#import "SetDiscardCardViewController.h"
#import "SetCardView.h"

@implementation SetDiscardCardViewController

- (IBAction)handleTap:(UITapGestureRecognizer *)sender
{
    // Do nothing
}

- (SetCardView *)newCardView
{
    // initlize new discard pile in discard posistion
    SetCardView* cardView = [[SetCardView alloc] initWithFrame:((CardViewController*)self.controller.discardViewController).cardView.frame];
    cardView.faceUp = YES;
    return cardView;
}

@end

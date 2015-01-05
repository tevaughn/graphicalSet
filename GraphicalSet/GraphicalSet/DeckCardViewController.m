//
//  DeckCardViewController.m
//  GraphicalSet
//
//  Created by Administrator on 10/6/14.
//  Copyright (c) 2014 Rice University. All rights reserved.
//

#import "DeckCardViewController.h"
#import "DeckCardView.h"

@interface DeckCardViewController()

@end

@implementation DeckCardViewController

- (IBAction)handleTap:(UITapGestureRecognizer *)sender
{
    
}


 - (DeckCardView *)newCardView
 {
     return [[DeckCardView alloc] initWithFrame:((DeckCardViewController*)self.controller.deckViewController).cardView.frame];
 }

@end
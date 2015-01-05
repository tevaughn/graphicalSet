//
//  SetSetCardViewController.m
//  GraphicalSet
//
//  Created by Administrator on 10/6/14.
//  Copyright (c) 2014 Rice University. All rights reserved.
//

#import "SetDeckCardViewController.h"
#import "SetCardViewController.h"

@implementation SetDeckCardViewController

- (IBAction)handleTap:(UITapGestureRecognizer *)sender
{
    if (self.controller.gameDealt) {
        // Add three new cards to the set game
        for ( NSInteger i = 0 ; i < 3 
     ; i++ )
        {
            [self.controller.game.cards addObject:[self.controller.game.deck drawRandomCard]];
            [self.controller.cardViewControllers addObject:
             [self.controller createCardViewControllerWithCard:
              [self.controller.game.cards lastObject]
              ]
             ];
            ((SetCardViewController*)[self.controller.cardViewControllers lastObject]).cardView.faceUp = NO;

        }
        [self.controller posistionCards];
    }
}

@end



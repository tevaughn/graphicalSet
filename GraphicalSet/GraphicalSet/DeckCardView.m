//
//  DeckCardView.m
//  GraphicalSet
//
//  Created by Administrator on 10/6/14.
//  Copyright (c) 2014 Rice University. All rights reserved.
//

#import "DeckCardView.h"

@implementation DeckCardView

- (void)setCardsInDeck:(BOOL)cardsInDeck
{
    _cardsInDeck = cardsInDeck;
    [self setNeedsDisplay];
}


 - (void)drawRect:(CGRect)rect {
 // Drawing code
 UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];
 
 [roundedRect addClip];
 
 if(self.cardsInDeck) {
     [[UIImage imageNamed:@"cardback"] drawInRect:self.bounds];
     [[UIColor blackColor] setStroke];
     [roundedRect stroke];
    }
    else {
     [self setAlpha:0.0];
    }
     
 }
 

@end

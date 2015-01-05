//
//  CardViewController.h
//  Graphical Set
//
//  Created by Taylor Vaughn.
//

#import <UIKit/UIKit.h>
#import "CardView.h"
#import "PlayingCardGameViewController.h"
#import "CardGameViewController.h"
#import "Card.h"

@interface CardViewController : UIViewController

@property (strong, nonatomic) CardView *cardView;
@property (strong, nonatomic) CardGameViewController *controller;
@property (strong, nonatomic) Card *card;

- (id)initCardViewControllerWithController:(CardGameViewController *)controller AndCard:(Card *)card InView:(UIView *)view;
- (CardView *)newCardView;
- (IBAction)handleTap:(UITapGestureRecognizer *)sender;
- (void)setCardValues;

@end

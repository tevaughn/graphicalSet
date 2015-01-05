//
//  SetCard.h
//  set
//
//  Created by Administrator on 9/18/14.
//  Copyright (c) 2014 Elec 446. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (nonatomic) NSInteger shape;
@property (nonatomic) NSInteger color;
@property (nonatomic) NSInteger fill;
@property (nonatomic) NSInteger number;

+ (NSInteger)maxShape;
+ (NSInteger)maxColor;
+ (NSInteger)maxFill;
+ (NSInteger)maxNumber;
@end

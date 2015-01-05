//
//  Card.h
//  Matchismo1
//
//  Created by Taylor E Vaughn on 9/2/14.
//  Copyright (c) 2014 Elec 446. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSAttributedString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end

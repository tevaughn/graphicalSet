//
//  SetCard.m
//  set
//
//  Created by Administrator on 9/18/14.
//  Copyright (c) 2014 Elec 446. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

- (int)match:(NSArray *)otherCards
{
    // For each property, if all are the same or differnt, score
    int score = 0;
    
    if ([self colorIsAllTheSameOrDifferent:otherCards] &&
        [self shapeIsAllTheSameOrDifferent:otherCards] &&
        [self numberIsAllTheSameOrDifferent:otherCards ] &&
        [self fillIsAllTheSameOrDifferent:otherCards ]) {
        score = 10;
    }
    
    return score;
}

- (BOOL)colorIsAllTheSameOrDifferent:(NSArray*)cards {
    // check if either all or none of the colors are the same
    return ([self colorIsAllTheSame:cards] || [self colorIsAllDifferent:cards]);
}

- (BOOL)colorIsAllTheSame:(NSArray*)cards
{
    // Make sure all the colors are the same
    return (([[cards objectAtIndex:0] color] ==
             [[cards objectAtIndex:1] color])&&
            ([[cards objectAtIndex:0] color] ==
             [[cards objectAtIndex:2] color]));
}

- (BOOL)colorIsAllDifferent:(NSArray*)cards
{
    // Make sure NONE of the colors are the same
    return (!([[cards objectAtIndex:0] color] ==
              [[cards objectAtIndex:1] color])&&
            !([[cards objectAtIndex:0] color] ==
              [[cards objectAtIndex:2] color])&&
            !([[cards objectAtIndex:1] color] ==
              [[cards objectAtIndex:2] color])
            );
}

- (BOOL)shapeIsAllTheSameOrDifferent:(NSArray*)cards {
    // check if either all or none of the shapes are the same
    return ([self shapeIsAllTheSame:cards] || [self shapeIsAllDifferent:cards]);
}

- (BOOL)shapeIsAllTheSame:(NSArray*)cards
{
    // Make sure all the shapes are the same
    return (([[cards objectAtIndex:0] shape] ==
             [[cards objectAtIndex:1] shape])&&
            ([[cards objectAtIndex:0] shape] ==
             [[cards objectAtIndex:2] shape]));
}


- (BOOL)shapeIsAllDifferent:(NSArray*)cards
{
    // Make sure NONE of the shapes are the same
    return (!([[cards objectAtIndex:0] shape] ==
              [[cards objectAtIndex:1] shape])&&
            !([[cards objectAtIndex:0] shape] ==
              [[cards objectAtIndex:2] shape])&&
            !([[cards objectAtIndex:1] shape] ==
              [[cards objectAtIndex:2] shape])
            );
}

- (BOOL)fillIsAllTheSameOrDifferent:(NSArray*)cards {
    // check if either all or none of the fills are the same
    return ([self fillIsAllTheSame:cards] || [self patternIsAllDifferent:cards]);
}

 - (BOOL)fillIsAllTheSame:(NSArray*)cards
 {
     // Make sure all the fills are the same
     return (([[cards objectAtIndex:0] fill] ==
     [[cards objectAtIndex:1] fill])&&
     ([[cards objectAtIndex:0] fill] ==
     [[cards objectAtIndex:2] fill]));
     }
     
 - (BOOL)patternIsAllDifferent:(NSArray*)cards
{
     // Make sure NONE of the fills are the same
     return (!([[cards objectAtIndex:0] fill] ==
     [[cards objectAtIndex:1] fill])&&
     !([[cards objectAtIndex:0] fill] ==
       [[cards objectAtIndex:2] fill])&&
     !([[cards objectAtIndex:1] fill] ==
     [[cards objectAtIndex:2] fill])
    );
}
         
- (BOOL)numberIsAllTheSameOrDifferent:(NSArray*)cards {
    // check if either all or none of the numbers are the same
    return ([self numberIsAllTheSame:cards] || [self numberIsAllDifferent:cards]);
}

- (BOOL)numberIsAllTheSame:(NSArray*)cards
{
    // Make sure all the numbers are the same
    return (([[cards objectAtIndex:0] number] ==
             [[cards objectAtIndex:1] number])&&
            ([[cards objectAtIndex:0] number] ==
             [[cards objectAtIndex:2] number]));
}

- (BOOL)numberIsAllDifferent:(NSArray*)cards
{
    // Make sure NONE of the numbers are the same
    return (!([[cards objectAtIndex:0] number] ==
              [[cards objectAtIndex:1] number])&&
            !([[cards objectAtIndex:0] number] ==
              [[cards objectAtIndex:2] number])&&
            !([[cards objectAtIndex:1] number] ==
              [[cards objectAtIndex:2] number])
            );
}

+ (NSInteger)maxShape
{
    return 3;
}

+ (NSInteger)maxColor
{
    return 3;
}

+ (NSInteger)maxFill
{
    return 3;
}

+ (NSInteger)maxNumber
{
    return 3;
}
@end

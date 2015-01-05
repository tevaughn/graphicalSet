//
//  CardView.h
//  GraphicalSet
//
//  Created by Administrator on 9/23/14.
//  Copyright (c) 2014 Rice University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardView : UIView
@property (nonatomic) BOOL       highlight;
@property (nonatomic) BOOL       hasCard;
@property (nonatomic) CGFloat intialLength;
@property (nonatomic) BOOL faceUp;
@property (nonatomic) BOOL flip;

#define CORNER_RADIUS 12.0
#define CORNER_FONT_STANDARD_HEIGHT 180.0

- (CGFloat)cornerScaleFactor;
- (CGFloat)cornerRadius;
- (CGFloat)cornerOffset;

// Abstract
- (void)drawCard;//:(CGRect)rect;

@end

//
//  CardView.m
//  GraphicalSet
//
//  Created by Administrator on 9/23/14.
//  Copyright (c) 2014 Rice University. All rights reserved.
//

#import "CardView.h"
#import "CardViewController.h"

@implementation CardView

- (CGFloat)cornerScaleFactor { return self.bounds.size.height / CORNER_FONT_STANDARD_HEIGHT; }
- (CGFloat)cornerRadius { return CORNER_RADIUS * [self cornerScaleFactor]; }
- (CGFloat)cornerOffset { return [self cornerRadius] / 3.0; }

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    if ( self.hasCard ) {
        // Drawing code
        UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];
        
        [roundedRect addClip];
        
        
        [[UIColor whiteColor] setFill];
        UIRectFill(self.bounds);
        
        if(self.highlight) {
            [[UIColor blueColor] setStroke];
            roundedRect.lineWidth = 5;
        }
        else {
            [[UIColor blackColor] setStroke];
            roundedRect.lineWidth = 1;
            
        }
        [roundedRect stroke];
        [self drawCard];
    }
}

- (void)drawCard
{
    //
}


-(void)setHighlight:(BOOL)highlight
{
    _highlight = highlight;
    [self setNeedsDisplay];
}


- (void)setFaceUp:(BOOL)faceUp
{
    _faceUp = faceUp;
    [self setNeedsDisplay];
}

-(void)setIntialLength:(CGFloat)intialLength
{
    _intialLength= intialLength;
}

#pragma mark - Initialization

- (void)setup
{
    self.backgroundColor = [UIColor clearColor];
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}

@end

//
//  SetCardView.m
//  GraphicalSet
//
//  Created by Administrator on 9/23/14.
//  Copyright (c) 2014 Rice University. All rights reserved.
//

#import "SetCardView.h"

@implementation SetCardView

- (UIColor*)getUIColor
{
    return @[[UIColor redColor],[UIColor purpleColor],[UIColor greenColor]][self.color];
}

- (NSString*)getFill
{
    return @[@"Fill", @"Empty", @"Stripe"][self.fill];
}

- (NSString *)getShape
{
    return @[@"Oval", @"Diamond", @"Squiggle"][self.shape];
}

#pragma mark - properties

- (void)setColor:(NSUInteger)color
{
    _color = color;
    [self setNeedsDisplay];
}

- (void)setFill:(NSUInteger)fill
{
    _fill = fill;
    [self setNeedsDisplay];
}

-(void)setNumber:(NSUInteger)number
{
    _number = number + 1;
    [self setNeedsDisplay];
}

-(void)setShape:(NSUInteger)shape
{
    _shape = shape;
    [self setNeedsDisplay];
}

#pragma mark - Drawing


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawCard {
    // Drawing code
    if (self.flip) {
        [UIView setAnimationDelay:.5];
        [UIView transitionWithView:self
                          duration:0.5
                           options:UIViewAnimationOptionTransitionFlipFromRight
                        animations:nil
                        completion:nil];
        self.flip = NO;
    }
    if (self.faceUp) {
        NSMutableArray *shapeCenters = [self getCenters];
        for ( NSValue *center in shapeCenters ) {
            if ( [[self getShape]  isEqual: @"Oval"] ) {
                [self drawOvalWithCenter:center.CGPointValue];
            } else if ( [[self getShape]  isEqual: @"Diamond"] ) {
                [self drawDiamondWithCenter:center.CGPointValue];
            } else if ( [[self getShape]  isEqual: @"Squiggle"] ) {
                [self drawSquiggleWithCenter:center.CGPointValue];
            }
        }
    } else {
        [[UIImage imageNamed:@"cardback"] drawInRect:self.bounds];
    }

}

- (NSMutableArray *)getCenters
{
    NSMutableArray *shapeCenters = [[NSMutableArray alloc] init];
    if ([self number] == 1 || [self number] == 3 ) {
        
        [shapeCenters addObjectsFromArray: @[
                         [NSValue valueWithCGPoint:CGPointMake( self.bounds.size.width / 2, self.bounds.size.height / 2 )]
                         ]];
    }
    if ([self number] == 2 ) {
        [shapeCenters addObjectsFromArray: @[
                                             [NSValue valueWithCGPoint:CGPointMake( self.bounds.size.width / 2, 1* self.bounds.size.height / 3 )],
                                             [NSValue valueWithCGPoint:CGPointMake( self.bounds.size.width / 2, 2* self.bounds.size.height / 3 )]
                                             ]];
    }
    if ([self number] == 3 ) {
        [shapeCenters addObjectsFromArray: @[
                                             [NSValue valueWithCGPoint:CGPointMake( self.bounds.size.width / 2, 1 * self.bounds.size.height / 4 )],
                                             [NSValue valueWithCGPoint:CGPointMake( self.bounds.size.width / 2, 3* self.bounds.size.height / 4 )]
                                             ]];
    }
    return shapeCenters;
}

- (void)drawOvalWithCenter:(CGPoint)center;
{
    UIBezierPath *oval = [UIBezierPath bezierPath];
    
    CGFloat ovalHeight = self.bounds.size.height / 6 ;
    CGFloat ovalWidth = self.bounds.size.width / 3 ;
    CGFloat ovalRadius = ovalWidth / 2;
    
    CGPoint origin = CGPointMake(center.x - ovalHeight / 2, center.y - ovalWidth /2 );

    // Set the starting point of the shape.
    [oval moveToPoint:origin];
    
    // Draw the lines.
    [oval addLineToPoint:CGPointMake(origin.x + ovalHeight, origin.y )];
    [oval addArcWithCenter:CGPointMake(origin.x + ovalHeight, origin.y + ovalRadius ) radius:ovalRadius startAngle:-M_PI_2 endAngle:M_PI_2 clockwise:YES];
    [oval addLineToPoint:CGPointMake(origin.x, origin.y + ovalWidth)];
    [oval addArcWithCenter:CGPointMake(origin.x, origin.y + ovalRadius) radius:ovalRadius startAngle:M_PI_2 endAngle:-M_PI_2 clockwise:YES];
    [oval closePath];
    
    [self colorShape:oval];
}

-(void)drawSquiggleWithCenter:(CGPoint)center;
{
 
    UIBezierPath *squiggle = [UIBezierPath bezierPath];
    
    CGFloat squiggleHeight = self.bounds.size.height / 6 ;
    CGFloat squiggleWidth = 3 * self.bounds.size.width / 5 ;

    // Set the starting point of the shape.
    [squiggle moveToPoint:CGPointMake(center.x - squiggleWidth / 2, center.y )];
    
    // Draw the lines.
    [squiggle addCurveToPoint:CGPointMake(center.x + squiggleWidth / 2, center.y )
                controlPoint1:CGPointMake(center.x + 1 * squiggleWidth / 6, center.y - 1 * squiggleHeight / 2 )
                controlPoint2:CGPointMake(center.x + 2 * squiggleWidth / 6, center.y - 2 * squiggleHeight / 2 )];
    
    [squiggle addCurveToPoint:CGPointMake(center.x - squiggleWidth / 2, center.y )
                controlPoint1:CGPointMake(center.x - 1 * squiggleWidth / 6, center.y + 1 * squiggleHeight / 2 )
                controlPoint2:CGPointMake(center.x - 2 * squiggleWidth / 6, center.y + 2 * squiggleHeight / 2 )];
    
    [self colorShape:squiggle];
    
    
}

-(void)drawDiamondWithCenter:(CGPoint)center;
{
    UIBezierPath *diamond = [UIBezierPath bezierPath];
    
    CGFloat diamondHeight = self.bounds.size.height / 6 ;
    CGFloat diamondWidth = 3 * self.bounds.size.width / 5 ;
    
    CGPoint origin = CGPointMake(center.x, center.y - diamondHeight / 2 );
    
    // Set the starting point of the shape.
    [diamond moveToPoint:origin];
    
    // Draw the lines.
    [diamond addLineToPoint:CGPointMake(origin.x + diamondWidth / 2, center.y)];
    [diamond addLineToPoint:CGPointMake(center.x, origin.y + diamondHeight )];
    [diamond addLineToPoint:CGPointMake(origin.x - diamondWidth / 2, center.y )];
    [diamond closePath];
    
    [self colorShape:diamond];
    
    
}



#define MAX_STRIPES 15

- (void)colorShape:(UIBezierPath *)shape
{
    [[self getUIColor] setStroke];
    [[self getUIColor] setFill];
    
    CGContextSaveGState(UIGraphicsGetCurrentContext()); {
        

        if ([[self getFill] isEqual: @"Fill"]) {
            [shape fill];
        } else if ([[self getFill] isEqual: @"Stripe"]) {
            [shape addClip];
            [self drawStripeInShape:shape];
        }


        [shape stroke];
        
    } CGContextRestoreGState(UIGraphicsGetCurrentContext());
    
}

- (void)drawStripeInShape:(UIBezierPath*)shape
{
    UIBezierPath *stripe = [UIBezierPath bezierPath];
    
    CGFloat stripeHeight = shape.bounds.size.height;
    CGFloat stripeWidth = shape.bounds.size.width / MAX_STRIPES;
    
    CGPoint origin = shape.bounds.origin;
    
    // Set the starting point of the shape.
    [stripe moveToPoint:origin];
    
    // Draw the lines.
    for ( NSInteger i = 0 ; i < MAX_STRIPES ; i++ ) {
        [stripe addLineToPoint:CGPointMake(origin.x + i * stripeWidth, origin.y + stripeHeight )];
        [stripe addLineToPoint:CGPointMake(origin.x + i * stripeWidth, origin.y )];
        [stripe addLineToPoint:CGPointMake(origin.x + i * stripeWidth, origin.y + stripeHeight )];
 
    }
    
    [[self getUIColor] setStroke];
    [stripe stroke];
}


@end

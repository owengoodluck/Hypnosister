//
//  OWNHypnosisView.m
//  Hypnosister
//
//  Created by oushunwu on 15/6/12.
//  Copyright (c) 2015年 oushunwu. All rights reserved.
//

#import "OWNHypnosisView.h"

@interface OWNHypnosisView()
@property(strong,nonatomic)UIColor *cycleColor;
@end

@implementation OWNHypnosisView

-(void)drawRect:(CGRect)rect{
    CGRect bounds = self.bounds;
    
    //get center
    CGPoint center;
    center.x = bounds.origin.x+bounds.size.width/2.0;
    center.y = bounds.origin.y+bounds.size.height/2.0;
    
    //get radius
    float radious = (MIN(bounds.size.height, bounds.size.width)/2.0);
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    for (float currentRadious=radious; currentRadious>0; currentRadious-=20) {
        [path moveToPoint:CGPointMake(center.x+currentRadious, center.y)];
        [path addArcWithCenter:center radius:currentRadious startAngle:0.0 endAngle:M_PI*2.0 clockwise:YES];
    }
    path.lineWidth = 10;
    
    //set color of cycle
    [self.cycleColor setStroke];
    
    [path stroke];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.cycleColor = [UIColor redColor];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    float red = arc4random()%100/100.0;
    float green = arc4random()%100/100.0;
    float blue = arc4random()%100/100.0;
    self.cycleColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.000];
}

-(void)setCycleColor:(UIColor *)cycleColor{
    _cycleColor=cycleColor;
    [self setNeedsDisplay];
}

@end

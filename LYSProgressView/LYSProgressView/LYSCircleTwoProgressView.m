//
//  LYSCircleTwoProgressView.m
//  LYSProgressView
//
//  Created by jk on 2017/3/11.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import "LYSCircleTwoProgressView.h"

#define circleStartAngle (-0.25 * M_PI)

@interface LYSCircleTwoProgressView ()

@property(nonatomic,strong)CAShapeLayer *circleLayer;

@end

@implementation LYSCircleTwoProgressView

- (instancetype)initWithXOffset:(CGFloat)xoffset yoffset:(CGFloat)yoffset itemSize:(CGFloat)itemSize
{
    self = [super initWithFrame:CGRectMake(xoffset, yoffset, itemSize, itemSize)];
    if (self) {
        [self initConfig];
    }
    return self;
}

-(void)setUnfinishedColor:(UIColor *)unfinishedColor{
    _unfinishedColor = unfinishedColor;
    self.circleLayer.fillColor = _unfinishedColor.CGColor;
}

-(void)setLineWidth:(CGFloat)lineWidth{
    _lineWidth = lineWidth;
    self.circleLayer.lineWidth = self.lineWidth;
    self.circleLayer.path = [self myPath:_lineWidth startAngle: circleStartAngle progress:_progress].CGPath;
}

-(void)setProgress:(CGFloat)progress{
    _progress = progress;
    self.circleLayer.path = [self myPath:_lineWidth startAngle: circleStartAngle progress:_progress].CGPath;
}

-(CAShapeLayer*)circleLayer{
    if (!_circleLayer) {
        _circleLayer = [CAShapeLayer layer];
        _circleLayer.path = [self myPath:_lineWidth startAngle: circleStartAngle progress:_progress].CGPath;
        _circleLayer.lineWidth = self.lineWidth;
        _circleLayer.strokeStart = 0;
        _circleLayer.strokeEnd = 1.0;
        _circleLayer.fillColor = _unfinishedColor.CGColor;
        _circleLayer.strokeColor = [UIColor clearColor].CGColor;
        _circleLayer.lineJoin = kCALineJoinRound;
        _circleLayer.lineCap = kCALineCapRound;
    }
    return _circleLayer;
}

-(UIBezierPath *)myPath:(CGFloat)lineW startAngle:(CGFloat)startAngle progress:(CGFloat)circleProgress{
    CGFloat radius = (MIN(self.bounds.size.width, self.bounds.size.height) - lineW) * 0.5;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(self.frame.size.width / 2 , self.frame.size.height / 2 )];
    [path addArcWithCenter:(CGPoint){self.bounds.size.width * 0.5, self.bounds.size.height * 0.5} radius:radius startAngle:1.5 * M_PI endAngle:1.5 * M_PI + 2 * M_PI * circleProgress clockwise:YES];
//    [UIBezierPath bezierPathWithArcCenter:  radius:radius startAngle: 0 endAngle: 2 * M_PI * circleProgress clockwise:YES];
    return path;
}


-(void)initConfig{
    
    _progress = 0;
    
    _lineWidth = 10.f;
    
    _unfinishedColor = [UIColor colorWithRed:0/255.0 green:191/255.0 blue:255/255.0 alpha:1];
    
    [self.layer addSublayer:self.circleLayer];
    
    self.layer.cornerRadius = self.frame.size.height / 2;
    
    self.layer.masksToBounds = YES;
}

@end

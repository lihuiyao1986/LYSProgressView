//
//  LYSHorizontalProgressView.m
//  LYSProgressView
//
//  Created by jk on 2017/3/10.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import "LYSHorizontalProgressView.h"

@interface LYSHorizontalProgressView ()

@property(nonatomic,strong)CAShapeLayer *myLayer;

@property(nonatomic,strong)CAShapeLayer *outerLayer;

@end

@implementation LYSHorizontalProgressView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initConfig];
    }
    return self;
}


-(CAShapeLayer*)myLayer{
    if (!_myLayer) {
        _myLayer = [CAShapeLayer layer];
        _myLayer.strokeColor = self.highlightColor.CGColor;
        _myLayer.strokeStart = 0;
        _myLayer.strokeEnd = 0;
        _myLayer.lineJoin = kCALineJoinRound;
        _myLayer.lineCap = kCALineCapRound;
    }
    return _myLayer;
}

-(UIBezierPath*)outerLayerPath{
    UIBezierPath * _path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) cornerRadius:self.bounds.size.height / 2];
    return _path;
}

-(CAShapeLayer*)outerLayer{
    if (!_outerLayer) {
        _outerLayer = [CAShapeLayer layer];
        _outerLayer.strokeColor = self.highlightColor.CGColor;
        _outerLayer.fillColor = [UIColor clearColor].CGColor;
        _outerLayer.strokeStart = 0;
        _outerLayer.path = [self outerLayerPath].CGPath;
        _outerLayer.strokeEnd = 1.0;
        _outerLayer.lineJoin = kCALineJoinRound;
        _outerLayer.lineCap = kCALineCapRound;
    }
    return _outerLayer;
}

-(void)setOuterLineW:(CGFloat)outerLineW{
    _outerLineW = outerLineW;
    self.outerLayer.lineWidth = _outerLineW;
    self.myLayer.path = [self myPath:_outerLineW xoffset:_xoffset].CGPath;
    self.myLayer.lineWidth = CGRectGetHeight(self.frame) - (_outerLineW + _yoffset);
}

-(void)setHighlightColor:(UIColor *)highlightColor{
    _highlightColor = highlightColor;
    self.myLayer.fillColor = _highlightColor.CGColor;
    self.outerLayer.strokeColor = _highlightColor.CGColor;
}

-(void)setProgress:(CGFloat)progress{
    _progress = progress;
    self.myLayer.strokeEnd = _progress;
}

-(void)setXoffset:(CGFloat)xoffset{
    _xoffset = xoffset;
    self.myLayer.path = [self myPath:_outerLineW xoffset:_xoffset].CGPath;
}

-(void)setYoffset:(CGFloat)yoffset{
    _yoffset = yoffset;
    self.myLayer.lineWidth = CGRectGetHeight(self.frame) - (_outerLineW + _yoffset);
}

-(UIBezierPath *)myPath:(CGFloat)outerLineW xoffset:(CGFloat)xoffset{
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(xoffset, self.bounds.size.height / 2)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width - xoffset , self.bounds.size.height / 2)];
    return path;
}

-(void)initConfig{
    
    _progress = 0;
    
    _highlightColor = [UIColor colorWithRed:0/255.0 green:191/255.0 blue:255/255.0 alpha:1];
        
    _outerLineW = 2.f;
    
    _yoffset = 10.f;
    
    _xoffset = 15.f;
    
    [self.layer addSublayer:self.outerLayer];
    [self.layer insertSublayer:self.myLayer atIndex:0];
    
}

@end

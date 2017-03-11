//
//  LYSCircleProgressView.m
//  LYSProgressView
//
//  Created by jk on 2017/3/10.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import "LYSCircleProgressView.h"

#define circleStartAngle (-0.25 * M_PI)

@interface LYSCircleProgressView ()

#pragma mark - 百分比标签
@property(nonatomic,strong)UILabel *percenLb;

@property(nonatomic,strong)CAShapeLayer *unfinishedLayer;

@property(nonatomic,strong)CAShapeLayer *finishedLayer;

@end

@implementation LYSCircleProgressView

- (instancetype)initWithXOffset:(CGFloat)xoffset yoffset:(CGFloat)yoffset itemSize:(CGFloat)itemSize
{
    self = [super initWithFrame:CGRectMake(xoffset, yoffset, itemSize, itemSize)];
    if (self) {
        [self initConfig];
    }
    return self;
}


-(CAShapeLayer*)unfinishedLayer{
    if (!_unfinishedLayer) {
        _unfinishedLayer = [CAShapeLayer layer];
        _unfinishedLayer.path = [self myPath:_lineWidth startAngle:circleStartAngle].CGPath;
        _unfinishedLayer.lineWidth = _lineWidth;
        _unfinishedLayer.strokeStart = 0;
        _unfinishedLayer.strokeEnd = 1.0;
        _unfinishedLayer.fillColor = [UIColor clearColor].CGColor;
        _unfinishedLayer.strokeColor = _unfinishedColor.CGColor;
        _unfinishedLayer.lineJoin = kCALineJoinRound;
        _unfinishedLayer.lineCap = kCALineCapRound;
    }
    return _unfinishedLayer;
}

-(CAShapeLayer*)finishedLayer{
    if (!_finishedLayer) {
        _finishedLayer = [CAShapeLayer layer];
        _finishedLayer.path = [self myPath:_lineWidth startAngle: circleStartAngle].CGPath;
        _finishedLayer.lineWidth = self.lineWidth;
        _finishedLayer.strokeStart = 0;
        _finishedLayer.strokeEnd = _progress;
        _finishedLayer.fillColor = [UIColor clearColor].CGColor;
        _finishedLayer.strokeColor = _finishedColor.CGColor;
        _finishedLayer.lineJoin = kCALineJoinRound;
        _finishedLayer.lineCap = kCALineCapRound;
    }
    return _finishedLayer;

}

-(void)setLineWidth:(CGFloat)lineWidth{
    _lineWidth = lineWidth;
    self.unfinishedLayer.lineWidth = _lineWidth;
    self.finishedLayer.lineWidth = _lineWidth;
    self.unfinishedLayer.path = [self myPath:_lineWidth startAngle: circleStartAngle].CGPath;
    self.finishedLayer.path = [self myPath:_lineWidth startAngle: circleStartAngle].CGPath;
}

-(UIBezierPath *)myPath:(CGFloat)lineW startAngle:(CGFloat)startAngle{
    CGFloat radius = (MIN(self.bounds.size.width, self.bounds.size.height) - lineW) * 0.5;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:(CGPoint){self.bounds.size.width * 0.5, self.bounds.size.height * 0.5}  radius:radius startAngle: startAngle endAngle: startAngle + 2 * M_PI clockwise:YES];
    return path;
}

-(void)setUnfinishedColor:(UIColor *)unfinishedColor{
    _unfinishedColor = unfinishedColor;
    self.unfinishedLayer.strokeColor = _unfinishedColor.CGColor;
}

-(UILabel*)percenLb{
    if (!_percenLb) {
        _percenLb =[[UILabel alloc] initWithFrame:self.bounds];
        _percenLb.font = _percenLBFont;
        _percenLb.textColor = _percenLBColor;
        _percenLb.textAlignment = NSTextAlignmentCenter;
    }
    return _percenLb;
}

-(void)setPercenLBFont:(UIFont *)percenLBFont{
    _percenLBFont = percenLBFont;
    _percenLb.font = _percenLBFont;
}

-(void)setPercenLBColor:(UIColor *)percenLBColor{
    _percenLBColor = percenLBColor;
    _percenLb.textColor = _percenLBColor;
}

-(void)setProgress:(CGFloat)progress{
    _progress = progress;
    _percenLb.text = [NSString stringWithFormat:@"%d%%", (int)floor(_progress * 100)];
    self.finishedLayer.strokeEnd = _progress;
}


-(void)initConfig{
    
    _progress = 0;
    
    _lineWidth = 10.f;
    
    _finishedColor = [UIColor colorWithRed:0/255.0 green:191/255.0 blue:255/255.0 alpha:1];
    
    _unfinishedColor = [UIColor groupTableViewBackgroundColor];
    
    _percenLBFont = [UIFont systemFontOfSize:26];
    
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.percenLb];
    
    [self.layer addSublayer:self.unfinishedLayer];
    [self.layer addSublayer:self.finishedLayer];

}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.percenLb.frame = self.bounds;
}

@end

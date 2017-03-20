//
//  LYSCircleFourProgressView.m
//  LYSProgressView
//
//  Created by jk on 2017/3/19.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import "LYSCircleFourProgressView.h"


#define circleStartAngle (-0.25 * M_PI)
//#define circleStartAngle (0)

static NSString *kstrokeAnimationKey = @"stroke.animation";

@interface LYSCircleFourProgressView ()

#pragma mark - 高亮图层
@property(nonatomic,strong)CAShapeLayer *highlightedLayer;

#pragma mark - 正常图层
@property(nonatomic,strong)CAShapeLayer *normalLayer;

#pragma mark - 百分比标签
@property(nonatomic,strong)UILabel *percenLb;

@end


@implementation LYSCircleFourProgressView

#pragma mark - 初始化方法
- (instancetype)initWithXOffset:(CGFloat)xoffset yoffset:(CGFloat)yoffset itemSize:(CGFloat)itemSize
{
    self = [super initWithFrame:CGRectMake(xoffset, yoffset, itemSize, itemSize)];
    if (self) {
        [self initConfig];
    }
    return self;
}

#pragma mark - 开始动画
-(void)startAnim{
    
    CABasicAnimation *headAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    headAnimation.fromValue = @0;
    headAnimation.toValue = @(2.f*M_PI);
    headAnimation.duration = _duration;
    headAnimation.repeatCount = INFINITY;
    headAnimation.removedOnCompletion = NO;
    headAnimation.fillMode = kCAFillModeForwards;
    headAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    [self.highlightedLayer addAnimation:headAnimation forKey:kstrokeAnimationKey];
}

#pragma mark - 设置百分比标签
-(UILabel*)percenLb{
    if (!_percenLb) {
        _percenLb =[[UILabel alloc] initWithFrame:self.bounds];
        _percenLb.font = self.lbFont;
        _percenLb.textColor = self.lbColor;
        _percenLb.textAlignment = NSTextAlignmentCenter;
    }
    return _percenLb;
}

#pragma mark - 设置字体大小
-(void)setLbFont:(UIFont *)lbFont{
    _lbFont = lbFont;
    self.percenLb.font = lbFont;
}

#pragma mark - 设置字体颜色
-(void)setLbColor:(UIColor *)lbColor{
    _lbColor = lbColor;
    self.percenLb.textColor = self.lbColor;
}

#pragma mark - 初始化配置
-(void)initConfig{
    
    _progress = 0;
    
    _lineW = 10.f;
    
    _duration = 1.f;
    
    _highlightedColor = [UIColor colorWithRed:0/255.0 green:191/255.0 blue:255/255.0 alpha:1];
    
    _normalColor = [UIColor groupTableViewBackgroundColor];
    
    _lbFont = [UIFont systemFontOfSize:14];
    _lbColor = [UIColor redColor];
    
    [self addSubview:self.percenLb];
    [self.layer addSublayer:self.normalLayer];
    [self.layer insertSublayer:self.highlightedLayer above:self.normalLayer];

    [self startAnim];
}

#pragma mark - 停止动画
-(void)stopAnim{
    [self.highlightedLayer removeAnimationForKey:kstrokeAnimationKey];
}

#pragma mark - 设置动画时间
-(void)setDuration:(NSTimeInterval)duration{
    _duration = duration;
    [self stopAnim];
    [self startAnim];
}

#pragma mark - 背景图层
-(CAShapeLayer*)normalLayer{
    if (!_normalLayer) {
        _normalLayer = [CAShapeLayer layer];
        _normalLayer.strokeEnd = 1.0;
        _normalLayer.strokeStart = 0;
        _normalLayer.lineWidth = _lineW;
        _normalLayer.fillColor = [UIColor clearColor].CGColor;
        _normalLayer.strokeColor = _normalColor.CGColor;
        _normalLayer.path = [self myPath:_lineW startAngle:circleStartAngle].CGPath;
        _normalLayer.lineJoin = kCALineJoinRound;
        _normalLayer.lineCap = kCALineCapRound;
        
    }
    return _normalLayer;
}


#pragma mark - 高亮图层
-(CAShapeLayer*)highlightedLayer{
    if (!_highlightedLayer) {
        _highlightedLayer = [CAShapeLayer layer];
        _highlightedLayer.strokeStart = 0;
        _highlightedLayer.strokeEnd = 0.2;
        _highlightedLayer.lineWidth = _lineW;
        _highlightedLayer.path = [self myPath:_lineW startAngle:circleStartAngle].CGPath;
        _highlightedLayer.fillColor = [UIColor clearColor].CGColor;
        _highlightedLayer.strokeColor = _highlightedColor.CGColor;
        _highlightedLayer.lineJoin = kCALineJoinRound;
        _highlightedLayer.lineCap = kCALineCapRound;
        _highlightedLayer.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        
    }
    return _highlightedLayer;
}

#pragma mark - 路径
-(UIBezierPath *)myPath:(CGFloat)lineW startAngle:(CGFloat)startAngle{
    CGFloat radius = (MIN(self.bounds.size.width, self.bounds.size.height) - lineW) * 0.5;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:(CGPoint){self.bounds.size.width * 0.5, self.bounds.size.height * 0.5}  radius:radius startAngle: startAngle endAngle: startAngle + 2 * M_PI clockwise:YES];
    return path;
}


#pragma mark - 设置进度
-(void)setProgress:(CGFloat)progress{
    _progress = progress;
    _percenLb.text = [NSString stringWithFormat:@"%d%%", (int)floor(_progress * 100)];
}

#pragma mark - 设置正常颜色
-(void)setNormalColor:(UIColor *)normalColor{
    _normalColor = normalColor;
    self.normalLayer.strokeColor = _normalColor.CGColor;
}

#pragma mark - 设置高亮颜色
-(void)setHighlightedColor:(UIColor *)highlightedColor{
    _highlightedColor = highlightedColor;
    self.highlightedLayer.strokeColor = _highlightedColor.CGColor;
}

#pragma mark - 设置线宽
-(void)setLineW:(CGFloat)lineW{
    _lineW = lineW;
    self.highlightedLayer.lineWidth = _lineW;
    self.normalLayer.lineWidth = _lineW;
}

#pragma mark - layoutSubviews方法
-(void)layoutSubviews{
    [super layoutSubviews];
    self.percenLb.frame = self.bounds;
}

-(void)dealloc{
    [self stopAnim];
}

@end

//
//  LYSWaveProgressView.h
//  LYSProgressView
//
//  Created by jk on 2017/3/10.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYSWaveProgressView : UIView

#pragma mark - 进度
@property(nonatomic,assign)CGFloat progress;

#pragma mark - 上波浪填充色
@property(nonatomic,strong)UIColor *waveTopFillColor;

#pragma mark - 下波浪填充色
@property(nonatomic,strong)UIColor *waveBottomFillColor;

#pragma mark - 背景色
@property(nonatomic,strong)UIColor *bgFillColor;

#pragma mark - 初始化方法
- (instancetype)initWithXOffset:(CGFloat)xoffset yoffset:(CGFloat)yoffset itemSize:(CGFloat)itemSize;

@end

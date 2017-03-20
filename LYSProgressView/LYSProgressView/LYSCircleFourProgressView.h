//
//  LYSCircleFourProgressView.h
//  LYSProgressView
//
//  Created by jk on 2017/3/19.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYSCircleFourProgressView : UIView

#pragma mark - 进度
@property(nonatomic,assign)CGFloat progress;

#pragma mark - 高亮颜色
@property(nonatomic,strong)UIColor *highlightedColor;

#pragma mark - 正常颜色
@property(nonatomic,strong)UIColor *normalColor;

#pragma mark - 线条的宽度
@property(nonatomic,assign)CGFloat lineW;

#pragma mark - 时间间隔
@property(nonatomic,assign)NSTimeInterval duration;

#pragma mark - 字体大小
@property(nonatomic,strong)UIFont *lbFont;

#pragma mark - 字体颜色
@property(nonatomic,strong)UIColor * lbColor;

#pragma mark - 初始化方法
- (instancetype)initWithXOffset:(CGFloat)xoffset yoffset:(CGFloat)yoffset itemSize:(CGFloat)itemSize;

@end

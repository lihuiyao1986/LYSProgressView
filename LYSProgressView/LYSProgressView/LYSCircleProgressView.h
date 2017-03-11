//
//  LYSCircleProgressView.h
//  LYSProgressView
//
//  Created by jk on 2017/3/10.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYSCircleProgressView : UIView

#pragma mark - 进度
@property(nonatomic,assign)CGFloat progress;

#pragma mark - 百分比标签对应的字体
@property(nonatomic,strong)UIFont *percenLBFont;

#pragma mark - 百分比标签对应的颜色
@property(nonatomic,strong)UIColor *percenLBColor;

#pragma mark - 线宽
@property(nonatomic,assign)CGFloat lineWidth;

#pragma mark - 完成时线的颜色
@property(nonatomic,strong)UIColor *finishedColor;

#pragma mark - 未完成时线的颜色
@property(nonatomic,strong)UIColor *unfinishedColor;

#pragma mark - 初始化方法
- (instancetype)initWithXOffset:(CGFloat)xoffset yoffset:(CGFloat)yoffset itemSize:(CGFloat)itemSize;

@end

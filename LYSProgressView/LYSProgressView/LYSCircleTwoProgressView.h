//
//  LYSCircleTwoProgressView.h
//  LYSProgressView
//
//  Created by jk on 2017/3/11.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYSCircleTwoProgressView : UIView

#pragma mark - 未完成时线的颜色
@property(nonatomic,strong)UIColor *unfinishedColor;

#pragma mark - 外面线框的颜色
@property(nonatomic,strong)UIColor *outerLineColor;

#pragma mark - 线条的宽度
@property(nonatomic,assign)CGFloat lineWidth;

#pragma mark - 进度
@property(nonatomic,assign)CGFloat progress;

#pragma mark - 初始化方法
- (instancetype)initWithXOffset:(CGFloat)xoffset yoffset:(CGFloat)yoffset itemSize:(CGFloat)itemSize;


@end

//
//  LYSHorizontalProgressView.h
//  LYSProgressView
//
//  Created by jk on 2017/3/10.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYSHorizontalProgressView : UIView

#pragma mark - 进度
@property(nonatomic,assign)CGFloat progress;

#pragma mark - 外部线条的宽度
@property(nonatomic,assign)CGFloat outerLineW;

#pragma mak - 水平偏移值
@property(nonatomic,assign)CGFloat xoffset;

#pragma mak - 垂直偏移值
@property(nonatomic,assign)CGFloat yoffset;

#pragma mark - 高亮颜色
@property(nonatomic,strong)UIColor *highlightColor;


@end

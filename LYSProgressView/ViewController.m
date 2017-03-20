//
//  ViewController.m
//  LYSProgressView
//
//  Created by jk on 2017/3/10.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import "ViewController.h"
#import "LYSWaveProgressView.h"
#import "LYSCircleProgressView.h"
#import "LYSCircleTwoProgressView.h"
#import "LYSHorizontalProgressView.h"
#import "LYSCircleThreeProgressView.h"
#import "LYSCircleFourProgressView.h"

@interface ViewController (){
    NSTimer *_timer;
    LYSWaveProgressView *_waveProgressView;
    LYSCircleProgressView *_circleProgressView;
    LYSCircleTwoProgressView *view1;
    LYSHorizontalProgressView *view2;
    LYSCircleThreeProgressView *view3;
    LYSCircleFourProgressView *view4;
}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //添加定时器
    [self addTimer];
     _waveProgressView = [[LYSWaveProgressView alloc]initWithXOffset:50 yoffset:120 itemSize:80];
//    _waveProgressView.progress = 0.5;
    [self.view addSubview:_waveProgressView];
    
    _circleProgressView = [[LYSCircleProgressView alloc]initWithXOffset:50 yoffset:220 itemSize:80];
//    _circleProgressView.progress = 0.5;
    _circleProgressView.lineWidth = 5.f;
//    _circleProgressView.unfinishedColor = [UIColor greenColor];
    _circleProgressView.percenLBFont = [UIFont systemFontOfSize:14];
    _circleProgressView.percenLBColor = [UIColor redColor];
    [self.view addSubview:_circleProgressView];
    
    view1 = [[LYSCircleTwoProgressView alloc]initWithXOffset:50 yoffset:350 itemSize:80];
    view1.backgroundColor = [UIColor colorWithRed:0/255.0 green:191/255.0 blue:255/255.0 alpha:1];
    view1.lineWidth = 10.f;
    view1.outerLineColor = [UIColor whiteColor];
    view1.unfinishedColor = [UIColor whiteColor];
//    view1.progress = 0.4;
    [self.view addSubview:view1];
    
    view2 = [[LYSHorizontalProgressView alloc]initWithFrame:CGRectMake(80, CGRectGetMaxY(view1.frame) + 20, self.view.frame.size.width - 160, 15)];
    view2.backgroundColor = [UIColor colorWithRed:0/255.0 green:191/255.0 blue:255/255.0 alpha:1];
    view2.backgroundColor = [UIColor clearColor];
    view2.yoffset = 5.f;
//    view2.backgroundColor = [UIColor redColor];
    view2.outerLineW = 2.f;
    view2.xoffset = 10.f;
//    view2.layer.borderWidth = 1;
//    view2.progress = 0.3;
    //    view1.progress = 0.4;
    [self.view addSubview:view2];
    
    view3 = [[LYSCircleThreeProgressView alloc]initWithXOffset:80 yoffset:CGRectGetMaxY(view2.frame) + 20 itemSize:80];
//    view3.layer.borderWidth = 1;
    view3.lineW = 5.f;
//    view3.highlightedColor = [UIColor redColor];
    view3.duration = 1.5f;
    [self.view addSubview:view3];
    
    view4 = [[LYSCircleFourProgressView alloc]initWithXOffset:80 yoffset:CGRectGetMaxY(view3.frame) + 20 itemSize:80];
    //    view3.layer.borderWidth = 1;
    view4.lineW = 5.f;
    //    view3.highlightedColor = [UIColor redColor];
    view4.duration = 1.0f;
    [self.view addSubview:view4];
}

- (void)addTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)timerAction
{
    _waveProgressView.progress += 0.01;
    _circleProgressView.progress += 0.01;
    view1.progress += 0.01;
    view2.progress += 0.01;
    view3.progress += 0.01;
    view4.progress += 0.01;
    
    if (_waveProgressView.progress >= 1) {
//        [self removeTimer];
        _waveProgressView.progress = 0.01;
        _circleProgressView.progress = 0.01;
        view1.progress = 0.01;
        view2.progress = 0.01;
        view3.progress = 0.01;
        view4.progress = 0.01;
        NSLog(@"完成");
    }
}

- (void)removeTimer
{
    [_timer invalidate];
    _timer = nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

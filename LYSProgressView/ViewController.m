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

@interface ViewController (){
    
}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LYSWaveProgressView *_waveProgressView = [[LYSWaveProgressView alloc]initWithXOffset:50 yoffset:120 itemSize:80];
    _waveProgressView.progress = 0.5;
    [self.view addSubview:_waveProgressView];
    
    LYSCircleProgressView *_circleProgressView = [[LYSCircleProgressView alloc]initWithXOffset:50 yoffset:220 itemSize:80];
    _circleProgressView.progress = 0.5;
    _circleProgressView.lineWidth = 5.f;
//    _circleProgressView.unfinishedColor = [UIColor greenColor];
    _circleProgressView.percenLBFont = [UIFont systemFontOfSize:14];
    _circleProgressView.percenLBColor = [UIColor redColor];
    [self.view addSubview:_circleProgressView];
    
    LYSCircleTwoProgressView *view1 = [[LYSCircleTwoProgressView alloc]initWithXOffset:50 yoffset:350 itemSize:80];
    view1.backgroundColor = [UIColor clearColor];
    view1.lineWidth = 20.f;
    view1.progress = 0.4;
    [self.view addSubview:view1];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

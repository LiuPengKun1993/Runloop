//
//  NNAutoreleaseViewController.m
//  Runloop
//
//  Created by 柳钟宁 on 16/9/23.
//  Copyright © 2016年 YMWM. All rights reserved.
//

#import "NNChangeMode.h"

@interface NNChangeMode ()

@end

@implementation NNChangeMode

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self timerTest];

}
- (void)timerTest
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    
    // RunLoopMode 切换 (随意切换 RunLoopMode 即可得出结论！)
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
//        [[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
    
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];

}

- (void)run
{
    NSLog(@"run");
}


@end

//
//  NNObserverViewController.m
//  Runloop
//
//  Created by 柳钟宁 on 16/9/23.
//  Copyright © 2016年 YMWM. All rights reserved.
//

#import "NNObserverViewController.h"

@interface NNObserverViewController ()

@end

@implementation NNObserverViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self observerTest];
    
//    [self timer];
    
//    [self timerTest];
}


#pragma mark - 观察者
-(void)observerTest{

    /**
     CFRunLoopObserverRef 是观察者,能够监听 RunLoop 的状态改变,当 RunLoop 的状态发生变化时，观察者就能通过回调接受到这个变化。
    CFRunLoopObserverRef 参数:
     第一个参数:分配存储空间
     第二个参数:监听状态
     第三个参数:是否要持续监听
     第四个参数:优先级
     第五个参数:回调
     */
    // 创建 observer
    CFRunLoopObserverRef observer =  CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        
        switch (activity) {
                
            case kCFRunLoopEntry:
                NSLog(@"即将进入 runloop");
                break;
                
            case kCFRunLoopBeforeTimers:
                NSLog(@"RunLoop 即将处理 timer");
                break;
                
            case kCFRunLoopBeforeSources:
                NSLog(@"RunLoop 即将处理 Sources");
                break;
                
            case kCFRunLoopBeforeWaiting:
                NSLog(@"RunLoop 即将进入休眠");
                break;
                
            case kCFRunLoopAfterWaiting:
                NSLog(@"RunLoop 刚从休眠中唤醒");
                break;
                
            case kCFRunLoopExit:
                NSLog(@"即将退出 RunLoop ");
                break;
                
            default:
                break;
        }
    });
    
    /**
     RunLoop 的模式
     1.NSDefaultRunLoopMode（kCFRunLoopDefaultMode）:默认 Mode,通常主线程是在这个 Mode 下运行
     2.UITrackingRunLoopMode:界面跟踪 Mode,用于 ScrollView 追踪触摸滑动,保证界面滑动时不受其他 Mode 影响
     3.UIInitializationRunLoopMode: 启动程序后的过渡 mode，启动完成后就不再使用
     4.GSEventReceiveRunLoopMode: 接受系统事件的内部 Mode,通常用不到
     5.kCFRunLoopCommonModes（NSRunLoopCommonModes）: 这是一个占位用的 Mode,作为标记 DefaultMode 和 CommonMode 用
     */
    
    /**
     CFRunLoopAddObserver 参数:
     第一个参数:要监听哪个 RunLoop
     第二个参数:监听者
     第三个参数:要监听 RunLoop 在哪种运行模式下的状态
     */
    // 添加观察者：监听 RunLoop 的状态
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
    
    // 释放 Observer
    CFRelease(observer);
}

- (void)timerTest
{
    // 调用了 scheduledTimer 返回的定时器，已经自动被添加到当前 RunLoop 中，默认是NSDefaultRunLoopMode
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    
    // 修改模式
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}


@end

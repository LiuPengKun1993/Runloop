//
//  NNModeViewController.m
//  Runloop
//
//  Created by 柳钟宁 on 16/9/23.
//  Copyright © 2016年 YMWM. All rights reserved.
//

#import "NNTimerController.h"
@interface NNTimerController ()

/** 定时器 */
@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation NNTimerController
static int count = 0;


#pragma mark - GCD 的 timer
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 获得队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    // 创建一个定时器 (dispatch_source_t 本质还是个 OC 对象)
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // GCD的时间参数，一般是纳秒（1秒 == 10的9次方纳秒）
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
    
    uint64_t interval = (uint64_t)(1.0 * NSEC_PER_SEC);
    
    dispatch_source_set_timer(self.timer, start, interval, 0);
    
    // 设置回调
    dispatch_source_set_event_handler(self.timer, ^{
        NSLog(@"------ %@ ------", [NSThread currentThread]);
        count++;
            if (count == 10) {
                // 取消定时器
                dispatch_cancel(self.timer);
                self.timer = nil;
            }
    });
    
    // 启动定时器
    dispatch_resume(self.timer);
}

@end

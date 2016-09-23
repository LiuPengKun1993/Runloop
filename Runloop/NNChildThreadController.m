//
//  NNChildThreadController.m
//  Runloop
//
//  Created by 柳钟宁 on 16/9/23.
//  Copyright © 2016年 YMWM. All rights reserved.
//

#import "NNChildThreadController.h"
#import "NNThread.h"

@interface NNChildThreadController ()

@property (nonatomic,strong) NNThread * thread; 

@end
@implementation NNChildThreadController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.thread = [[NNThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    
    [self.thread start];
}


#pragma mark - 常驻线程方式一
- (void)run {
    @autoreleasepool {
        
        [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
        
        NSLog(@"-- run -- %@ --", [NSThread currentThread]);

        [[NSRunLoop currentRunLoop] run];
        
        NSLog(@"--不会执行--"); //不会执行
        
    }
}

#pragma mark - 常驻线程方式二
- (void)run1{
    @autoreleasepool {
    
    while (1) {
        [[NSRunLoop currentRunLoop] run];
        
         NSLog(@"-- run1 -- %@ --", [NSThread currentThread]);
        
        }
    }
}

#pragma mark - 常驻线程方式三
- (void)run2{
    @autoreleasepool {
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(test) userInfo:nil repeats:YES];
        
     NSLog(@"-- run2 -- %@ --", [NSThread currentThread]);
        
    [[NSRunLoop currentRunLoop] run];
        
    }
}

#pragma mark - 在该线程中自定义事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self performSelector:@selector(test) onThread:self.thread withObject:nil waitUntilDone:NO];
}

- (void)test {
    
    NSLog(@"-- test -- %@ --", [NSThread currentThread]);
    
}

@end

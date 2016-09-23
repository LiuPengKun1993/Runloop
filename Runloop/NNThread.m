//
//  NNThread.m
//  Runloop
//
//  Created by 柳钟宁 on 16/9/23.
//  Copyright © 2016年 YMWM. All rights reserved.
//

#import "NNThread.h"

@implementation NNThread


#pragma mark - 重写了 dealloc 方法, 查看线程是否销毁
- (void)dealloc {

    NSLog(@"线程NNThread被销毁"); //不会打印
}

@end

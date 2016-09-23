//
//  NNImageViewController.m
//  Runloop
//
//  Created by 柳钟宁 on 16/9/23.
//  Copyright © 2016年 YMWM. All rights reserved.
//

#import "NNImageViewController.h"

@interface NNImageViewController ()

@end


@implementation NNImageViewController


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *imageCell = @"imageCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:imageCell];
    
    
    /**
     让设置图片的任务在 NSDefaultRunLoopMode 下进行，当滚动 tableView 的时候，RunLoop 是在 UITrackingRunLoopMode 下进行，不去设置图片，而是当停止的时候，再去设置图片。
     */
    
    // 只在 NSDefaultRunLoopMode 模式下显示图片
    [cell performSelector:@selector(setImage:) withObject:[UIImage imageNamed:@"01"] afterDelay:1.0 inModes:@[NSDefaultRunLoopMode]];
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"-- %zd --", indexPath.row];
    cell.detailTextLabel.text = @"Welcome You !";
    return cell;
}
- (void)dealloc {

    NSLog(@"--- dealloc ---");
}



@end

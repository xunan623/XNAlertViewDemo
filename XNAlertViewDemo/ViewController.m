//
//  ViewController.m
//  XNAlertViewDemo
//
//  Created by xunan on 16/8/25.
//  Copyright © 2016年 xunan. All rights reserved.
//

#import "ViewController.h"
#import "XNAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [XNAlertView showForView:self.view title:@"hello world" hideDelay:1.5];
    
    [XNAlertView showForView:self.view title:@"hello world" hideDelay:10.0 done:^{
        NSLog(@"哈哈");
    }];
}

@end

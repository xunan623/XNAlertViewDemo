//
//  XNAlertView.h
//  XNAlertViewDemo
//
//  Created by xunan on 16/8/25.
//  Copyright © 2016年 xunan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XNAlertView : UIView

/** 标题 */
@property (nonatomic, copy) NSString *title;
/**
 *  初始化得到View
 */
+ (instancetype)setupAlertView;
/**
 *  显示在View上 带回调
 */
+ (void)showForView:(UIView *)view title:(NSString *)title hideDelay:(NSTimeInterval)timeInterval done:(dispatch_block_t)block;
/**
 *  显示在View上 不带回调
 */
+ (void)showForView:(UIView *)view title:(NSString *)title hideDelay:(NSTimeInterval)timeInterval;

/**
 *  显示在View上 不带回调 不带延时
 */
+ (void)showForView:(UIView *)view title:(NSString *)title;

/**
 *  显示
 */
- (void)show:(UIView *)view;

/**
 *  隐藏
 */
- (void)hide;

/**
 *  隐藏带有回调
 */
- (void)hideAfterTimerInterval:(NSTimeInterval)timerInterval done:(dispatch_block_t)block;

@end

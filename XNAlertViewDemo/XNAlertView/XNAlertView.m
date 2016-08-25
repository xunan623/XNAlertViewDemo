//
//  XNAlertView.m
//  XNAlertViewDemo
//
//  Created by xunan on 16/8/25.
//  Copyright © 2016年 xunan. All rights reserved.
//

#import "XNAlertView.h"
#import "UIView+EasyShow.h"

#define SafeRun_Block(block, ...) block ? block(__VA_ARGS__) : nil


static CGFloat const SelfBottomMargin = 54;
static CGFloat const SelfLeftMargin = 20;
static CGFloat const BgViewTopMargin = 10;
static CGFloat const BgViewLeftMargin = 20;
static CGFloat const TitleTopMargin = 10;
static CGFloat const TitleLeftMargin = 15;

@interface XNAlertView() {
    dispatch_block_t _block;
}

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation XNAlertView

+ (instancetype)setupAlertView {
    return [[self alloc] init];
}

- (instancetype)init {
    if (self = [super init]) {
        [self initSelf];
        [self setupSubViews];
    }
    return self;
}

+ (void)showForView:(UIView *)view title:(NSString *)title hideDelay:(NSTimeInterval)timeInterval done:(dispatch_block_t)block {
    XNAlertView *hud = [XNAlertView setupAlertView];
    [hud setTitle:title];
    [hud show:view];
    [hud hideAfterTimerInterval:timeInterval done:block];
}

+ (void)showForView:(UIView *)view title:(NSString *)title hideDelay:(NSTimeInterval)timeInterval {
    [self showForView:view title:title hideDelay:timeInterval done:nil];
}
+ (void)showForView:(UIView *)view title:(NSString *)title {
    [self showForView:view title:title hideDelay:0.0 done:nil];
}
- (void)show:(UIView *)view {
    [view addSubview:self];
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:1.0 options:kNilOptions animations:^{
        self.alpha = 1.0;
        self.transform = CGAffineTransformTranslate(self.transform, 0, -(SelfBottomMargin + self.height));
    } completion:^(BOOL finished) {
        
    }];
}

- (void)hide {
    [self hideAfterTimerInterval:0.0 done:nil];
}


- (void)hideAfterTimerInterval:(NSTimeInterval)timerInterval done:(dispatch_block_t)block {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timerInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.5 animations:^{
            self.alpha = 0.0;
        }completion:^(BOOL finished) {
            SafeRun_Block(block);
        }];
    });
}

- (void)initSelf {
    self.frame = (CGRect){0, [UIScreen mainScreen].bounds.size.height, CGSizeZero};
    self.backgroundColor = [UIColor clearColor];
    self.alpha = 0.0;
}

- (void)setupSubViews {
    [self addSubview:self.contentView];
    [_contentView addSubview:self.titleLabel];
}


#pragma mark Setting & Getting

- (void)setTitle:(NSString *)title {
    _title = title;
    
    _titleLabel.text = title;
    _titleLabel.width = 200;
    [_titleLabel sizeToFit];
    self.size = CGSizeMake(_titleLabel.width + BgViewLeftMargin * 2,
                           _titleLabel.height + (TitleTopMargin + BgViewTopMargin) * 2);
    self.centerX = [UIScreen mainScreen].bounds.size.width / 2.0;
    _contentView.size = CGSizeMake(_titleLabel.width + TitleLeftMargin * 2,
                                   _titleLabel.height + TitleTopMargin * 2);
    _contentView.center = CGPointMake(self.width/2.0, self.height/2.0);

    
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(TitleLeftMargin,
                                                                TitleTopMargin,
                                                                [UIScreen mainScreen].bounds.size.width - (SelfLeftMargin+BgViewLeftMargin) * 2, 0)];
        _titleLabel.numberOfLines = 0;
        _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:14.0f];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectZero];
        _contentView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.8];
        _contentView.layer.cornerRadius = 5.0f;
        _contentView.layer.masksToBounds = YES;
    }
    return _contentView;
}


@end

//
//  SubmitView.m
//  SubmitAnimation
//
//  Created by David on 16/2/19.
//  Copyright © 2016年 com.david. All rights reserved.
//

#import "StartView.h"

#import "YKFStartButton.h"
#import "YKFPauseButton.h"
#import "YKFContinueButton.h"
#import "YKFAbandonButton.h"
#import "YKFFrameCode.h"
#import <PureLayout.h>

@interface StartView ()

@property(nonatomic, strong) YKFStartButton *startButton;
@property(nonatomic, strong) YKFPauseButton *pauseButton;
@property(nonatomic, strong) YKFAbandonButton *abandonButton;
@property(nonatomic, strong) YKFContinueButton *continueButton;
@property(strong, nonatomic) YKFFrameCode *frameCode;

@property(nonatomic, assign) CGRect originRect;
@property(nonatomic, assign) CGPoint viewCenter;

@end

@implementation StartView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        _originRect = self.bounds;
//        NSLog(@"%@",NSStringFromCGRect(self.bounds));
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    YKFFrameCode *frame = [[YKFFrameCode alloc] init];
    self.frameCode = frame;
    //开始,暂停按钮
    YKFStartButton *startButton = [[YKFStartButton alloc] init];
    YKFPauseButton *pauseButton = [[YKFPauseButton alloc] init];
    self.startButton = startButton;
    self.pauseButton = pauseButton;
    [self addSubview:pauseButton];
    [self addSubview:startButton];
    
    [_startButton addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_pauseButton addTarget:self action:@selector(pauseBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //继续,放弃按钮
    YKFContinueButton *continuBtn = [[YKFContinueButton alloc] init];
    YKFAbandonButton *abandonBtn = [[YKFAbandonButton alloc] init];
    self.continueButton = continuBtn;
    self.abandonButton  = abandonBtn;
    continuBtn.hidden = YES;
    abandonBtn.hidden = YES;
    [self addSubview:continuBtn];
    [self addSubview:abandonBtn];
    
    [_continueButton addTarget:self action:@selector(continueBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_abandonButton addTarget:self action:@selector(abandonBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //布局代码
    [frame     localStartButton:startButton];
    [frame     localPauseButton:pauseButton];
    [frame     localPauseButton:abandonBtn];
    [frame     localPauseButton:continuBtn];
}

- (void)submitBtnClick{
    [self.delegate start];
    [self.delegate displayTime];
    //缩小动画
    [self scaleLayerAnimtaion];
    
    [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        //隐藏按钮
        [_startButton setHiddenSubmitButton];
        
    } completion:^(BOOL finished) {
        _startButton.hidden = YES;
        [_pauseButton setShowPauseButton];
        
    }];
}

- (void)pauseBtnClick
{
    [self.delegate timePause];
    [self setNeedsUpdateConstraints];
    // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
    [self updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.4  animations:^{
        [_frameCode localContinueButton:_continueButton];
        [_frameCode localAbandonButton:_abandonButton];
        _abandonButton.hidden = NO;
        _continueButton.hidden = NO;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        _pauseButton.hidden = YES;
    }];
}

- (void)continueBtnClick
{
    [self.delegate timeStartAgain];
    [self setNeedsUpdateConstraints];
    // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
    [self updateConstraintsIfNeeded];
    [UIView animateWithDuration:0.4  animations:^{
        [_frameCode localPauseButton:_continueButton];
        [_frameCode localPauseButton:_abandonButton];
        _pauseButton.hidden = NO;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        _continueButton.hidden = YES;
        _abandonButton.hidden = YES;
    }];
 
}

- (void)abandonBtnClick
{
    [self.delegate resetTimeProgress];
    [UIView animateWithDuration:0.4  animations:^{
        [_startButton.layer removeAllAnimations];
        [_startButton setShowSubmitButton];
    } completion:^(BOOL finished) {
        _continueButton.hidden = YES;
        _abandonButton.hidden = YES;
    }];
}



//缩放动画
- (void)scaleLayerAnimtaion {
    CABasicAnimation *anima = [CABasicAnimation animation];
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    anima.duration = 0.4;
    anima.keyPath = @"bounds";
    anima.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 80, 32)];
    anima.removedOnCompletion = NO;
    anima.fillMode = kCAFillModeForwards;
    [_startButton.layer addAnimation:anima forKey:nil];
}




@end

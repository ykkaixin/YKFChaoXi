//
//  YKFPresentAnimation.m
//  PureLayout
//
//  Created by Nnnd on 2017/4/11.
//  Copyright © 2017年 Nnnd. All rights reserved.
//

#import "YKFPresentAnimation.h"

@implementation YKFPresentAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.8f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    //获得要呈现的 ViewController
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    //UIVisualEffectView是一个提供特殊视觉效果的类,初始化方法传入UIBlurEffect效果,BlurEffect有三种特效Light,dark,extraLight
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular]];
    effectView.frame = containerView.frame;
    
    [ containerView insertSubview:effectView belowSubview: toVC.view];
    
    int toViewWidth = containerView.frame.size.width ;
    int toViewHeight = containerView.frame.size.height ;
    
    toVC.view.center = containerView.center;
    toVC.view.bounds = CGRectMake( 0,  0,  toViewWidth, 300);
    toVC.view.alpha = 0.7;
    
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0.0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         toVC.view.bounds = CGRectMake(0, 0, toViewWidth, toViewHeight);
                     } completion:^(BOOL finished) {
                         // 5. Tell context that we completed.
                         [transitionContext completeTransition:YES];
                     }];
}

@end

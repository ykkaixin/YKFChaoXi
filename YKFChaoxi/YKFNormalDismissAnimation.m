//
//  YKFNormalDismissAnimation.m
//  PureLayout
//
//  Created by Nnnd on 2017/4/11.
//  Copyright © 2017年 Nnnd. All rights reserved.
//

#import "YKFNormalDismissAnimation.h"

@implementation YKFNormalDismissAnimation

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.8f;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect initFrame = [transitionContext initialFrameForViewController:fromVc];
    CGRect finalFrame = CGRectOffset(initFrame, 0, screenBounds.size.height);
    
    // 3.添加试图,并移除 fromView
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVc.view];
    [containerView sendSubviewToBack:toVc.view];
    
    // 4. Do animate now
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        fromVc.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}


@end

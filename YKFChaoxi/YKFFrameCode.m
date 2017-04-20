//
//  YKFFrameCode.m
//  PureLayout
//
//  Created by Nnnd on 2017/4/6.
//  Copyright © 2017年 Nnnd. All rights reserved.
//

#import "YKFFrameCode.h"

@implementation YKFFrameCode

- (void)localTopView:(UIView *)topView
{
    [topView autoSetDimensionsToSize:CGSizeMake(0, 50)];
    [topView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10.f];
    [topView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:5.f];
    [topView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5.f];

}

- (void)localLeftButton:(UIButton *)leftButton andRightButton:(UIButton *)rightButton
{
    [leftButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10.f];
    [leftButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15.f];
    [leftButton autoSetDimensionsToSize:CGSizeMake(24, 24)];
    
    [rightButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10.f];
    [rightButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15.f];
    [rightButton autoSetDimensionsToSize:CGSizeMake(24, 24)];
}

- (void)localTimeView:(UIView *)timeView
{
    [timeView autoAlignAxisToSuperviewAxis:ALAxisVertical];
   // [timeView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:120.f];
   // [timeView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:120.f];
    [timeView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:140];
    [timeView autoSetDimensionsToSize:CGSizeMake(100, 60)];
}

- (void)localStartButton:(UIView *)startView accordingTimeView:(UIView *)topView
{
    [startView autoAlignAxisToSuperviewAxis:ALAxisVertical];
   // [startView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:topView withOffset:270];
    [startView  autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:200];
    [startView autoSetDimensionsToSize:CGSizeMake(0, 40)];
    [startView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:50.f];
    [startView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:50.f];
    
}

- (void)localBottomView:(UIView *)bottomView accordingTopView:(UIView *)topView
{
    [bottomView autoAlignAxisToSuperviewAxis:ALAxisVertical];
//    [bottomView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:topView withOffset:370];
    [bottomView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:100];
    [bottomView autoSetDimensionsToSize:CGSizeMake(170, 30)];
}

//startView 子试图
- (void)localAbandonButton:(UIView *)abandonButton
{
    [abandonButton autoSetDimensionsToSize:CGSizeMake(80, 32)];
    [abandonButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [abandonButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:120.f];
    [abandonButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20.f];
}

- (void)localContinueButton:(UIView *)continueButton
{
    [continueButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [continueButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20.f];
    [continueButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:120.f];
    [continueButton autoSetDimensionsToSize:CGSizeMake(80, 32)];

}

- (void)localStartButton:(UIView *)startButton
{
    [startButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [startButton autoSetDimensionsToSize:CGSizeMake(110, 32)];
    [startButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
}

- (void)localPauseButton:(UIView *)pauseButton
{
    [pauseButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [pauseButton autoSetDimensionsToSize:CGSizeMake(80, 32)];
    [pauseButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

@end

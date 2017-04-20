//
//  YKFFrameCode.h
//  PureLayout
//
//  Created by Nnnd on 2017/4/6.
//  Copyright © 2017年 Nnnd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <PureLayout/PureLayout.h>

@interface YKFFrameCode : NSObject

- (void)localTopView:(UIView *)topView;
- (void)localLeftButton:(UIButton *)leftButton andRightButton:(UIButton *)rightButton;
- (void)localTimeView:(UIView *)timeView;
- (void)localStartButton:(UIView *)startView accordingTimeView:(UIView *)topView;
- (void)localBottomView:(UIView *)bottomView accordingTopView:(UIView *)topView;

//startView 的子试图
- (void)localAbandonButton:(UIView *)abandonButton;
- (void)localContinueButton:(UIView *)continueButton;
- (void)localStartButton:(UIView *)startButton;
- (void)localPauseButton:(UIView *) pauseButton;

@end

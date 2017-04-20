//
//  ViewController.h
//  YKFChaoxi
//
//  Created by Nnnd on 2017/4/20.
//  Copyright © 2017年 Nnnd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PureLayout/PureLayout.h>
//Frame
#import "YKFFrameCode.h"
//View
#import "YKFTopView.h"
#import "YKFTimeView.h"
#import "YKFStartButton.h"
#import "YKFBottomView.h"
#import "StartView.h"

@interface YKFMainViewController : UIViewController <UIScrollViewDelegate,
YKFTopViewDelegate,
UIViewControllerTransitioningDelegate,
YKFTimeViewDelegate,StartViewDelegate>



@end




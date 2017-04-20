//
//  SubmitView.h
//  SubmitAnimation
//
//  Created by David on 16/2/19.
//  Copyright © 2016年 com.david. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol StartViewDelegate <NSObject>

- (void)start;
- (void)displayTime;
- (void)timePause;
- (void)timeStartAgain;
- (void)resetTimeProgress;

@end

@interface StartView : UIView

@property(nonatomic,weak)id<StartViewDelegate>delegate;

@end

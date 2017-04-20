//
//  YKFTimeView.h
//  PureLayout
//
//  Created by Nnnd on 2017/4/6.
//  Copyright © 2017年 Nnnd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YKFTimeViewDelegate <NSObject>

@end

@interface YKFTimeView : UIView

@property(nonatomic)NSInteger minute;
@property(nonatomic)NSInteger minute2;
@property(nonatomic)NSInteger second;
@property(nonatomic)NSInteger second2;
@property(nonatomic)CGFloat progress;
@property(strong, nonatomic)UIView *frontView;
@property(strong, nonatomic)UIView *backView;
@property(nonatomic,strong)UILabel *timeLabel;

@property(nonatomic,weak)id<YKFTimeViewDelegate>delegate;

+ (instancetype)initWithBgrColor:(UIColor *)color bgrAlpha:(CGFloat) b;
- (void)drawProgress:(CGFloat)progress;

@end

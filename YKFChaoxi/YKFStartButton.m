//
//  SubmitButton.m
//  SubmitAnimation
//
//  Created by David on 16/2/22.
//  Copyright © 2016年 com.david. All rights reserved.
//

#import "YKFStartButton.h"

@implementation YKFStartButton



- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = btnColor;
        self.layer.cornerRadius = 16;;
        self.layer.masksToBounds = YES;
        [self setTitle:@"开始关注" forState:UIControlStateNormal];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize: 14];
    }
    return self;
}

- (void)setHiddenSubmitButton {
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void)setShowSubmitButton {
    self.hidden = NO;
    self.backgroundColor = btnColor;
    self.layer.borderWidth = 0;
}

@end

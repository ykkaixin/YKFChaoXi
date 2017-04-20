//
//  tuichu.m
//  SubmitView
//
//  Created by Nnnd on 17/2/5.
//  Copyright © 2017年 com.david. All rights reserved.
//

#import "YKFPauseButton.h"

@implementation YKFPauseButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.cornerRadius = 16;
        self.layer.masksToBounds = YES;
        [self setTitle:@"暂停" forState:UIControlStateNormal];
        self.hidden = YES;
    }
    return self;
}
- (void)setShowPauseButton {
    self.hidden = NO;
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
}

@end

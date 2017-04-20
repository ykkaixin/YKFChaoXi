//
//  YKFAbandonButton.m
//  PureLayout
//
//  Created by Nnnd on 2017/4/18.
//  Copyright © 2017年 Nnnd. All rights reserved.
//

#import "YKFAbandonButton.h"

@implementation YKFAbandonButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.cornerRadius = 16;
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        [self setTitle:@"放弃" forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize: 16];
        self.hidden = YES;
    }
    return self;
}

@end

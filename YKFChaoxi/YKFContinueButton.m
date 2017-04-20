//
//  YKFContinueButton.m
//  PureLayout
//
//  Created by Nnnd on 2017/4/18.
//  Copyright © 2017年 Nnnd. All rights reserved.
//

#import "YKFContinueButton.h"

@implementation YKFContinueButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        self.layer.cornerRadius = 16;
        self.layer.masksToBounds = YES;
        [self setTitle:@"继续" forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize: 16];
        self.hidden = YES;
    }
    return self;
}

@end

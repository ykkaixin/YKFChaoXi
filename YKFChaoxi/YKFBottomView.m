//
//  YKFBottomView.m
//  PureLayout
//
//  Created by Nnnd on 2017/4/9.
//  Copyright © 2017年 Nnnd. All rights reserved.
//

#import "YKFBottomView.h"

@implementation YKFBottomView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10,140,30)];
        label.text = @"努力爬坑的 IOS 程序员";
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize: 13];
        [self addSubview:label];
    }
    return self;
}

@end

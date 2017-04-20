//
//  YKFTopView.m
//  YKFChaoXi
//
//  Created by Nnnd on 2017/4/6.
//  Copyright © 2017年 Nnnd. All rights reserved.
//

#import "YKFTopView.h"
#import <PureLayout/PureLayout.h>

@interface YKFTopView()

@property(nonatomic,strong)UIButton *leftButton;
@property(nonatomic,strong)UIButton *rightButton;

@end

@implementation YKFTopView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(!self) return nil;
    
    [self addleftandRightButton];
    
    return self ;
}

- (void)addleftandRightButton
{
    YKFFrameCode *frame = [[YKFFrameCode alloc] init ];
    //左边按钮
    UIButton *btn = [[UIButton alloc] init];
    
    self.leftButton = btn;
    [self addSubview:btn];
    btn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"3.png"]];
    [btn addTarget:self.delegate action:@selector(presentleftView) forControlEvents:UIControlEventTouchUpInside];
    
    //右边按钮
    UIButton *right = [[UIButton alloc] init];
    
    self.rightButton = right;
    [self addSubview:right];
    right.backgroundColor = [UIColor blackColor];
    
    [frame localLeftButton:btn andRightButton:right];
}

- (void)presentViewcontroller
{
    [self.delegate presentleftView];
}

@end

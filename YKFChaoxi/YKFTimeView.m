//
//  YKFTimeView.m
//  PureLayout
//
//  Created by Nnnd on 2017/4/6.
//  Copyright © 2017年 Nnnd. All rights reserved.
//

#import "YKFTimeView.h"
#import "YKFFrameCode.h"
#import <PureLayout.h>

#define timelabelFont [UIFont systemFontOfSize:32]

@implementation YKFTimeView

+ (instancetype)initWithBgrColor:(UIColor *)color bgrAlpha:(CGFloat) b
{
    YKFTimeView *time = [[YKFTimeView alloc] init];
    time.backgroundColor = [color colorWithAlphaComponent:b];
    return time;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(!self) return nil;
    _minute2 = 1;
    _second = 00;
    _second2 = 59;
    _progress = -1*M_PI_2;
    
    [self setUp];
    
    return self;
}

- (void)setUp
{
    YKFFrameCode *frame = [[YKFFrameCode alloc] init];
    
    UIView *contaninView = [[UIView alloc] init];
    UIView *frontView    = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 60)];
    UIView *backView     = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 60)];
    
    [self addSubview:contaninView];
    [contaninView addSubview:frontView];
    [contaninView insertSubview:backView belowSubview:frontView];
    
    self.frontView = frontView;
    self.backView   = backView;
    backView.hidden = YES;
    
    [frame localTimeView:contaninView];
    
    //大家好标签
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 60)];
    [frontView addSubview:label];
    
    label.text = @"大家好";
    label.font = [UIFont systemFontOfSize:34];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
 
   
    //时间 label
    UILabel *timelabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 60)];
    self.timeLabel = timelabel;
    [backView addSubview:timelabel];
    
    NSString *a = [[NSString alloc] initWithFormat:@"%ld:%ld0",(long)_minute,(long)_second];
    timelabel.text = a;
    timelabel.font = timelabelFont;
    timelabel.textColor = [UIColor whiteColor];
    timelabel.textAlignment = NSTextAlignmentCenter;
    
   
   
    
}

- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    //中心
    CGPoint center;
    center.x = (bounds.origin.x + bounds.size.width/ 2.0);
    center.y =  bounds.origin.y + bounds.size.height/3.5;
    
    //背景图层
    CAShapeLayer *bgr = [CAShapeLayer layer];
    bgr.fillColor = nil;
    bgr.frame = self.bounds ;
    
    //填充图层
    CAShapeLayer *fg = [CAShapeLayer layer];
    fg.fillColor = nil;
    bgr.frame = self.bounds;
    
    [self.layer addSublayer:bgr];
    [self.layer addSublayer:fg];
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    UIBezierPath *path2 = [[UIBezierPath alloc ] init];
    
    float radius = ( [[UIScreen mainScreen]bounds].size.width - 40)/3.5 ;
    
    //前图层
    [path addArcWithCenter:center radius:radius startAngle:-1*M_PI_2
                  endAngle:_progress
                 clockwise:YES];
    fg.strokeColor = [UIColor whiteColor].CGColor;
    fg.lineWidth = 3.0;
    fg.lineCap = kCALineCapRound;
    fg.path = path.CGPath;
    
    
    //背景图层
    [path2 addArcWithCenter:center radius:radius startAngle:0
                   endAngle:M_PI * 2
                  clockwise:YES];
    bgr.strokeColor = [UIColor grayColor].CGColor;
    bgr.lineWidth = 4.0;
    bgr.opacity = 1;
    bgr.path = path2.CGPath;//??
    
}

- (void)drawProgress:(CGFloat)progress
{
    _progress = progress;
    [self setNeedsDisplay];
}

- (NSInteger)minute
{
    return 1;
}
@end

//
//  ViewController.m
//  YKFChaoxi
//
//  Created by Nnnd on 2017/4/20.
//  Copyright © 2017年 Nnnd. All rights reserved.
//

#import "YKFMainViewController.h"

#import "YKFMainViewController.h"
#import "YKFPresentAnimation.h"
#import "YKFNormalDismissAnimation.h"
#import "YKFModelTableViewController.h"

@interface YKFMainViewController ()

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *page;
@property(nonatomic,strong)UIImageView  *imageView;
@property(nonatomic,strong)YKFTimeView  *timeView;
@property(nonatomic,strong)StartView    *startView;
@property(nonatomic,strong)NSTimer      *time;
@property(nonatomic       )CGFloat      timeProgress;
@property(nonatomic,copy  )NSMutableArray *encaseTime;

@property(nonatomic)YKFPresentAnimation *preAnimation;
@property(nonatomic)YKFNormalDismissAnimation *dissAnimation;

@end

@implementation YKFMainViewController

#pragma mark - Life Cycle


- (void)viewDidLoad {
    _preAnimation = [YKFPresentAnimation new];
    [super viewDidLoad];
    _encaseTime = [[NSMutableArray alloc] init];
    [self setUp];
    
}

- (void)setUp
{
    //添加 scrollView
    CGRect screenRect = self.view.bounds;
    CGRect bigRect = screenRect;
    
    UIImageView *ima = [[UIImageView alloc]init];
    ima.frame = CGRectMake(0, 0,screenRect.size.width,screenRect.size.height);
    ima.image = [UIImage imageNamed:@"1.jpg"];
    [self.view addSubview:ima];
    
    
    bigRect.size.width *= 2.0;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    
    scrollView.contentSize = CGRectMake(0, 0, bigRect.size.width*2, screenRect.size.height).size;
    [scrollView setPagingEnabled:YES];
    
    self.scrollView = scrollView;
    
    self.scrollView.delegate = self;
    
    [self.view addSubview:scrollView];
    
    YKFTimeView *v = [YKFTimeView initWithBgrColor:[UIColor blueColor] bgrAlpha:0.3];
    v.frame = screenRect;
    self.timeView = v;
    
    screenRect.origin.x += screenRect.size.width;
    
    YKFTimeView *v1 = [YKFTimeView initWithBgrColor:[UIColor yellowColor] bgrAlpha:0.3];
    v1.frame = screenRect;
    
    [scrollView addSubview:v];
    [scrollView addSubview:v1];
    
    _encaseTime[0] = v;
    _encaseTime[1] = v1;
    //顶部试图
    YKFTopView *topView = [[YKFTopView alloc]init];
    [self.view addSubview:topView];
    
    //开始试图
    StartView *startView = [[StartView alloc] init];
    startView.delegate = self;
    [self.view addSubview:startView];
    
    //底部 label
    YKFBottomView *bottomLabel = [[YKFBottomView alloc] init];
    [self.view addSubview: bottomLabel];
    
    //布局代码
    YKFFrameCode *frame = [[YKFFrameCode alloc] init];
    
    [frame localTopView:topView];
    [frame localStartButton:startView accordingTimeView:topView];
    [frame localBottomView:bottomLabel accordingTopView:topView];
    
    //页数控制
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    
    pageControl.numberOfPages = 3;
    pageControl.currentPage = 0;
    self.page = pageControl;
    [self.view addSubview:pageControl];
    
    [pageControl autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [pageControl autoSetDimensionsToSize:CGSizeMake(20, 20)];
    [pageControl autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:200];
}

#pragma mark -StartViewDelegate
- (void)start
{
    self.time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startTime) userInfo:nil repeats:true];
    _timeProgress = 0;
    if(_timeView.minute > 0){
        _timeView.minute--;
    }
}

-(void)displayTime
{
    [UIView transitionFromView:_timeView.frontView
                        toView:_timeView.backView
                      duration:0.4f
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    completion:NULL];
    _timeView.backView.hidden = NO;
}

- (void)startTime
{
    
    NSInteger second = _timeView.second2;
    NSInteger minute = _timeView.minute;
    NSInteger minute2 = _timeView.minute2;
    
    _timeProgress = _timeProgress + (CGFloat)1/(CGFloat)(60*minute2);
    _timeView.second2--;
    
    while(second == 0){
        if (minute ==0 && second == 0) {
            [_time invalidate];
            break;
        }
        _timeView.minute--;
        second = 59;
    }
    [_timeView drawProgress:-M_PI_2 + M_PI * 2 * _timeProgress];
    NSString *time =  [[NSString alloc]initWithFormat:@"%02ld:%02ld",(long)minute-1,(long)second];
    _timeView.timeLabel.text = time;
}

- (void)timePause
{
    [self.time invalidate];
}

- (void)timeStartAgain
{
    [UIView transitionFromView:_timeView.frontView
                        toView:_timeView.backView
                      duration:0.4f
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    completion:NULL];
    _timeView.backView.hidden =NO;
    self.time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startTime) userInfo:nil repeats:true];
    [self startTime];
}

- (void)resetTimeProgress
{
    [self.time invalidate];
    [UIView transitionFromView:_timeView.backView
                        toView:_timeView.frontView
                      duration:0.4f
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    completion:NULL];
    
    NSString *a = [[NSString alloc] initWithFormat:@"%02ld:%02ld",(long)_timeView.minute,(long)_timeView.second];
    _timeView.second2 = 59;
    _timeView.timeLabel.text = a;
    [_timeView drawProgress:-M_PI_2];
}

#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)sender {
    
    NSInteger page1 = _scrollView.contentOffset.x / (self.view.bounds.size.width-40);
    CGFloat a = _scrollView.contentOffset.x / 10;
    self.imageView.transform = CGAffineTransformMakeTranslation(-a, 0);
    _page.currentPage = page1;
    if (page1 == 0) {
        self.timeView = _encaseTime[0];
    }else if(page1 ==1){
        self.timeView = _encaseTime[1];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    
    
}


#pragma mark - YKFTopViewController
- (void)presentleftView
{
    YKFModelTableViewController *model = [[YKFModelTableViewController alloc] init];
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:model];
    navigation.transitioningDelegate = self;
    navigation.modalPresentationStyle = UIModalPresentationCustom;
    self.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:navigation animated:YES completion:nil];
}


#pragma mark - YKFTimeView



#pragma mark - TransitionDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return  self.preAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismiss{
    return self.dissAnimation;
}




@end

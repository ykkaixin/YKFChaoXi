//
//  YKFTopView.h
//  YKFChaoXi
//
//  Created by Nnnd on 2017/4/6.
//  Copyright © 2017年 Nnnd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YKFFrameCode.h"

@protocol YKFTopViewDelegate <NSObject>

-(void)presentleftView;

@end

@interface YKFTopView : UIView

@property(nonatomic,weak)id<YKFTopViewDelegate>delegate;

@end

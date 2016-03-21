//
//  PanAnimator.h
//  PanPush
//
//  Created by lpc on 16/3/16.
//  Copyright © 2016年 lpc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+TransitionContextHelper.h"
@protocol PanAnimatorDelegate;

@interface PanAnimator : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic,weak) id<PanAnimatorDelegate> delegate;
@end


@protocol PanAnimatorDelegate <NSObject>
@required
/**
 *  动画结束时的回调,必须实现.
 */
- (void)animator:(PanAnimator *)animator completeWithTransitionFinished:(BOOL)finish;

@end
//
//  PanAnimator.m
//  PanPush
//
//  Created by lpc on 16/3/16.
//  Copyright © 2016年 lpc. All rights reserved.
//

#import "PanAnimator.h"

@implementation PanAnimator

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.35;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    [NSException raise:NSInternalInconsistencyException format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

@end

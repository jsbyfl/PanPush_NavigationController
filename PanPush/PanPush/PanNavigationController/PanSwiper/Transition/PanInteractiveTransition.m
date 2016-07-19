//
//  PanInteractiveTransition.m
//  PanPush
//
//  Created by Paddy-long on 16/3/19.
//  Copyright © 2016年 lpc. All rights reserved.
//

#import "PanInteractiveTransition.h"

@implementation PanInteractiveTransition

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.completionCurve = UIViewAnimationCurveEaseInOut;
}


#pragma mark -- Events --
- (void)cancelInteractiveTransition;
{
    [self resetTransitionSpeed:NO];
    [super cancelInteractiveTransition];
}

- (void)finishInteractiveTransition
{
    [self resetTransitionSpeed:YES];
    [super finishInteractiveTransition];
}

- (void)resetTransitionSpeed:(BOOL)finish
{    
    CGFloat progress = self.percentComplete;
    CGFloat speed = 0.0f;
    if (finish) {
        speed = [self finishSpeedWithProgress:progress];
    }
    else {
        speed = [self cancelSpeedWithProgress:progress];
    }
    self.completionSpeed = speed;
}

#pragma mark -- Custom Speed --
- (CGFloat)finishSpeedWithProgress:(CGFloat)progress
{
    if (progress < 0.3) {
        return 0.9;
    }
    else if (progress >= 0.3 && progress < 0.5) {
        return 0.8;
    }
    else if (progress >= 0.5 && progress < 0.7) {
        return 0.6;
    }
    else {
        return 0.5;
    }
    return 1.0;
}

- (CGFloat)cancelSpeedWithProgress:(CGFloat)progress
{
    if (progress < 0.3) {
        return 0.5;
    }
    else if (progress >= 0.3 && progress < 0.5) {
        return 0.6;
    }
    else if (progress >= 0.5 && progress < 0.7) {
        return 0.8;
    }
    else {
        return 0.9;
    }
    return 1.0;
}

@end

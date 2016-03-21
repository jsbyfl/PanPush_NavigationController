//
//  PanAnimator.m
//  PanPush
//
//  Created by lpc on 16/3/16.
//  Copyright © 2016年 lpc. All rights reserved.
//

#import "PanPopAnimator.h"

@implementation PanPopAnimator
@synthesize delegate = _delegate;

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    //上一个controller
    UIViewController *previousController = [(NSObject *)transitionContext transition_toViewController];
    //当前controller
    UIViewController *currentController = [(NSObject *)transitionContext transition_fromViewController];
    UIView *_containerView = [transitionContext containerView];
    [_containerView insertSubview:previousController.view belowSubview:currentController.view];

    //设置动画开始时,上一个controller的偏移量
    CGFloat previousControllerXTranslation = - CGRectGetWidth(_containerView.bounds) * 0.3f;
    previousController.view.transform = CGAffineTransformMakeTranslation(previousControllerXTranslation, 0);

    //设置左侧阴影
    [currentController.view addLeftSideShadowWithFading];

    //黑色蒙层
    UIView *dimmingView = [[UIView alloc] initWithFrame:previousController.view.bounds];
    dimmingView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.2f];
    [previousController.view addSubview:dimmingView];

    BOOL previousClipsToBounds = currentController.view.clipsToBounds;
    currentController.view.clipsToBounds = NO;


    //TabbarController hidesBottomBarWhenPushed
    UITabBarController *tabBarController = previousController.tabBarController;
    UINavigationController *navController = previousController.navigationController;
    UITabBar *tabBar = tabBarController.tabBar;
    BOOL shouldAddTabBarBackToTabBarController = NO;
    BOOL hidesBottomBarWhenPushed = currentController.hidesBottomBarWhenPushed;
    BOOL tabBarControllerContainsToViewController = [tabBarController.viewControllers containsObject:previousController];
    BOOL tabBarControllerContainsNavController = [tabBarController.viewControllers containsObject:navController];
    BOOL isToViewControllerFirstInNavController = [navController.viewControllers firstObject] == previousController;
    if (hidesBottomBarWhenPushed && tabBar && (tabBarControllerContainsToViewController || (isToViewControllerFirstInNavController && tabBarControllerContainsNavController))) {
        [previousController.view addSubview:tabBar];
        shouldAddTabBarBackToTabBarController = YES;
        CGFloat transform_tabbar = (previousController.view.frame.size.width);
        tabBar.transform = CGAffineTransformMakeTranslation(transform_tabbar, 0);
    }


    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        if (shouldAddTabBarBackToTabBarController) {
            tabBar.transform = CGAffineTransformIdentity;
        }
        
        //设置动画结束时,2个Controller的偏移量 (目标controller必须重置)
        previousController.view.transform = CGAffineTransformIdentity;
        CGFloat transform_tx = previousController.view.frame.size.width;
        currentController.view.transform = CGAffineTransformMakeTranslation(transform_tx, 0);
        dimmingView.alpha = 0.0f;

    } completion:^(BOOL finished) {
        if (shouldAddTabBarBackToTabBarController) {
            [tabBarController.view addSubview:tabBar];
            tabBar.transform = CGAffineTransformIdentity;
        }

        [dimmingView removeFromSuperview];
        //重置上一个controller的偏移量(当前的controller不在栈里)
        previousController.view.transform = CGAffineTransformIdentity;
        previousController.view.clipsToBounds = previousClipsToBounds;

        BOOL didComplete = ![transitionContext transitionWasCancelled];
        [transitionContext completeTransition:didComplete];
        [self.delegate animator:self completeWithTransitionFinished:didComplete];
    }];
}


@end

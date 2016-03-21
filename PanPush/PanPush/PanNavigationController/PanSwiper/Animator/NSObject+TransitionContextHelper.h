//
//  NSObject+TransitionContextHelper.h
//  PanPush
//
//  Created by Paddy-long on 16/3/18.
//  Copyright © 2016年 lpc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (TransitionContextHelper)

- (UIView *)transition_toView;
- (UIView *)transition_fromView;

- (UIViewController *)transition_toViewController;
- (UIViewController *)transition_fromViewController;

@end


@interface UIView (TransitionShadow)

- (void)addLeftSideShadowWithFading;

@end

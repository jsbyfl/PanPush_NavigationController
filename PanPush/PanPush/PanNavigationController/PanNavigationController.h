//
//  PanNavigationController.h
//  PanPush
//
//  Created by lpc on 16/3/16.
//  Copyright © 2016年 lpc. All rights reserved.
//
//  代码地址:https://github.com/jsbyfl/PanPush_NavigationController.git

#import <UIKit/UIKit.h>
#import "PanSwiper.h"

@interface PanNavigationController : UINavigationController

/**
 *  是否禁止右滑返回(Defualt is NO)
 */
@property (nonatomic,assign) BOOL isForbidDragBack;

/**
 *  设置左滑push页面的代理
 *
 *  @param panPushDelegate 左滑push页面的代理
 */
- (void)setNextViewControllerDelegate:(id <PanPushToNextViewControllerDelegate>)panPushDelegate;

@end

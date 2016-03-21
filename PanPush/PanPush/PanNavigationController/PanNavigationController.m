//
//  PanNavigationController.m
//  PanPush
//
//  Created by lpc on 16/3/16.
//  Copyright © 2016年 lpc. All rights reserved.
//

#import "PanNavigationController.h"

@interface PanNavigationController ()

@property (nonatomic,readwrite,strong) PanSwiper *swiper;

@end

@implementation PanNavigationController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.swiper = [[PanSwiper alloc] initWithNavigationController:self];
}


#pragma mark -- Setters and getters --

- (void)setIsForbidDragBack:(BOOL)isForbidDragBack{
    self.swiper.isForbidDragBack = isForbidDragBack;
}

- (BOOL)isForbidDragBack{
    return self.swiper.isForbidDragBack;
}

- (void)setNextViewControllerDelegate:(id<PanPushToNextViewControllerDelegate>)panPushDelegate{
    self.swiper.panPushDelegate = panPushDelegate;
}

@end

//
//  FirstViewController.m
//  PanPush
//
//  Created by lpc on 16/3/16.
//  Copyright © 2016年 lpc. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController () <PanPushToNextViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation FirstViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    PanNavigationController *nav = (PanNavigationController *)self.navigationController;
    [nav setNextViewControllerDelegate:self];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    PanNavigationController *nav = (PanNavigationController *)self.navigationController;
    [nav setNextViewControllerDelegate:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSInteger count = self.navigationController.viewControllers.count;
    NSString *name = NSStringFromClass([self class]);
    self.label.text = [NSString stringWithFormat:@"第 %@ 个\n%@",@(count),name];
}


#pragma mark -- Button Response --
- (IBAction)push:(id)sender {
    SecondViewController *controller = [[SecondViewController alloc] initWithNibName:NSStringFromClass([SecondViewController class]) bundle:nil];
//    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)popToRoot:(id)sender {
    NSInteger count = self.navigationController.viewControllers.count;
    if (count > 1) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}


#pragma mark -- PanSwiper Delegate --
- (UIViewController *)swiperBeginPanPushToNextController:(PanSwiper *)swiper
{
    SecondViewController *controller = [[SecondViewController alloc] initWithNibName:NSStringFromClass([SecondViewController class]) bundle:nil];
    controller.hidesBottomBarWhenPushed = YES;
    return controller;
}

@end

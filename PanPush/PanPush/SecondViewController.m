//
//  SecondViewController.m
//  PanPush
//
//  Created by lpc on 16/3/16.
//  Copyright © 2016年 lpc. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<PanPushToNextViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation SecondViewController

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


- (IBAction)push:(id)sender {
    FirstViewController *controller = [[FirstViewController alloc] initWithNibName:NSStringFromClass([FirstViewController class]) bundle:nil];
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
    FirstViewController *controller = [[FirstViewController alloc] initWithNibName:NSStringFromClass([FirstViewController class]) bundle:nil];
    return controller;
}

@end

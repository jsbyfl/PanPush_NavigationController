//
//  SecondViewController.m
//  PanPush
//
//  Created by lpc on 16/3/16.
//  Copyright © 2016年 lpc. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation SecondViewController

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

@end

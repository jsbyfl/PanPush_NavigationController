//
//  AppDelegate.m
//  PanPush
//
//  Created by lpc on 16/3/16.
//  Copyright © 2016年 lpc. All rights reserved.
//

#import "AppDelegate.h"
#import "PanNavigationController.h"

@interface AppDelegate ()
@property (nonatomic,strong) UITabBarController *rootTabbarController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

#if 1
    FirstViewController *rootNavController = [[FirstViewController alloc] initWithNibName:NSStringFromClass([FirstViewController class]) bundle:nil];
    PanNavigationController *nav = [[PanNavigationController alloc] initWithRootViewController:rootNavController];
    self.window.rootViewController = nav;
#else
    self.rootTabbarController = [self customTabbar];
    self.window.rootViewController = self.rootTabbarController;

#endif
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (UITabBarController *)customTabbar
{
    FirstViewController *vc1 = [[FirstViewController alloc] initWithNibName:NSStringFromClass([FirstViewController class]) bundle:nil];
    PanNavigationController *nav1 = [[PanNavigationController alloc] initWithRootViewController:vc1];
    
    SecondViewController *vc2 = [[SecondViewController alloc] initWithNibName:NSStringFromClass([SecondViewController class]) bundle:nil];
    PanNavigationController *nav2 = [[PanNavigationController alloc] initWithRootViewController:vc2];
    
    FirstViewController *vc3 = [[FirstViewController alloc] initWithNibName:NSStringFromClass([FirstViewController class]) bundle:nil];
    PanNavigationController *nav3 = [[PanNavigationController alloc] initWithRootViewController:vc3];
    
    
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    tabbarController.viewControllers = [NSArray arrayWithObjects:nav1,nav2,nav3, nil];
    NSArray *items = tabbarController.tabBar.items;
    for (int i = 0;i < items.count;i++) {
        UITabBarItem *item = items[i];
        item.title = [NSString stringWithFormat:@"第 %@ 个",@(i)];
    }

    return tabbarController;
}

@end

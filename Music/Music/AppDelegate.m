//
//  AppDelegate.m
//  Music
//
//  Created by 石子涵 on 2020/5/23.
//  Copyright © 2020 石子涵. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginController.h"
#import "HomePageController.h"
#import "LibraryPageController.h"
#import "MePageController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize window = _window;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //登陆
    LoginController *login = [LoginController new];
    //主页
    HomePageController *home = [[HomePageController alloc] init];
    //设置主页的NV
    UINavigationController *homeNV = [[UINavigationController alloc] initWithRootViewController:home];
    homeNV.tabBarItem.image = [UIImage imageNamed:@"home unselected"];
    homeNV.tabBarItem.selectedImage = [UIImage imageNamed:@"home"];
    
    //我的歌单
    LibraryPageController *library = [[LibraryPageController alloc] init];
    UINavigationController *libraryNV = [[UINavigationController alloc] initWithRootViewController:library];
    libraryNV.tabBarItem.image = [UIImage imageNamed:@"library unselected"];
    libraryNV.tabBarItem.selectedImage = [UIImage imageNamed:@"library"];
    
    //个人设置
    MePageController *me = [[MePageController alloc] init];
    UINavigationController *meNV = [[UINavigationController alloc] initWithRootViewController:me];
    meNV.tabBarItem.image = [UIImage imageNamed:@"me unselected"];
    meNV.tabBarItem.selectedImage = [UIImage imageNamed:@"me"];
    
    //设置tabbar
    self.tabBar = [[UITabBarController alloc] init];
    self.tabBar.viewControllers = [NSArray arrayWithObjects:homeNV,libraryNV,meNV, nil];
    
    //判断登陆状态
    NSString *loginStr=[[NSUserDefaults standardUserDefaults]objectForKey:@"login"];
    if ([loginStr isEqualToString:@"yes"]) {
        self.window.rootViewController = self.tabBar;
           }else{
                  self.window.rootViewController = login;
           }
    return YES;
}



@end

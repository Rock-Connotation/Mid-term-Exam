//
//  LoginController.m
//  Music
//
//  Created by 石子涵 on 2020/5/23.
//  Copyright © 2020 石子涵. All rights reserved.
//

#import "LoginController.h"
#import "LoginView.h"
#import "HomePageController.h"
#import "AppDelegate.h"
@interface LoginController ()<UITextFieldDelegate>
@property (nonatomic, strong) LoginView *loginView;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.loginView = [[LoginView alloc] initWithFrame:self.view.frame];
    [self.loginView ViewInit];
    [self.view addSubview:self.loginView];
    
    [self.loginView.loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
}
//伪登录事件
- (void)login{
    NSString *string = @"123456";
    if ([self.loginView.passWordTexf.text isEqualToString:string] && self.loginView.userTexf.text.length > 0) {
        //创建主页
           [[NSUserDefaults standardUserDefaults]setObject:@"yes" forKey:@"login"];
        AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
        self.tabBarController.selectedIndex = 0;
        app.window.rootViewController = app.tabBar;
    }else{
        self.loginView.passWordTexf.placeholder = @"密码错误";
    }
}

@end

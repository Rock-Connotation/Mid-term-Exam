//
//  LoginView.m
//  Music
//
//  Created by 石子涵 on 2020/5/23.
//  Copyright © 2020 石子涵. All rights reserved.
//
#import <Masonry.h>
#import "LoginView.h"

@implementation LoginView
- (void)ViewInit{
    [self addView];
   [self addButtomView];
    
}
- (void)addView{
    self.viewTop = [[UIView alloc] init];
    self.viewTop.backgroundColor = [UIColor whiteColor];
    self.viewTop.frame = CGRectMake(0, 0, 375*kScaleW, 463*kScaleH);
    [self addSubview:self.viewTop];
    //图标
    self.appIconImageView = [[UIImageView alloc] init];
    self.appIconImageView.image = [UIImage imageNamed:@"网易云"];
    self.appIconImageView.frame = CGRectMake(137.5*kScaleW, 72*kScaleH, 100*kScaleW, 100*kScaleW);
    [self addSubview:self.appIconImageView];
    
    
      //用户输入框
      self.userTexf = [[UITextField alloc] init];
    self.userTexf.backgroundColor = [UIColor colorWithRed:247/255.0 green:248/255.0 blue:250/255.0 alpha:1.0];
      self.userTexf.frame = CGRectMake(72.5*kScaleW, 225*kScaleH, 230*kScaleW, 44*kScaleH);
      [self addSubview:self.userTexf];
      
    //密码输入框
      self.passWordTexf = [[UITextField alloc] init];
    self.passWordTexf.backgroundColor = [UIColor colorWithRed:247/255.0 green:248/255.0 blue:250/255.0 alpha:1.0];
      self.passWordTexf.secureTextEntry = YES;
      [self addSubview:self.passWordTexf];
      [self.passWordTexf mas_makeConstraints:^(MASConstraintMaker *make) {
          make.size.centerX.equalTo(self.userTexf);
          make.top.equalTo(self.userTexf.mas_bottom).offset(15*kScaleH);
      }];
    
    
      //忘记密码的label
      self.forgottenPasswordLbl = [[UILabel alloc] init];
      self.forgottenPasswordLbl.text = @"Forgot your password?";
      self.forgottenPasswordLbl.font = [UIFont fontWithName:@"VarelaRound" size:14];
    self.forgottenPasswordLbl.font = [UIFont systemFontOfSize:14];
    self.forgottenPasswordLbl.textColor = [UIColor colorWithRed:117/255.0 green:134/255.0 blue:146/255.0 alpha:1.0];
     
      [self addSubview:self.forgottenPasswordLbl];
      [self.forgottenPasswordLbl mas_makeConstraints:^(MASConstraintMaker *make) {
          make.centerX.equalTo(self.userTexf);
          make.size.mas_equalTo(CGSizeMake(155*kScaleW, 14*kScaleH));
          make.top.equalTo(self.passWordTexf.mas_bottom).offset(17.5*kScaleH);
      }];
      
    //登录按钮
      self.loginBtn = [[UIButton alloc] init];
      [self.loginBtn setImage:[UIImage imageNamed:@"loginButton"] forState:UIControlStateNormal];
      self.loginBtn.frame = CGRectMake(97.5*kScaleW, 383*kScaleH, 180*kScaleW, 44*kScaleH);
    [self addSubview:self.loginBtn];
}
- (void)addButtomView{
    //下面的灰色view
    self.vieBottom = [[UIView alloc] init];
    self.vieBottom.backgroundColor = [UIColor colorWithRed:247/255.0 green:248/255.0 blue:250/255.0 alpha:1.0];
    self.vieBottom.frame = CGRectMake(0, 463*kScaleH, 375*kScaleW, 204*kScaleH);
    [self addSubview:self.vieBottom];
    
    //提示lbl
    self.lblSign = [[UILabel alloc] init];
    self.lblSign.text = @"Sign with a social account";
    self.lblSign.font = [UIFont fontWithName:@"VarelaRound" size:14];
    self.lblSign.font = [UIFont systemFontOfSize:14];
    self.lblSign.textColor = [UIColor colorWithRed:117/255.0 green:134/255.0 blue:146/255.0 alpha:1.0];
    self.lblSign.textAlignment = NSTextAlignmentLeft;
    self.lblSign.frame = CGRectMake(100*kScaleW, 24.5*kScaleH, 175.5*kScaleW, 14*kScaleH);
    [self.vieBottom addSubview:self.lblSign];
    
    //通过脸书登录
    self.lblFaceBook = [[UILabel alloc] init];
    UIColor *color1 = [UIColor colorWithPatternImage:[UIImage imageNamed:@"facebook"]];
    [self.lblFaceBook setBackgroundColor:color1];
    self.lblFaceBook.text = @"Login with Facebook";
    self.lblFaceBook.font = [UIFont fontWithName:@"BalooBhai-Regular" size: 18];
    self.lblFaceBook.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    self.lblFaceBook.textAlignment = NSTextAlignmentCenter;
    self.lblFaceBook.frame = CGRectMake(57.5*kScaleW, 61*kScaleH, 260*kScaleW, 44*kScaleH);
    [self.vieBottom addSubview:self.lblFaceBook];
    
    //通过twitter登录
    self.lblTwiter = [[UILabel alloc] init];
    self.lblTwiter.text = @"Login with Twitter";
     self.lblTwiter.textAlignment = NSTextAlignmentCenter;
    self.lblTwiter.font = [UIFont fontWithName:@"BalooBhai-Regular" size: 18];
    self.lblTwiter.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    UIColor *color2 = [UIColor colorWithPatternImage:[UIImage imageNamed:@"twitter"]];
    [self.lblTwiter setBackgroundColor:color2];
    [self.vieBottom addSubview:self.lblTwiter];
    [self.lblTwiter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerX.equalTo(self.lblFaceBook);
        make.top.equalTo(self.lblFaceBook.mas_bottom).offset(15*kScaleH);
    }];
}
@end

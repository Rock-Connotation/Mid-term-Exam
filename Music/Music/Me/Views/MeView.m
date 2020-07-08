//
//  MeView.m
//  Music
//
//  Created by 石子涵 on 2020/5/24.
//  Copyright © 2020 石子涵. All rights reserved.
//
#import <Masonry.h>
#import "MeView.h"

@implementation MeView
- (void)ViewInit{
    self.backgroundColor = [UIColor whiteColor];
    [self addTop];
    [self addbottom];
}
- (void)addTop{
    //背景图片
    self.backgroundImageView = [[UIImageView alloc] init];
    self.backgroundImageView.frame = CGRectMake(0, 0, 375*kScaleW, 396.5*kScaleH);
    [self addSubview:self.backgroundImageView];
    self.backgroundImageView.image = [UIImage imageNamed:@"boring"];
    
    //心形按钮
    self.btnHeart = [[UIButton alloc] initWithFrame:CGRectMake(47.5*kScaleW, 374.5*kScaleH, 80*kScaleW, 44*kScaleH)];
    self.btnHeart.backgroundColor = [UIColor colorWithRed:255/255.0 green:23/255.0 blue:68/255.0 alpha:1.0];
    self.btnHeart.layer.cornerRadius = 22;
    [self addSubview:self.btnHeart];
    self.imgViewHeartSmall = [[UIImageView alloc] init];
    self.imgViewHeartSmall.image = [UIImage imageNamed:@"Like"];
    [self addSubview:self.imgViewHeartSmall];
    [self.imgViewHeartSmall mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.btnHeart);
        make.size.mas_equalTo(CGSizeMake(23*kScaleW, 21*kScaleH));
    }];
    
    //勾勾的按钮
    self.btnGouGOu = [[UIButton alloc] init];
    self.btnGouGOu.backgroundColor = [UIColor colorWithRed:0/255.0 green:145/255.0 blue:234/255.0 alpha:1.0];
    self.btnGouGOu.layer.cornerRadius = 22;
    [self addSubview:self.btnGouGOu];
    [self.btnGouGOu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerY.equalTo(self.btnHeart);
        make.left.equalTo(self.btnHeart.mas_right).offset(20*kScaleW);
    }];
    self.imgViewGouGOuSmall = [[UIImageView alloc] init];
    self.imgViewGouGOuSmall.image = [UIImage imageNamed:@"gougou"];
    [self.btnGouGOu addSubview:self.imgViewGouGOuSmall];
    [self.imgViewGouGOuSmall mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.btnGouGOu);
        make.size.equalTo(self.imgViewHeartSmall);
    }];
    
    //消息按钮
    self.btnMessage = [[UIButton alloc] init];
    self.btnMessage.layer.cornerRadius = 22;
    self.btnMessage.backgroundColor = [UIColor colorWithRed:76/255.0 green:185/255.0 blue:6/255.0 alpha:1.0];
    [self addSubview:self.btnMessage];
    [self.btnMessage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerY.equalTo(self.btnHeart);
        make.left.equalTo(self.btnGouGOu.mas_right).offset(20*kScaleW);
    }];
    self.imgViewMessageSmall = [[UIImageView alloc] init];
    self.imgViewMessageSmall.image = [UIImage imageNamed:@"Message"];
    [self addSubview:self.imgViewMessageSmall];
    [self.imgViewMessageSmall mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.btnMessage);
        make.size.equalTo(self.imgViewHeartSmall);
    }];
}
- (void)addbottom{
    //昵称框
    self.lblNickname = [[UILabel alloc] initWithFrame:CGRectMake(102*kScaleW, 457*kScaleH, 172*kScaleW, 15*kScaleH)];
    self.lblNickname.textColor = [UIColor colorWithRed:28/255.0 green:37/255.0 blue:42/255.0 alpha:1.0];
    self.lblNickname.font = [UIFont fontWithName:@"Baloo Bhai" size: 22.0];
    self.lblNickname.text = @"忏悔";
    [self addSubview:self.lblNickname];
    
    //地址图标
    self.imgViewAdress = [[UIImageView alloc]init];
    self.imgViewAdress.image = [UIImage imageNamed:@"address"];
    [self addSubview:self.imgViewAdress];
    [self.imgViewAdress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(122.5*kScaleW);
        make.top.equalTo(self.lblNickname.mas_bottom).offset(13.5*kScaleH);
        make.size.mas_equalTo(CGSizeMake(18*kScaleW, 23*kScaleH));
    }];
    //地址label
    self.lblAdress = [[UILabel alloc] init];
    self.lblAdress.textColor = [UIColor colorWithRed:183/255.0 green:196/255.0 blue:203/255.0 alpha:1.0];
    self.lblAdress.font = [UIFont fontWithName:@"VarelaRound" size: 18.0];
    self.lblAdress.numberOfLines = 0;

    self.lblAdress.frame = CGRectMake(153.5*kScaleW, 489*kScaleH, 220*kScaleW, 13.5*kScaleH);
    [self addSubview:self.lblAdress];
//    [self.lblAdress mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.imgViewAdress);
//        make.left.equalTo(self.imgViewAdress.mas_right).offset(13*kScaleW);
//        make.size.mas_equalTo(CGSizeMake(120*kScaleW, 13.5*kScaleH));
//    }];
    
   //posts
    self.lblPostNumbers = [[UILabel alloc] init];
    self.lblPostNumbers.textColor = [UIColor colorWithRed:50/255.0 green:62/255.0 blue:70/255.0 alpha:1.0];
    self.lblPostNumbers.font = [UIFont fontWithName:@"VarelaRound" size: 24.0];
    self.lblPostNumbers.frame = CGRectMake(165.5*kScaleW, 527*kScaleH, 43.5*kScaleW, 22*kScaleH);

    [self addSubview:self.lblPostNumbers];
//    [self.lblPostNumbers mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.lblNickname.mas_bottom).offset(46*kScaleH);
//        make.left.equalTo(self.mas_left).offset(165.5*kScaleW);
//        make.size.mas_equalTo(CGSizeMake(43.5*kScaleW, 17.5*kScaleH));
//    }];
    self.lblPost = [[UILabel alloc] init];
    self.lblPost.textColor = [UIColor colorWithRed:183/255.0 green:196/255.0 blue:203/255.0 alpha:1.0];
    self.lblPost.font = [UIFont fontWithName:@"VarelaRound" size: 14.0];
    self.lblPost.font = [UIFont systemFontOfSize:12];
    self.lblPost.text = @"Posts";
    self.lblPost.frame = CGRectMake(169.5*kScaleW, 580.5*kScaleH, 35.5*kScaleW, 10*kScaleH);
    [self addSubview:self.lblPost];
//    [self.lblPost mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.lblPost.mas_bottom).offset(4*kScaleH);
//        make.left.equalTo(self.mas_left).offset(169.6*kScaleW);
//        make.size.mas_equalTo(CGSizeMake(36*kScaleW, 10*kScaleH));
//    }];
    
    //followerNumbers
    self.lblFollowerNumbers = [[UILabel alloc] init];
    self.lblFollowerNumbers.textColor = self.lblPostNumbers.textColor;
    self.lblFollowerNumbers.font = self.lblPostNumbers.font;
    [self addSubview:self.lblFollowerNumbers];
    [self.lblFollowerNumbers mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.lblPostNumbers);
        make.left.equalTo(self.mas_left).offset(47.5*kScaleW);
        make.size.mas_equalTo(CGSizeMake(48*kScaleW, 22*kScaleH));
    }];
    //follower
    self.lblFollower = [[UILabel alloc] init];
    self.lblFollower.textColor = self.lblPost.textColor;
    self.lblFollower.font = self.lblPost.font;
    self.lblFollower.text = @"Followers";
    [self addSubview:self.lblFollower];
    [self.lblFollower mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.lblPost);
        make.centerX.equalTo(self.lblFollowerNumbers);
        make.size.mas_equalTo(CGSizeMake(63.5*kScaleW, 10.5*kScaleH));
    }];
    
    //FollowingNumbers
    self.lblFollowingNumbers = [[UILabel alloc] init];
    self.lblFollowingNumbers.textColor = self.lblPostNumbers.textColor;
    self.lblFollowingNumbers.font = self.lblPostNumbers.font;
    [self addSubview:self.lblFollowingNumbers];
    [self.lblFollowingNumbers mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerY.equalTo(self.lblFollowerNumbers);
        make.right.equalTo(self.mas_right).offset(-45*kScaleW);
    }];
    //following
    self.lblFollowing = [[UILabel alloc]init];
    self.lblFollowing.textColor = self.lblPost.textColor;
    self.lblFollowing.font = self.lblPost.font;
    self.lblFollowing.text = @"Following";
    [self addSubview:self.lblFollowing];
    [self.lblFollowing mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.lblFollowingNumbers);
        make.size.centerY.equalTo(self.lblFollower);
    }];
}
@end

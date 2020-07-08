//
//  homeView.m
//  Music
//
//  Created by 石子涵 on 2020/5/23.
//  Copyright © 2020 石子涵. All rights reserved.
//
#import <SDWebImage.h>
#import <AFNetworking.h>
#import <Masonry.h>
#import "homeView.h"
#import "UIImageView+WebCache.h"

@implementation homeView
- (void)viewInit{
    //
    self.lblAlbums = [[UILabel alloc] init];
    self.lblAlbums.text = @"New Albums";
    self.lblAlbums.font = [UIFont fontWithName:@"Baloo Bhai" size: 14.7];
    self.lblAlbums.textColor = [UIColor colorWithRed:28/255.0 green:37/255.0 blue:42/255.0 alpha:1.0];
    self.lblAlbums.frame = CGRectMake(24.5*kScaleW, 64.5*kScaleH, 122.5*kScaleW, 15*kScaleH);
    [self addSubview:self.lblAlbums];
    
    self.sclAlbums = [[UIScrollView alloc] init];
    self.sclAlbums.frame = CGRectMake(23.5*kScaleW, 103*kScaleH, 321*kScaleW, 200*kScaleH);
    [self addSubview:self.sclAlbums];
    
    self.lblRecm = [[UILabel alloc] init];
    self.lblRecm.text = @"Recommendations";
    self.lblRecm.font = [UIFont fontWithName:@"Baloo Bhai" size: 14.7];
    self.lblRecm.textColor = [UIColor colorWithRed:28/255.0 green:37/255.0 blue:42/255.0 alpha:1.0];
    [self addSubview:self.lblRecm];
    [self.lblRecm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(24.5*kScaleW);
        make.top.equalTo(self.sclAlbums.mas_bottom).offset(14.5*kScaleH);
        make.size.mas_equalTo(CGSizeMake(186*kScaleW, 16*kScaleW));
    }];
    
    self.btnSeeAll = [[UILabel alloc] init];
    self.btnSeeAll.text = @"See All";
    self.btnSeeAll.font =  [UIFont fontWithName:@"VarelaRound" size: 18.0];
    self.btnSeeAll.textColor = [UIColor colorWithRed:0/255.0 green:145/255.0 blue:234/255.0 alpha:1.0];
    [self addSubview:self.btnSeeAll];
    [self.btnSeeAll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.lblRecm);
        make.left.equalTo(self.mas_left).offset(293*kScaleW);
        make.size.mas_equalTo(CGSizeMake(57*kScaleW, 14*kScaleH));
    }];
    
    
    [self netWork];
}


- (void)netWork{
}
@end

//
//  LibraryCell.m
//  Music
//
//  Created by 石子涵 on 2020/5/24.
//  Copyright © 2020 石子涵. All rights reserved.
//
#import <Masonry.h>
#import "LibraryCell.h"

@implementation LibraryCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    return self;
}
- (void)makeUI{
    //歌单图片
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(23.5*kScaleW, 23.5*kScaleH, 95*kScaleW, 95*kScaleW)];
  
    self.imageView.userInteractionEnabled = YES;
    [self.contentView addSubview:self.imgView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(23.5*kScaleW);
        make.size.mas_equalTo(CGSizeMake(95*kScaleW, 95*kScaleH));
    }];
    
    //歌单名字
    self.lblSongSheetName = [[UILabel alloc] init];
    self.lblSongSheetName.frame = CGRectMake(142*kScaleW, 30.5*kScaleH, 233*kScaleW, 16*kScaleH);
    self.lblSongSheetName.textColor = [UIColor colorWithRed:28/255.0 green:37/255.0 blue:42/255.0 alpha:1.0];
    self.lblSongSheetName.font = [UIFont fontWithName:@"Baloo Bhai" size: 22.0];
    [self.contentView addSubview:self.lblSongSheetName];
    //作者名字
    self.lblAuthorName = [[UILabel alloc] initWithFrame:CGRectMake(142*kScaleW, 64.5*kScaleH, 233*kScaleW, 18*kScaleH)];
    self.lblAuthorName.textColor = [UIColor colorWithRed:0/255.0 green:145/255.0 blue:234/255.0 alpha:1.0];
    self.lblAuthorName.font =  [UIFont fontWithName:@"VarelaRound" size: 18.0];
    [self.contentView addSubview:self.lblAuthorName];
    
    //播放按钮
    self.btnPlay = [[UIButton alloc] init];
    [self.btnPlay setImage:[UIImage imageNamed:@"Play"] forState:UIControlStateNormal];
    [self.imgView addSubview:self.btnPlay];
    [self.btnPlay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.imgView);
        make.size.mas_equalTo(CGSizeMake(23*kScaleW, 23*kScaleH));
    }];
    
    self.lblSongId = [[UILabel alloc] init];
}


@end

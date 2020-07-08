//
//  SongsCell.m
//  Music
//
//  Created by 石子涵 on 2020/5/24.
//  Copyright © 2020 石子涵. All rights reserved.
//
#import <Masonry.h>
#import "SongsCell.h"

@implementation SongsCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    return self;
}
- (void)makeUI{
    self.lblNumber = [[UILabel alloc] init];
    self.lblNumber.textColor = [UIColor colorWithRed:183/255.0 green:196/255.0 blue:203/255.0 alpha:1.0];
    self.lblNumber.font = [UIFont fontWithName:@"VarelaRound" size: 18.0];
    self.lblNumber.frame = CGRectMake(20*kScreenHight, 6*kScaleH, 13*kScaleW, 15*kScaleH);
    [self.contentView addSubview:self.lblNumber];
    
    self.lblSongName = [[UILabel alloc] init];
    self.lblSongName.textColor = [UIColor colorWithRed:28/255.0 green:37/255.0 blue:42/255.0 alpha:1.0];
    self.lblSongName.font = [UIFont fontWithName:@"VarelaRound" size: 18.0];
    [self.contentView addSubview:self.lblSongName];
    [self.lblSongName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.lblNumber);
        make.left.equalTo(self.lblNumber.mas_right).offset(18*kScaleW);
        make.size.mas_equalTo(CGSizeMake(250*kScaleW, 18*kScaleH));
    }];
    
    self.lblSongTime = [[UILabel alloc] init];
    self.lblSongTime.textColor = self.lblNumber.textColor;
    self.lblSongTime.font = self.lblNumber.font;
    [self.contentView addSubview:self.lblSongTime];
    [self.lblSongTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.lblSongName);
        make.left.equalTo(self.lblSongName.mas_right);
        make.right.equalTo(self.contentView.mas_right);
        make.height.mas_equalTo(15*kScaleH);
    }];
}

@end

//
//  AlbumsCollectionCell.m
//  Music
//
//  Created by 石子涵 on 2020/5/23.
//  Copyright © 2020 石子涵. All rights reserved.
//

#import "AlbumsCollectionCell.h"
#import <Masonry.h>
@implementation AlbumsCollectionCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        self.imgViewAlbum = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imgViewAlbum];
        
        self.lblAlbumName = [[UILabel alloc] init];
        [self.contentView addSubview:self.lblAlbumName];
        
        self.lblAlbumAuthor = [[UILabel alloc] init];
        [self.contentView addSubview:self.lblAlbumAuthor];
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
//    self.contentView.backgroundColor = [UIColor whiteColor];
    
    //封面
    self.imgViewAlbum.frame = CGRectMake(0, 0, 157*kScaleW, 157*kScaleH);
    
   // 专辑名label
    [self.lblAlbumName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgViewAlbum.mas_bottom).offset(14.5*kScaleH);
        make.size.mas_equalTo(CGSizeMake(157*kScaleW, 16*kScaleH));
    }];
    self.lblAlbumName.textColor = [UIColor colorWithRed:28/255.0 green:37/255.0 blue:42/255.0 alpha:1.0];
    self.lblAlbumName.font = [UIFont fontWithName:@"Baloo Bhai" size: 22.0];
    
    //作者label
    [self.lblAlbumAuthor mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lblAlbumName.mas_bottom).offset(16*kScaleH);
        make.size.mas_equalTo(CGSizeMake(157*kScaleW, 14*kScaleH));
    }];
    self.lblAlbumAuthor.textColor = [UIColor colorWithRed:0/255.0 green:145/255.0 blue:234/255.0 alpha:1.0];
    self.lblAlbumAuthor.font = [UIFont fontWithName:@"VarelaRound" size: 14.0];
}

@end

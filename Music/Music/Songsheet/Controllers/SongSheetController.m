//
//  SongSheetController.m
//  Music
//
//  Created by 石子涵 on 2020/5/24.
//  Copyright © 2020 石子涵. All rights reserved.
//
#import <Masonry.h>
#import <AFNetworking.h>
#import "SongSheetController.h"
#import "SongsCell.h"
@interface SongSheetController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)NSArray *dataArray;

@end

@implementation SongSheetController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addUI];
    NSLog(@"222--%ld", self.songid);
    [self getData];
}
- (void)getData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *parameterDic = [NSMutableDictionary new];
    NSString *SongSheetID = [NSString stringWithFormat:@"%ld",self.songid ];
    [parameterDic setValue:SongSheetID forKey:@"id"];
    [manager GET:@"http://47.99.165.194/playlist/detail?" parameters:parameterDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject[@"playlist"]);
        NSMutableArray *array = [NSMutableArray new];
//        for (<#type *object#> in <#collection#>) {
//            <#statements#>
//        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
- (void)creatTable{
    self.tableSongSheet = [[UITableView alloc] init];
    self.tableSongSheet.delegate = self;
    self.tableSongSheet.dataSource = self;
    [self.view addSubview:self.tableSongSheet];
    [self.tableSongSheet mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.imageView.mas_bottom).offset(72.5*kScaleH);
    }];
}
- (void)addUI{
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 64*kScaleH, 375*kScaleW, 157*kScaleH)];
    self.topView.backgroundColor = [UIColor colorWithRed:247/255.0 green:248/255.0 blue:250/255.0 alpha:1.0];
    [self.view addSubview:self.topView];
    
    //歌单封面
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(23.5*kScaleW, 23.5*kScaleH, 110*kScaleW, 110*kScaleH)];
    [self.topView addSubview:self.imageView];
    
    //歌单名
    self.lblSongSheetName = [[UILabel alloc] initWithFrame:CGRectMake(158*kScaleW, 30.5*kScaleH, 216*kScaleW, 20*kScaleH)];
    self.lblSongSheetName.textColor = [UIColor colorWithRed:28/255.0 green:37/255.0 blue:42/255.0 alpha:1.0];
    self.lblSongSheetName.font = [UIFont fontWithName:@"Baloo Bhai" size: 22.0];
    [self.topView addSubview:self.lblSongSheetName];
    
    //创作者名字
    self.lblArtistName = [[UILabel alloc] initWithFrame:CGRectMake(158*kScaleW, 64.5*kScaleH, 216*kScaleW, 14*kScaleH)];
    self.lblArtistName.textColor = [UIColor colorWithRed:0/255.0 green:145/255.0 blue:234/255.0 alpha:1.0];
    self.lblArtistName.font = [UIFont fontWithName:@"VarelaRound" size: 18.0];
    
    //song标题
    self.lblSongs = [[UILabel alloc] init];
    self.lblSongs.font = [UIFont fontWithName:@"Baloo Bhai" size: 14.7];
    self.lblSongs.textColor = [UIColor colorWithRed:28/255.0 green:37/255.0 blue:42/255.0 alpha:1.0];
    self.lblSongs.text = @"Songs";
    [self.view addSubview:self.lblSongs];
    [self.lblSongs mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(24*kScaleW);
        make.top.equalTo(self.imageView.mas_bottom).offset(40*kScaleH);
        make.size.mas_equalTo(CGSizeMake(60*kScaleW, 20*kScaleH));
    }];
    
    //随机按钮
    self.btnRandom = [[UIButton alloc] init];
    [self.btnRandom setImage:[UIImage imageNamed:@"random"] forState:UIControlStateNormal];
    [self.view addSubview:self.btnRandom];
    [self.btnRandom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.lblSongs);
        make.right.equalTo(self.view.mas_right).offset(-23*kScaleW);
        make.size.mas_equalTo(CGSizeMake(25*kScaleW, 20*kScaleH));
    }];
    
}

@end

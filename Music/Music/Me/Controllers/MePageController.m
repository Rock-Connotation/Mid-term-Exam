//
//  MePageController.m
//  Music
//
//  Created by 石子涵 on 2020/5/23.
//  Copyright © 2020 石子涵. All rights reserved.
//
#import "UIImageView+WebCache.h"
#import "MePageController.h"
#import "MeView.h"
#import <AFNetworking.h>
#import "MeModel.h"
@interface MePageController ()
@property (nonatomic, strong)MeView *meView;
@property (nonatomic, strong)MeModel *model;
@property (nonatomic, strong)NSArray *dataArray;
@end

@implementation MePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.meView = [[MeView alloc] initWithFrame:self.view.frame];
    [self.meView ViewInit];
    [self.view addSubview:self.meView];
    
//    [self getData];
    
}
- (void)getData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:MyInformationAPi parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject[@"profile"]);
//        NSMutableArray *array = [NSMutableArray new];
//        for (NSDictionary *dic in responseObject[@"profile"]) {
//             MeModel *model = [[MeModel alloc] init];
//            model.backgroundUrl = [dic objectForKey:@"backgrounUrl"];
//            model.nickname = [dic objectForKey:@"nickname"];
//            model.city = [dic objectForKey:@"city"];
//           model.followeds = [dic objectForKey:@"followeds"];
//            model.follows = [dic objectForKey:@"follows"];
//            [array addObject:model];
//        }
//        self.dataArray = array;
//        NSDictionary *dic = responseObject[@"profile"];
        
//        self.meView = [[MeView alloc] initWithFrame:self.view.frame];
//        [self.meView ViewInit];
//        [self.view addSubview:self.meView];
//
////        self.meView.lblAdress.text = [dic objectForKey:@"city"];
//        for (NSDictionary *dic in responseObject[@"profile"]) {
//            MeView *meview = [[MeView alloc] init];
//            meview.lblAdress.text = [dic objectForKey:@"city"];
//            self.meView = meview;
//        }
//        [self.meView ViewInit];
//        self.meView.frame = self.view.frame;
//        [self.view addSubview:self.meView];
//
//        [self makeUI];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
- (void)makeUI{
    MeModel *model = self.dataArray.firstObject;
    self.meView.lblFollowingNumbers.text = model.follows;
    self.meView.lblFollowerNumbers.text = model.followeds;
    self.meView.lblAdress.text = model.city;
    [self.meView.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:model.backgroundUrl] placeholderImage:[UIImage imageNamed:@"0.png"]];
    
}
@end

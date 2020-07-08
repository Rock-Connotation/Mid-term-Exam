//
//  HomePageController.m
//  Music
//
//  Created by 石子涵 on 2020/5/23.
//  Copyright © 2020 石子涵. All rights reserved.
//
#import "UIImageView+WebCache.h"
#import <AFNetworking.h>
#import <Masonry.h>
#import "HomePageController.h"
#import "homeView.h"
#import "AlbumsCollectionCell.h"
#import "HotSongSheetModel.h"
@interface HomePageController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView *collectAlbums;
@property (nonatomic, strong)homeView *homeview;

@end

@implementation HomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Home";
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(search)];
    self.navigationItem.rightBarButtonItem = searchItem;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.homeview = [[homeView alloc] init];
    self.homeview.frame = CGRectMake(0, 20*kScaleH, kScaleW, 357*kScaleH);
    [self.homeview viewInit];
    [self.view addSubview:self.homeview];
    
   
    [self netWork];
      
}





- (void)netWork{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    NSMutableDictionary *parameterDic = [[NSMutableDictionary alloc] init];
//    [parameterDic setValue:@"华语" forKey:@"cat"];
//    [parameterDic setValue:@"20" forKey:@"limit"];
    NSString *url = @"http://47.99.165.194/top/playlist?cat=华语&limit=20";
    //对url中的汉字进行转码，并去除空格等无效符号
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSLog(@"%@", responseObject[@"playlists"]);
//        NSDictionary *dic = responseObject;
//        NSArray *arry = dic[@"playlist"];
//
        NSMutableArray *arr = [NSMutableArray new];
        for (NSDictionary *dict in responseObject[@"playlists"]) {
            HotSongSheetModel *model = [[HotSongSheetModel alloc] init];
            model.name = [dict objectForKey:@"name"];
            model.coverImgUrl = [dict objectForKey:@"coverImgUrl"];
            NSDictionary *dic = dict[@"creator"];
            model.artistName = [dic objectForKey:@"nickname"];
            model.songID = [dict objectForKey:@"id"];
            [arr addObject:model];
        }
        self.dataArray = arr;
       [ self addCollectionView];
      
         
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
- (void)addCollectionView{
    //集合视图
    
    //1创建布局类
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    //3设置每个小挡块的大小
    layout.itemSize=CGSizeMake(157*kScaleW,218*kScaleH);//一般通过代理方法来设置
    //设置最小间距
    layout.minimumLineSpacing = 26;
    //设置最小列间距
    layout.minimumInteritemSpacing = 15;
//    //设置上下左右四边距
    layout.sectionInset=UIEdgeInsetsMake(10,10,10,10);
    
    //设置滚动的方向
    layout.scrollDirection=UICollectionViewScrollDirectionVertical;

    //设置frame
    self.collectAlbums = [[UICollectionView alloc] initWithFrame:(CGRectMake(0, 0, 0, 0)) collectionViewLayout:layout];
  [self.view addSubview:self.collectAlbums];
    [self.collectAlbums mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeview.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    self.collectAlbums.backgroundColor = [UIColor whiteColor];
    self.collectAlbums.delegate = self;
    self.collectAlbums.dataSource = self;
    
    //注册cell
    [self.collectAlbums registerClass:[AlbumsCollectionCell class] forCellWithReuseIdentifier:@"cell"];
      
}

#pragma mark- 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    AlbumsCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    HotSongSheetModel *model = self.dataArray[indexPath.row];
    cell.lblAlbumName.text = model.name;
    cell.lblAlbumAuthor.text = model.artistName;
//    NSURL *url = [NSURL URLWithString:model.coverImgUrl];
//    [[cell.imgViewAlbum sd_setImageWithURL:url] placeholderImage:[UIImage imageNamed:@"lklj"]];
    [cell.imgViewAlbum sd_setImageWithURL:[NSURL URLWithString:model.coverImgUrl] placeholderImage:[UIImage imageNamed:@"0.png"]];
//    cell.imgViewAlbum.image = [UIImage imageNamed:@"网易云"];
//    cell.lblAlbumName.text = @"网易云";
//    cell.lblAlbumAuthor.text = @"YC";
    return cell;
}
@end

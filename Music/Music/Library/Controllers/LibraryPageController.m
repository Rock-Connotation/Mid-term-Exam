//
//  LibraryPageController.m
//  Music
//
//  Created by 石子涵 on 2020/5/23.
//  Copyright © 2020 石子涵. All rights reserved.
//
#import "UIImageView+WebCache.h"
#import <AFNetworking.h>
#import "LibraryPageController.h"
#import "LibraryCell.h"
#import "LibraryModel.h"
#import "SongSheetController.h"
#import "MusicPlayerController.h"
@interface LibraryPageController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableLibrary;
@property (nonatomic, strong) NSArray *dataArrary;
@end

@implementation LibraryPageController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Library";
    //这里跳转到音乐播放器界面
     UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(push)];
     self.navigationItem.rightBarButtonItem = addItem;
    [self InterNet];

}
- (void)InterNet{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://47.99.165.194/user/playlist?uid=356985593&limit=20" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject[@"playlist"]);
        NSMutableArray *array = [NSMutableArray new];
        for (NSDictionary *dic in responseObject[@"playlist"]) {
            LibraryModel *model = [[LibraryModel alloc] init];
            model.name = [dic objectForKey:@"name"];
            model.coverImgUrl = [dic objectForKey:@"coverImgUrl"];
            NSDictionary *dict = dic[@"creator"];
            model.nickname = [dict objectForKey:@"nickname"];
            model.songID = [dic[@"id"] longValue];
            [array addObject:model];
        }
        self.dataArrary = array;
        
       
             [self addTable];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"错误%@",error);
    }];
    
}


- (void)addTable{
    self.tableLibrary = [[UITableView alloc] initWithFrame:CGRectMake(0, 64*kScaleH, 375*kScaleW,self.view.bounds.size.height - 64) style:UITableViewStyleGrouped];
    
    self.tableLibrary.delegate = self;
    self.tableLibrary.dataSource = self;
      [self.view addSubview:self.tableLibrary];
    
}
#pragma mark- 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.dataArrary.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cellid";
   LibraryCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[LibraryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    LibraryModel *model = self.dataArrary[indexPath.row];
    cell.selectionStyle = UITableViewCellAccessoryNone;
    
    //赋值
    cell.lblSongSheetName.text = model.name;
    cell.lblAuthorName.text = model.nickname;
    cell.tag = model.songID;
//    NSLog(@"555---- %ld",cell.tag);
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.coverImgUrl] placeholderImage:[UIImage imageNamed:@"0.png"]];
   
    
    return cell;
}
#pragma mark- 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 142*kScaleH;
}
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSIndexPath *indexPath1 = [self.tableLibrary indexPathForSelectedRow];
    UITableViewCell *cell = [self.tableLibrary cellForRowAtIndexPath:indexPath1];
    NSLog(@"111----%ld",cell.tag);
    self.songID = cell.tag;
    SongSheetController *cv = [[SongSheetController alloc] init];
    [self.navigationController pushViewController:cv animated:YES];
    cv.songid = self.songID;
}

- (void)push{
    MusicPlayerController *vc = [[MusicPlayerController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end

//
//  homeView.h
//  Music
//
//  Created by 石子涵 on 2020/5/23.
//  Copyright © 2020 石子涵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BannerModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface homeView : UIView
@property (nonatomic, strong)UILabel *lblAlbums;
@property (nonatomic, strong)UIScrollView *sclAlbums;
@property (nonatomic, strong)UILabel *lblRecm;
@property (nonatomic, strong)UILabel *btnSeeAll;
@property (nonatomic, strong)BannerModel *bannerModel;
//@property (nonatomic, strong)UITableView *tableSongSheet;
- (void)viewInit;
@end

NS_ASSUME_NONNULL_END

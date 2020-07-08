//
//  SongSheetController.h
//  Music
//
//  Created by 石子涵 on 2020/5/24.
//  Copyright © 2020 石子涵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SongSheetController : UIViewController
@property (nonatomic, strong)UIView *topView;
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UILabel *lblSongSheetName;
@property (nonatomic, strong)UILabel *lblArtistName;
@property (nonatomic, strong)UILabel *lblSongs;
@property (nonatomic, strong)UIButton *btnRandom;
@property (nonatomic, strong)UITableView *tableSongSheet;

@property (nonatomic, assign)long int songid;
@end

NS_ASSUME_NONNULL_END

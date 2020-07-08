//
//  LibraryCell.h
//  Music
//
//  Created by 石子涵 on 2020/5/24.
//  Copyright © 2020 石子涵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LibraryCell : UITableViewCell
@property (nonatomic, strong)UIImageView *imgView;
@property (nonatomic, strong)UILabel *lblSongSheetName;
@property (nonatomic, strong)UILabel *lblAuthorName;
@property (nonatomic, strong)UIButton *btnPlay;
@property (nonatomic, strong)UILabel *lblSongId;
@end

NS_ASSUME_NONNULL_END

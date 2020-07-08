//
//  SongsCell.h
//  Music
//
//  Created by 石子涵 on 2020/5/24.
//  Copyright © 2020 石子涵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SongsCell : UITableViewCell
@property (nonatomic, strong)UILabel *lblNumber;
@property (nonatomic, strong)UILabel *lblSongName;
@property (nonatomic, strong)UILabel *lblSongTime;
@end

NS_ASSUME_NONNULL_END

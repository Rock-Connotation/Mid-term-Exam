//
//  AlbumsCollectionCell.h
//  Music
//
//  Created by 石子涵 on 2020/5/23.
//  Copyright © 2020 石子涵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlbumsCollectionCell : UICollectionViewCell
@property (nonatomic, strong)UIImageView *imgViewAlbum;
@property (nonatomic, strong)UILabel *lblAlbumName;
@property (nonatomic, strong)UILabel *lblAlbumAuthor;
@end

NS_ASSUME_NONNULL_END

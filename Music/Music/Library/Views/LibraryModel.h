//
//  LibraryModel.h
//  Music
//
//  Created by 石子涵 on 2020/5/24.
//  Copyright © 2020 石子涵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LibraryModel : UIView
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *nickname;
@property (nonatomic, strong)NSString *coverImgUrl;
@property (nonatomic, assign) int songID;
@end

NS_ASSUME_NONNULL_END

//
//  HotSongSheetModel.h
//  Music
//
//  Created by 石子涵 on 2020/5/24.
//  Copyright © 2020 石子涵. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HotSongSheetModel : NSObject
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *coverImgUrl;
@property (nonatomic, strong)NSString *artistName;
@property (nonatomic, assign)int songID;

@end

NS_ASSUME_NONNULL_END

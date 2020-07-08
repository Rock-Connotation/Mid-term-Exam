//
//  PlayModel.h
//  Music
//
//  Created by 石子涵 on 2020/5/24.
//  Copyright © 2020 石子涵. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlayModel : NSObject
//音乐名
@property (strong, nonatomic) NSString *musicName;
//音乐图片
@property (strong, nonatomic) NSString *musicIcon;
//音乐链接
@property (strong, nonatomic) NSString *musicUrl;
//音乐时长
@property (strong, nonatomic) NSNumber *duration;

-(instancetype)initWithDic:(NSDictionary*)dict;
 
@end

NS_ASSUME_NONNULL_END

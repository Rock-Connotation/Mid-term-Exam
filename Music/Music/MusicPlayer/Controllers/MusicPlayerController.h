//
//  MusicPlayerController.h
//  Music
//
//  Created by 石子涵 on 2020/5/24.
//  Copyright © 2020 石子涵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface MusicPlayerController : UIViewController<AVAudioPlayerDelegate>
@property (nonatomic, strong) AVAudioPlayer *player;  //播放器
@property (nonatomic, assign) int current;     //当前播放歌曲的号码 从0开始
@property (nonatomic, assign) BOOL flg;        //播放按钮标识 区分按钮状态



//音乐图片
@property (strong, nonatomic) UIImageView *musicIcon;
//当前播放时间
@property (strong, nonatomic) UILabel *currentTime;
//音乐时长
@property (strong, nonatomic) UILabel *duration;
//播放按钮
@property (strong, nonatomic) UIButton *playBtn;
//播放进度滑块
@property (strong, nonatomic) UISlider *playSlider;
//下一曲
@property (strong, nonatomic) UIButton *nextSong;
//上一曲
@property (strong, nonatomic) UIButton *preSong;

@property (strong, nonatomic) NSString *musicUrl;
@end

NS_ASSUME_NONNULL_END

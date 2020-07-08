//
//  MusicPlayerController.m
//  Music
//
//  Created by 石子涵 on 2020/5/24.
//  Copyright © 2020 石子涵. All rights reserved.
//
#import <Masonry.h>
#import <AFNetworking.h>
#import "UIImageView+WebCache.h"
#import "MusicPlayerController.h"
#include "PlayModel.h"
@interface MusicPlayerController ()
@property (nonatomic, strong)NSMutableArray *songArray;

//缓存音乐图片
@property(nonatomic,strong) NSMutableDictionary *musicImageDic;
//当前播放的音乐模型
@property(nonatomic,strong) PlayModel *currentModel;
//当前歌曲进度监听者
@property(nonatomic,strong) id timeObserver;

@end

@implementation MusicPlayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
     self.player = [[AVAudioPlayer alloc] init];
}
//设置播放器
- (void)setPlayer {
    self.player.delegate = self;
    //设定当前音量
    self.player.volume = 0.2;
    //歌曲总播放时间 player.duration
    //已经播放时间 player.deviceCurrentTime
    //创建定时器，以便及时得到当前播放位置
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}
//进度条的位置
- (void)onTimer {
    //进度条的时间 = 播放器当前的时间
    self.playSlider = [[UISlider alloc] init];
    self.playSlider.value = self.player.currentTime;
}
- (void)setUI{
    //歌曲图片
    _musicIcon = [[UIImageView alloc] init];
    [self.view addSubview:_musicIcon];
    [_musicIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(328*kScaleW, 323.5*kScaleH));
        make.left.equalTo(self.view.mas_left).offset(23.5*kScaleW);
        make.top.equalTo(self.view.mas_top).offset(87.5*kScaleH);
    }];
    //进度条
    
    self.playSlider = [[UISlider alloc] init];
    [self.view addSubview:_playSlider];
    [_playSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(180*kScaleW);
        make.left.equalTo(self.view.mas_left).offset(70*kScaleW);
        make.bottom.equalTo(self.view.mas_bottom).offset(-84*kScaleH);
    }];
    [_playSlider addTarget:self action:@selector(progressChanged) forControlEvents:UIControlEventValueChanged];
    
    //当前播放时间
    _currentTime = [[UILabel alloc] initWithFrame:CGRectMake(322*kScaleW, 576*kScaleH, 30*kScaleW, 10*kScaleH)];
    _currentTime.textColor = [UIColor colorWithRed:117/255.0 green:134/255.0 blue:146/255.0 alpha:1.0];
    _currentTime.font = [UIFont fontWithName:@"VarelaRound" size: 14.0];
     _currentTime.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_currentTime];
   
    //总时长
       _duration = [[UILabel alloc] initWithFrame:CGRectMake(24*kScaleW, 576*kScaleH, 30*kScaleW, 10*kScaleH)];
     _duration.textAlignment = NSTextAlignmentCenter;
    _duration.textColor = [UIColor colorWithRed:117/255.0 green:134/255.0 blue:146/255.0 alpha:1.0];
    _duration.font = [UIFont fontWithName:@"VarelaRound" size: 14.0];
       [self.view addSubview:_duration];
    
    //下一首
       _nextSong = [UIButton buttonWithType:UIButtonTypeSystem];
    _nextSong.frame = CGRectMake(260*kScaleW, 440*kScaleH, 20*kScaleW, 12*kScaleH);
    [_nextSong setImage:[UIImage imageNamed:@"hou"] forState:UIControlStateNormal];
    [_nextSong addTarget:self action:@selector(NextSong) forControlEvents:UIControlEventTouchUpInside];
       [self.view addSubview:_nextSong];

       //前一首
       _preSong = [UIButton buttonWithType:UIButtonTypeSystem];
       [self.view addSubview:_preSong];
       [_preSong mas_makeConstraints:^(MASConstraintMaker *make) {
           make.size.centerY.equalTo(_nextSong);
           make.left.equalTo(self.view).offset(93*kScaleW);
       }];
       [_preSong setImage:[UIImage imageNamed:@"qian"] forState:UIControlStateNormal];
       [_preSong addTarget:self action:@selector(PreSong) forControlEvents:UIControlEventTouchUpInside];
       
    //播放/暂停
    _playBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:_playBtn];
    [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_preSong);
        make.size.mas_equalTo(CGSizeMake(33*kScaleW, 33*kScaleH));
        make.left.equalTo(self.view.mas_left).offset(172*kScaleW);
    }];
    //判断是暂停或者播放使用不同的图片
    if (self.flg) {
           [_playBtn setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
       }else {
           [_playBtn setImage:[UIImage imageNamed:@"play1"] forState:UIControlStateNormal];
       }
       [_playBtn addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
      
}
//上一曲
- (void)PreSong {
    //特判
    if (self.current == 0) {
        return;
    }
    else {
        //当前播放的歌-1
        self.current --;
    }
    //播放器播放的歌曲
    self. player = [[AVAudioPlayer alloc] initWithData:self.songArray[self.current] error:nil];
    //音乐图片
    _musicIcon.image = [UIImage imageNamed:self.songArray[self.current]];
    [self startToPlay];
    [self.playBtn setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
    self.flg = YES;
    [self startToPlay];
}
//下一曲
- (void)NextSong {
    if (self.current == self.songArray.count - 1) {
           return;
       }
       else {
           self.current ++;
       }
    self.player = [[AVAudioPlayer alloc] initWithData:self.songArray[self.current] error:nil];
    _musicIcon.image = [UIImage imageNamed:self.songArray[self.current]];
       //设置进度条的最大最小值
       [self startToPlay];
       [self.playBtn setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
    self.flg = YES;
    [self startToPlay];
}
//调整进度条
- (void)progressChanged {
    self.player.currentTime = _playSlider.value;
}
//是否播放结束
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    [self.playBtn setImage:[UIImage imageNamed:@"play1"] forState:UIControlStateNormal];
    flag = NO;
}
//播放与暂停
- (void)play {
    if (!self.flg) {
        [self startToPlay];
        [_playBtn setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
        self.flg = YES;
    }
    else {
        [self.player stop];
        [_playBtn setImage:[UIImage imageNamed:@"play1"] forState:UIControlStateNormal];
        self.flg = NO;
    }
}
//播放的相关操作
- (void)startToPlay {
    //设置进度条的最大值和最小值
    self.playSlider.maximumValue = self.player.duration;
    self.playSlider.minimumValue = 0;
    //播放
    [self.player prepareToPlay];
    [self.player play];
}
@end

//
//  MeView.h
//  Music
//
//  Created by 石子涵 on 2020/5/24.
//  Copyright © 2020 石子涵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MeView : UIView
@property (nonatomic, strong)UIImageView *backgroundImageView;
@property (nonatomic, strong)UIButton *btnHeart;
@property (nonatomic, strong)UIImageView *imgViewHeartSmall;
@property (nonatomic, strong)UIButton *btnGouGOu;
@property (nonatomic, strong)UIImageView *imgViewGouGOuSmall;
@property (nonatomic, strong)UIButton *btnMessage;
@property (nonatomic, strong)UIImageView *imgViewMessageSmall;
@property (nonatomic, strong)UIImageView *imgViewAdress;


@property (nonatomic, strong)UILabel *lblNickname;
@property (nonatomic, strong)UILabel *lblAdress;
@property (nonatomic, strong)UILabel *lblFollower;
@property (nonatomic, strong)UILabel *lblFollowerNumbers;
@property (nonatomic, strong)UILabel *lblPost;
@property (nonatomic, strong)UILabel *lblPostNumbers;
@property (nonatomic, strong)UILabel *lblFollowing;
@property (nonatomic, strong)UILabel *lblFollowingNumbers;

- (void)ViewInit;
@end

NS_ASSUME_NONNULL_END

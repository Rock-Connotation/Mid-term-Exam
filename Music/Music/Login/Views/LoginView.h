//
//  LoginView.h
//  Music
//
//  Created by 石子涵 on 2020/5/23.
//  Copyright © 2020 石子涵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginView : UIView
@property (nonatomic, strong) UIView *viewTop;
@property (nonatomic, strong) UIImageView *appIconImageView;
@property (nonatomic, strong) UITextField *userTexf;
@property (nonatomic, strong) UITextField *passWordTexf;
@property (nonatomic, strong) UILabel *forgottenPasswordLbl;
@property (nonatomic, strong) UIButton *loginBtn;

@property (nonatomic, strong) UIView *vieBottom;
@property (nonatomic, strong) UILabel *lblSign;
@property (nonatomic, strong) UILabel *lblFaceBook;
@property (nonatomic, strong) UILabel *lblTwiter;

- (void)ViewInit;
@end

NS_ASSUME_NONNULL_END

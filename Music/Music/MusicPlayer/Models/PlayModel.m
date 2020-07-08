//
//  PlayModel.m
//  Music
//
//  Created by 石子涵 on 2020/5/24.
//  Copyright © 2020 石子涵. All rights reserved.
//

#import "PlayModel.h"

@implementation PlayModel
-(instancetype)initWithDic:(NSDictionary*)dict {
    if (self = [super init]) {
        self.musicName = dict[@"name"];
        self.musicIcon = dict[@"picUrl"];
        self.duration = dict[@"dt"];
        self.musicUrl = dict[@"url"];
    }
    return self;
}
@end

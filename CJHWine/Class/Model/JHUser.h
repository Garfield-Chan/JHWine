//
//  JHUser.h
//  CJHWine
//
//  Created by Garfield on 2020/7/1.
//  Copyright © 2020 Garfield. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHAddress.h"

NS_ASSUME_NONNULL_BEGIN

@interface JHUser : NSObject<NSCoding>

//头像
@property (nonatomic, copy) NSString *headImage;
//昵称
@property (nonatomic, copy) NSString *nickName;
//名字
@property (nonatomic, copy) NSString *userName;

//性别 1男0女
@property (nonatomic, assign) BOOL sex;
//生日
@property (nonatomic, copy) NSString *birthday;
//是否开启生物识别
@property (nonatomic, assign) BOOL isTouchID;

//角标
@property (nonatomic, assign) NSInteger bageValue;
@property (nonatomic, copy) NSString *bid;

//是否登录
@property (nonatomic, assign) BOOL isLogin;
//手机号
@property (nonatomic, copy) NSString *phoneNum;

//是否开启声音
@property (nonatomic, assign) BOOL isSound;
//是否开启震动
@property (nonatomic, assign) BOOL isShake;
//是否夜间模式
@property (nonatomic, assign) BOOL isNight;

//密码
@property (nonatomic, copy) NSString *password;
//地址
@property (nonatomic, strong) NSMutableArray<JHAddress *> *address;
//默认地址
@property (nonatomic, strong) JHAddress *defaultAddress;
//城市
@property (nonatomic, copy) NSString *city;
//定位地址
@property (nonatomic, strong) NSDictionary *currentAddress;

+ (instancetype)currentUser;

@end

NS_ASSUME_NONNULL_END

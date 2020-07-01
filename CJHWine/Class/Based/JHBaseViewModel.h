//
//  JHBaseViewModel.h
//  CJHWine
//
//  Created by Garfield on 2020/6/29.
//  Copyright © 2020 Garfield. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHViewModelServices.h"
#import "JHViewModelNavigationImpl.h"

NS_ASSUME_NONNULL_BEGIN

@interface JHBaseViewModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) JHViewModelNavigationImpl *naviImpl;

- (instancetype)initWithService:(id<JHViewModelServices>)service params:(NSDictionary *)params;

/// 判断是否登录
/// @param goLogin 是否跳转到登录界面
- (BOOL)judgeWhetherLogin:(BOOL)goLogin;
@end

NS_ASSUME_NONNULL_END

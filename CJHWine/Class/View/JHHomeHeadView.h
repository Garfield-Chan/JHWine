//
//  JHHomeHeadView.h
//  CJHWine
//
//  Created by Garfield on 2020/7/2.
//  Copyright © 2020 Garfield. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JHHomeHeadView : UICollectionReusableView

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) RACSubject *bannerSubject;
@property (nonatomic, strong) RACSubject *btnSubject;

@end

NS_ASSUME_NONNULL_END

//
//  JHHomeCollectionView.h
//  CJHWine
//
//  Created by Garfield on 2020/7/2.
//  Copyright © 2020 Garfield. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHHomeViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JHHomeCollectionView : UICollectionView

@property (nonatomic, strong)NSArray *headArray;
@property (nonatomic, strong)NSMutableArray *dataArray;
@property (nonatomic, strong)JHHomeViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END

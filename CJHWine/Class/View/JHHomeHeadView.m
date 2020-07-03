//
//  JHHomeHeadView.m
//  CJHWine
//
//  Created by Garfield on 2020/7/2.
//  Copyright © 2020 Garfield. All rights reserved.
//

#import "JHHomeHeadView.h"

@interface JHHomeHeadView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) BOOL isDragging;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) UILabel *getMoney;
@property (nonatomic, strong) UILabel *allMoney;

@property (nonatomic, strong) NSMutableArray *imageArray;

@end

@implementation JHHomeHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.bannerSubject = [RACSubject subject];
        self.btnSubject = [RACSubject subject];
        self.isDragging = NO;
        [self configView];
    }
    return self;
}

- (void)configView{
    
}

@end

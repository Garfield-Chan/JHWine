//
//  JHSearchBar.m
//  CJHWine
//
//  Created by Garfield on 2020/7/2.
//  Copyright © 2020 Garfield. All rights reserved.
//

#import "JHSearchBar.h"

@interface JHSearchBar ()

@property (nonatomic, strong)UIView *view;

@end

@implementation JHSearchBar

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self configView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)configView{
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, kWidth - 100, 44)];
    _searchBar.placeholder = @"搜索";
    _searchBar.backgroundColor = [UIColor clearColor];
    _searchBar.tintColor = [UIColor whiteColor];
//    [_searchBar setSearchFieldBackgroundImage:[UIImage jh_imageWithColor:RGBA(0, 0, 0, 0)] forState:UIControlStateNormal];
    [self addSubview:_searchBar];
    
//    UITextField *searchField = [_searchBar valueForKey:@"searchField"];
//    [searchField setValue:[UIColor whiteColor] forKey:@"_placeholderLabel.textColor"];
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5;
    _searchBar.layer.masksToBounds = YES;
    _searchBar.layer.cornerRadius = 5;
}

-(void)setBgColor:(UIColor *)bgColor{
    _bgColor = bgColor;
    self.backgroundColor = bgColor;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

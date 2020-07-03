//
//  JHHomeVC.m
//  CJHWine
//
//  Created by Garfield on 2020/6/29.
//  Copyright © 2020 Garfield. All rights reserved.
//

#import "JHHomeVC.h"
#import "JHHomeCollectionView.h"
#import "JHSearchBar.h"
#import "JHHomeViewModel.h"

@interface JHHomeVC ()<UISearchBarDelegate>

@property (nonatomic, strong)JHHomeViewModel *viewModel;

@property (nonatomic, strong)JHHomeCollectionView *collectionView;
@property (nonatomic, strong)JHSearchBar *searchBar;
@property (nonatomic, strong)UIButton *leftBtn;
@property (nonatomic, strong)UIButton *rightBtn;

//collectionView是否显示
@property (nonatomic, assign)BOOL isShow;

@end

@implementation JHHomeVC

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = THEME_COLOR;
    
    [self configNavigationItem];
    [self configView];
}

-(void)viewWillAppear:(BOOL)animated{
    self.isShow = YES;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage jh_imageWithColor:RGBA(255, 255, 255, 0.01)] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

-(void)viewWillDisappear:(BOOL)animated{
    self.isShow = NO;
    
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage jh_imageWithColor:RGBA(255, 255, 255, 0.99)] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = nil;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - private methods
- (void)bindViewModel{
    [super bindViewModel];
}

- (void)configNavigationItem{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.leftBtn];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightBtn];
    
    self.navigationItem.titleView = self.searchBar;
    self.searchBar.center = CGPointMake(kWidth / 2, self.searchBar.center.y);
}

- (void)configView{
    [self.view addSubview:self.collectionView];
}

#pragma mark - search delegate



#pragma mark - lazy load
-(JHSearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar = [[JHSearchBar alloc]initWithFrame:CGRectMake(0, 0, 0, 44)];
        _searchBar.layer.cornerRadius = 5;
        _searchBar.layer.masksToBounds = YES;
        _searchBar.searchBar.delegate = self;
        
        CGRect leftViewBounds = self.navigationItem.leftBarButtonItem.customView.bounds;
        CGRect rightViewBounds = self.navigationItem.rightBarButtonItem.customView.bounds;
        CGFloat maxWidth = leftViewBounds.size.width > rightViewBounds.size.width ? leftViewBounds.size.width : rightViewBounds.size.width;
        maxWidth += 15;
        CGRect frame = _searchBar.frame;
        frame.size.width = kWidth - 2*maxWidth;
        _searchBar.frame = frame;
    }
    return _searchBar;
}

-(UIButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
        [_leftBtn setBackgroundImage:[UIImage imageNamed:@"wtksaoyisaoh"] forState:UIControlStateNormal];
        [_leftBtn.widthAnchor constraintEqualToConstant:25].active = YES;
        [_leftBtn.heightAnchor constraintEqualToConstant:25].active = YES;
    }
    return _leftBtn;
}

-(UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
        [_rightBtn setBackgroundImage:[UIImage imageNamed:@"xiaoxib"] forState:UIControlStateNormal];
        [_rightBtn.widthAnchor constraintEqualToConstant:25].active = YES;
        [_rightBtn.heightAnchor constraintEqualToConstant:25].active = YES;
    }
    return _rightBtn;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

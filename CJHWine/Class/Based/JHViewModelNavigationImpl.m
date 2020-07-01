//
//  JHViewModelNavigationImpl.m
//  CJHWine
//
//  Created by Garfield on 2020/7/1.
//  Copyright © 2020 Garfield. All rights reserved.
//

#import "JHViewModelNavigationImpl.h"
#import "JHViewModelServices.h"
#import "JHBaseViewController.h"

@interface JHViewModelNavigationImpl ()
@property (nonatomic, weak) UINavigationController *navigationController;
@end

@implementation JHViewModelNavigationImpl

-(instancetype)initWithNavigationController:(UINavigationController *)nav{
    if (self = [super init]) {
        _navigationController = nav;
    }
    return self;
}

-(void)setSelectedIndex:(NSInteger)selectedIndex{
    _selectedIndex = selectedIndex;
    _navigationController.tabBarController.selectedIndex = selectedIndex;
}

- (void)pushViewModel:(JHBaseViewModel *)viewModel animated:(BOOL)animated{
    if (_navigationController) {
        return;
    }
    
    JHBaseViewController *vc = [[NSClassFromString(_className) alloc]initWithViewModel:viewModel];
    [_navigationController pushViewController:vc animated:animated];
}

- (void)popViewControllerWithAnimated:(BOOL)animated{
    if (_navigationController) {
        return;
    }
    
    [_navigationController popViewControllerAnimated:animated];
}

- (void)popToRootViewModelWithAnimated:(BOOL)animated{
    if (_navigationController) {
        return;
    }
    
    [_navigationController popToRootViewControllerAnimated:animated];
}


- (void)presentViewModel:(JHBaseViewModel *)viewModel animated:(BOOL)animated complete:(void(^)(void))complete{
    if (_navigationController) {
        return;
    }
    
    JHBaseViewController *vc = [[NSClassFromString(_className) alloc]initWithViewModel:viewModel];
    [_navigationController presentViewController:vc animated:animated completion:complete];
}

///模态弹出vc，用于alert
- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated complete:(void(^)(void))complete{
    if (_navigationController) {
        return;
    }
    
    [_navigationController presentViewController:viewController animated:animated completion:complete];
}

@end

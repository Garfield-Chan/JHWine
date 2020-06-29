//
//  JHTabBarController.m
//  CJHWine
//
//  Created by Garfield on 2020/6/28.
//  Copyright © 2020 Garfield. All rights reserved.
//

#import "JHTabBarController.h"
#import "JHNavigationController.h"
#import "JHHomeVC.h"
#import "JHCategoryVC.h"
#import "JHFoundVC.h"
#import "JHShoppingVC.h"
#import "JHMeVC.h"

@interface JHTabBarController ()<UITabBarControllerDelegate>

@end

@implementation JHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildVC];
    self.view.backgroundColor = [UIColor greenColor];
    NSLog(@"-");
}

- (void)addChildVC{
    JHHomeVC *homeVC = [[JHHomeVC alloc]init];
    JHNavigationController *homeNavVC = [self setChildVC:homeVC title:@"首页" imageName:@"" selectedImageName:@""];
    
    JHCategoryVC *categoryVC = [[JHCategoryVC alloc]init];
    JHNavigationController *categoryNavVC = [self setChildVC:categoryVC title:@"分类" imageName:@"" selectedImageName:@""];
    
    JHFoundVC *foundVC = [[JHFoundVC alloc]init];
    JHNavigationController *foundNavVC = [self setChildVC:foundVC title:@"发现" imageName:@"" selectedImageName:@""];
    
    JHShoppingVC *shoppingVC = [[JHShoppingVC alloc]init];
    JHNavigationController *shoppingNavVC = [self setChildVC:shoppingVC title:@"购物车" imageName:@"" selectedImageName:@""];
    
    JHMeVC *meVC = [[JHMeVC alloc]init];
    JHNavigationController *meNavVC = [self setChildVC:meVC title:@"我的" imageName:@"" selectedImageName:@""];
    
    self.viewControllers = @[homeNavVC, categoryNavVC, foundNavVC, shoppingNavVC, meNavVC];
}

- (JHNavigationController *)setChildVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    JHNavigationController *navVC = [[JHNavigationController alloc]initWithRootViewController:vc];
    navVC.title = title;
    navVC.tabBarItem.image = [UIImage imageNamed:imageName];
    navVC.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    return navVC;
}

#pragma mark - delegate
-(void)setSelectedIndex:(NSUInteger)selectedIndex{
    [super setSelectedIndex:selectedIndex];
    
    NSLog(@"%lud", (unsigned long)selectedIndex);
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    CATransition *animation = [[CATransition alloc]init];
    animation.duration = .5;
    animation.type = kCATransitionFade;
    animation.subtype = kCATransitionFromRight;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];;
    animation.accessibilityFrame = CGRectMake(0, 64, kWidth, kHeight);
    [self.view.layer addAnimation:animation forKey:@"switchView"];
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

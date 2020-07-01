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

@property (nonatomic, strong) UIImageView *launchImage;



@end

@implementation JHTabBarController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setLauch];
    [self addChildVC];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(readDataFinish) name:READ_USER_DATA_FINISH object:nil];
    [self observeBageValue];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[JHUser currentUser] removeObserver:self forKeyPath:@"bageValue"];
}

#pragma mark - private methods
- (void)observeBageValue{
    @weakify(self);
    [RACObserve([JHUser currentUser], bageValue) subscribeNext:^(id x) {
        @strongify(self);
        UIViewController *vc = self.viewControllers[3];
        NSInteger value = [x integerValue];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (value > 0) {
                vc.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", value];
            }else{
                vc.tabBarItem.badgeValue = nil;
            }
        });
    }];
}

- (void)setLauch{
    self.launchImage = [[UIImageView alloc]initWithFrame:self.view.frame];
    self.launchImage.image = [UIImage imageNamed:@"top_launch"];
    self.launchImage.tag = 1000;
    [self.view addSubview:self.launchImage];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self endLaunch];
    });
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(kWidth - 80, 50, 60, 25)];
    btn.backgroundColor = [UIColor colorWithRed:(30)/255.0 green:(30)/255.0 blue:(30)/255.0 alpha:(0.7)];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.layer.cornerRadius = 9;
    btn.layer.masksToBounds = YES;
    btn.tag = 1111;
    [btn setTitle:@"跳过" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(endLaunch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)endLaunch{
    if (!self.launchImage) {
        return;
    }
    
    UIButton *btn = [self.view viewWithTag:1111];
    if (btn) {
        [btn removeFromSuperview];
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        self.launchImage.transform = CGAffineTransformMakeScale(1.3, 1.3);
        self.launchImage.alpha = 0;
    } completion:^(BOOL finished) {
        [self.launchImage removeFromSuperview];
    }];
    
    
}

- (void)addChildVC{
    JHHomeVC *homeVC = [[JHHomeVC alloc]init];
    JHNavigationController *homeNavVC = [self setChildVC:homeVC title:@"首页" imageName:@"homeNormal" selectedImageName:@"homeHight"];
    
    JHCategoryVC *categoryVC = [[JHCategoryVC alloc]init];
    JHNavigationController *categoryNavVC = [self setChildVC:categoryVC title:@"分类" imageName:@"categoryNormal" selectedImageName:@"categoryHight"];
    
    JHFoundVC *foundVC = [[JHFoundVC alloc]init];
    JHNavigationController *foundNavVC = [self setChildVC:foundVC title:@"发现" imageName:@"foundNormal" selectedImageName:@"foundHight"];
    
    JHShoppingVC *shoppingVC = [[JHShoppingVC alloc]init];
    JHNavigationController *shoppingNavVC = [self setChildVC:shoppingVC title:@"购物车" imageName:@"carNormal" selectedImageName:@"carHight"];
    shoppingNavVC.tabBarItem.badgeValue = @"99+";
    
    JHMeVC *meVC = [[JHMeVC alloc]init];
    JHNavigationController *meNavVC = [self setChildVC:meVC title:@"我的" imageName:@"meNormal" selectedImageName:@"meHight"];
    
    self.viewControllers = @[homeNavVC, categoryNavVC, foundNavVC, shoppingNavVC, meNavVC];
}

- (JHNavigationController *)setChildVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    vc.title = title;
    
    JHNavigationController *navVC = [[JHNavigationController alloc]initWithRootViewController:vc];
    navVC.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSDictionary *dic       = @{NSForegroundColorAttributeName:BLACK_COLOR,NSFontAttributeName:[UIFont systemFontOfSize:12]};
    [navVC.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    NSDictionary *selectDic = @{NSForegroundColorAttributeName:THEME_COLOR,NSFontAttributeName:[UIFont systemFontOfSize:12]};
    [navVC.tabBarItem setTitleTextAttributes:selectDic forState:UIControlStateSelected];
    navVC.tabBarController.tabBar.tintColor = THEME_COLOR;
    return navVC;
}

- (void)readDataFinish{
    
}

#pragma mark - delegate
-(void)setSelectedIndex:(NSUInteger)selectedIndex{
    [super setSelectedIndex:selectedIndex];
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

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"bageValue"]) {
        UIViewController *vc = self.viewControllers[3];
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([JHUser currentUser].bageValue > 0) {
                vc.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", [JHUser currentUser].bageValue];
            }else{
                vc.tabBarItem.badgeValue = nil;
            }
        });
    }
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

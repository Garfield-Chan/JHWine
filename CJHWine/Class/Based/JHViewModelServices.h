//
//  JHViewModelServices.h
//  CJHWine
//
//  Created by Garfield on 2020/7/1.
//  Copyright © 2020 Garfield. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JHBaseViewModel;

@protocol JHViewModelServices <NSObject>

- (void)pushViewModel:(JHBaseViewModel *)viewModel animated:(BOOL)animated;
- (void)popViewControllerWithAnimated:(BOOL)animated;
- (void)popToRootViewModelWithAnimated:(BOOL)animated;

- (void)presentViewModel:(JHBaseViewModel *)viewModel animated:(BOOL)animated complete:(void(^)(void))complete;

///模态弹出vc，用于alert
- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated complete:(void(^)(void))complete;

@end

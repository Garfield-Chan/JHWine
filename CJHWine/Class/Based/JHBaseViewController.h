//
//  JHBaseViewController.h
//  CJHWine
//
//  Created by Garfield on 2020/6/29.
//  Copyright © 2020 Garfield. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHBaseViewController : UIViewController

- (instancetype)initWithViewModel:(JHBaseViewModel *)viewModel;
- (void)bindViewModel;

@end


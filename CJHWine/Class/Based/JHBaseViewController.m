//
//  JHBaseViewController.m
//  CJHWine
//
//  Created by Garfield on 2020/6/29.
//  Copyright © 2020 Garfield. All rights reserved.
//

#import "JHBaseViewController.h"

@interface JHBaseViewController ()

@property (nonatomic, strong) JHBaseViewModel *viewModel;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactivePopTransition;

@end

@implementation JHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (instancetype)initWithViewModel:(JHBaseViewModel *)viewModel{
    if (self = [super init]) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)bindViewModel{
    RAC(self.navigationItem, title) = RACObserve(self.viewModel, title);
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

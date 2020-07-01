//
//  JHBaseViewModel.m
//  CJHWine
//
//  Created by Garfield on 2020/6/29.
//  Copyright © 2020 Garfield. All rights reserved.
//

#import "JHBaseViewModel.h"

@interface JHBaseViewModel ()

@property (nonatomic, strong) id<JHViewModelServices> services;
@property (nonatomic, strong) NSDictionary *params;

@end

@implementation JHBaseViewModel

-(instancetype)initWithService:(id<JHViewModelServices>)service params:(NSDictionary *)params{
    if (self = [super init]) {
        self.title = params[@"title"];
        self.params = params;
        self.services = service;
    }
    return self;
}

-(BOOL)judgeWhetherLogin:(BOOL)goLogin{
    if ([JHUser currentUser].isLogin) {
        return YES;
    }
    
    if (goLogin) {
        JHBaseViewModel *viewModel = [[JHBaseViewModel alloc]initWithService:self.services params:self.params];
        self.naviImpl.className = @"JHLoginVC";
        [self.naviImpl pushViewModel:viewModel animated:YES];
    }
    
    return NO;
}

@end

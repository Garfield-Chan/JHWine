//
//  JHViewModelNavigationImpl.h
//  CJHWine
//
//  Created by Garfield on 2020/7/1.
//  Copyright © 2020 Garfield. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "JHViewModelServices.h"

@interface JHViewModelNavigationImpl : NSObject<JHViewModelServices>

@property (nonatomic, copy) NSString *className;

//tabbar index
@property (nonatomic, assign) NSInteger selectedIndex;

- (instancetype)initWithNavigationController:(UINavigationController *)nav;

@end

